---
layout: note
title: Variables
tags:
  - go
---

Learning notes from reading Go book.

## Defining Variables

Go has two ways of defining types. The rules outlined are:

- Only use explicit form when not initializing the variable.
- Use implicit when declaring and initializing.

```golang
  absoluteZero := -459.67 // Implicit
  var hardWater int = 0 // Explicit
  gassyWater := int32(100) // Mixed
```

## Convert Types

```golang
  fmt.Printf("%T\n", int64(gassyWater)) // int64
```

## Naming Variables

- No spaces.
- Letters, numbers, underscores, only.
- Cannot begin with a number.

Capitalizing a variable has meeting:

- `Email` is exported.
- `TitleCase` is idiomatic.
- `email` is private.
- `camelCase` is idiomatic.

## `const`

The keyword for constant variables is `const`. Constants can be declared with or without a type. Those declared with a type will not be coerced into another type.

```golang
const (
  year = 365 // untyped
  leapYear = int32(366) // typed
)

fmt.Println(int64(2) _ year) // 730
// Throws an error:
fmt.Println(int64(2) _ leapYear) // 732
```

## Arrays

Arrays are defined with a size, a type, and then values.

**Arrays cannot change size! See Slices**

```golang
colours := [3]string{"Red", "Green", "Blue"}
fmt.Println(colours[0]) // Red
```

Convert an Array to a slice:

```golang
colourSlice := colours[:]
colourSlice = append(colourSlice, "Yellow")
fmt.Println(colourSlice) // [Red Green Blue Yellow]
```

## Slices

Slices are more how I think of Arrays. Dynamically resizable. Less C-like.

```golang
fish := []string{"Goldfish", "Bass", "Pike"}
fish = append(fish, "Salmon")
fmt.Println(fish[1]) // Bass
fmt.Println(len(fish)) // 4
```

**TODO:** How to shift, pop, slice?

## Maps

Maps are like hashes.

```golang
foods := map[string]string{"Orange": "Fruit", "Lettuce": "Vegetable"}
fmt.Println(foods["Orange"]) // Fruit

```

## Control Flow

### Conditional Flow

Conditionals do not require parenthesis, and GO uses `else if`.

```golang
if balance < 0 {
  // In debt.
} else if balance == 0 {
  // flat broke
} else {
  // Some cash.
}
```

Switches can be used on strngs:

```golang
for _, colour := range colours {
  switch colour {
    case "Blue":
      fmt.Println(colour, " is my favorite")
    case "Black":
      fmt.Println(colour, " is hot in the sun!")
    default:
      fmt.Println(colour, " is a colour")
  }
}
```

Anonymous `switch` can be used for ranges:

```golang
randInt := rand.Intn(100)
switch {
  case randInt < 50:
    fmt.Println("Low", randInt)
  case randInt >= 50:
    fmt.Println("High ", randInt)
}
```

### Loops

Iterating over a Map:

```golang
for k, v := range foods {
  fmt.Printf("%q is a %q\n", k, v) // Orange is a Fruit\n
}
```

Getting just the keys by omitting the value variable:

```golang
for k := range foods {
  fmt.Println(k) // Orange
}
```

For loops are similar to other languages with 3 parts:

```golang
for i := 0; i < 5; i++ {
  // Do something.
  continue; // Skips this loop.
  break; // Exits loop
}
```

Checking key existence requires a second return value:

```golang
orangeValue, orangeOk := foods["Orange"]
fmt.Printf("%q => %t\n", orangeValue, orangeOk) // "Fruit" => true
notFoundValue, notFoundOk := foods["notFound"]
fmt.Printf("%q => %t\n", notFoundValue, notFoundOk) // "" => false
```

Deleting keys is a function:

```golang
vegs := foods
delete(vegs, "Orange")
fmt.Println(vegs)
```

## Strings

Backticks are how to define strings with no interpretation:

```golang
fmt.Println(`A "string" literal!\n`) // A "string" literal!\n
```

Strings are added to contatenate.

```golang
pet := "little lamb"
fmt.Println("Mary had a " + pet) // Mary had a little lamb
```

## `strings`

```golang
fmt.Println(strings.ToUpper("Mark the Shark")) // MARK THE SHARK
fmt.Println(strings.ToLower("Mark the Shark")) // mark the shark
fmt.Println(strings.Contains("Mark the Shark", "the")) // true
fmt.Println(len("Mark the Shark")) // 14
fmt.Println(Strings.Join(fish, ", "))
fmt.Println(strings.ReplaceAll(pet, "l", "m")) // mittme mamb
```

In `fmt.Printf`, some characters have special meaning

- `%q` - Prints info about the item being printed.
- `%T` - Prints the type of the variable.

```golang
fmt.Printf("%q", foods) // map["Lettuce":"Vegetable" "Orange":"Fruit"]
fmt.Printf("%T, %T, %T\n", absoluteZero, hardWater, gassyWater) // float64, int, int32
```

## `strconv`

`strconv` can be use to convert strings to numbers.

```golang
parsedFloat, _ := strconv.ParseFloat("12.34", 64)
fmt.Printf("%T\n", parsedFloat) // float64
```

## `sort`

Can sort a list of strings:

```golang
sort.Strings(fish)
fmt.Println(strings.Join(fish, ", ")) // Bass, Goldfish, Pike, Salmon
```

**IMPORTANT** Sorts in Go modify the existing array. They do not make a copy. Beware!

## Panics

Panics are exceptions. Most of the time you should be anticipating a panic, but if you are, you can use `recover()` to catch the issue.

```golang
func catchPanic() {
  defer func() {
    if err := recover(); err != nil {
      fmt.Println("Panic occurred: ", err)
    }
  }()
  panic("This is a panic!")
}

catchPanic() // Panic occurred: This is a panic!
```

## Packages

Packages in go similar to a class, but more functional than OOP.

Just to reiterate, any TitleCase variables or methods will be exported, while lowercase will not. This applies to types, functions, and variables defined at the package scope.

Take, for example, a `beverage` package:

```golang
package beverage // LOWER CASE!

// Beverage is an example of a type in Go.
type Beverage struct { // UPPER CASE!
  Name string
  hot bool
}

// NewBeverage is like a class method which will hang off of Beverage.
func New(name string, hot bool) *Beverage {
  return &Beverage{
    Name: name,
    Hot: hot,
  }
}

// Print is like an instance method.
func (b *Beverage) Print() {
  fmt.Printf("Beverage \"%s\" is served hot: %t\n", b.Name, b.Hot)
}
```

It appears, at first glass, that `Beverage.New()` would be a function, but it is not. In fact, `New()` is a function within the `beverage` package.

To use Beverage:

```golang
package main

import "beverage"

func main() {
  c := beverage.New("Coffee", true) // Package name, not type name.
  c.Print() // Beverage "Coffee" is served hot: true
  m := beverage.New("Mountain Dew", true)
  m.Hot = false // Hot Mt. Dew? Gross!
  m.Print() // Beverage "Mountain Dew" is served hot: false
}
```

## Methods

Go supports a variadic function, accepting 0 or more arguments.

```golang
func sayHello(names ...string) {
  for _, n := range names {
    fmt.Printf("Hello, %s!\n", n)
  }
}
```

Variadic functions can also accept named arguments in addition to the catch-all, but the variadic value must be the last argument.

```golang
func join(delimiter string, values ...string) string {
  // do stuff.
}
```

If you're passing a slice as arguments to a function, you can expand the arguments with ellipses:

```golang
names := []string{"Sammy", "Jessica", "Drew"}
line = join(",", names...)
```

### Defer

Defer defines a function which is called after the End of a given function. If multiple `defer` functions are defines, they are executed in reverse order.

```golang
func main() {
  defer fmt.Println("Bye")
  defer fmt.Println("Goodbye")
  fmt.Println("Hi")
} // Hi\nGoodbye\nBye
```

## Sample

<script src="https://gist.github.com/exegeteio/837bef33db4de3d6e440182f42f05940.js"></script>

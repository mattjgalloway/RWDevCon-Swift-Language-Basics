# 201: Swift Language Basics, Part 2: Demo Instructions

## Introduction

Open Xcode and select **File\New\Playground…**. Call it **ASwiftIntro.playground** and save it somewhere.

Delete everything except:

    import UIKit

## Step 1 – Variables, strings and string interpolation

Type:

    var conference: String = "RWDevCon"

This is a variable definition.

Type:

    println("The best conference is \(conference)")

This is printing out a line (NSLog) and this is using string interpolation.

Add the following line above the println:

    conference = "WWDC"

We’ve changed the variable to a new value.

Change the top line to:

    let conference: String = "RWDevCon"

There’s now an error, because you can’t reassign ‘let’ variables.

Remove:

    conference = "WWDC"

## Step 2 – Collections, optionals, tuples

Type:

    var animals: [String] = ["Dog", "Cat", "Mouse", "Horse"]

This is an array. It's declared as 'var', so we can add to it.

Type:

    animals.append("Cow")

See, we added to the array. If you change 'var' to 'let' then this line will show an error.

Type:

    animals.append(123)

The error comes from the fact that the array is an array of Strings, but we're trying to add an Int. That doesn't work. Collections are typed in Swift.

Type:

    for animal: String in animals {
      println(animal)
    }

This is fast enumeration in Swift.

Turn on assistant editor - **View\Assistant Editor\Show Assistant Editor** - to see the output from the printing.

Now time to introduce optionals. Variables we’ve seen so far have always had values.

Type:

    var nonOptionalString: String = "Dogs Are Fun"
    nonOptionalString = nil

The last line has an error because you can’t set a variable to nil. That is, unless it’s an optional.

Type:

    var optionalString: String? = "Dogs Are Fun"
    optionalString = nil

The type of this variable is an “Optional String”, which can either be a String or nil.

Let’s now move back to collections – dictionaries this time.

Type:

    let farmAnimals: [String:Int] = ["Dog":2, "Cat":0, "Cow":100]

This is a Dictionary in Swift. This is a `Dictionary` from `String` to `Int`.

Type:

    let animal: String = "Dog"
    let numberOfAnimals: Int? = farmAnimals[animal]

Here we're accessing the Dictionary through its subscript to obtain the value for a given key, which is an optional because a value may not exist for that key.

Type:

    println("I have \(numberOfAnimals) \(animal)s")

This prints `"I have Optional(2) Dogs"` because the value returned from the subscript is an optional.

Type:

    println("I have \(numberOfAnimals!) \(animal)s")

This is forced unwrapping of the optional. This means that the optional's value is taken instead of the optional itself.

Change the animal variable to:

    let animal: String = "Mouse"

All hell breaks loose because the optional is now its 'nil' case, and it tries to unwrap that and we get a runtime crash. So this sort of unwrapping is unsafe - do it only when you know the optional can't be nil.

Wrap the println like so:

    if numberOfAnimals != nil {
      println("I have \(numberOfAnimals!) \(animal)s")
    }

This fixes the problem, but we can do better. We can use optional binding to make things a lot cleaner.

Type:

    if let numberOfAnimals: Int = farmAnimals[animal] {
      println("I have \(numberOfAnimals) \(animal)s")
    }

This sets a variable called 'count' local to the if-statement. The if-statement will only enter if 'count' is non-nil. Inside the if-statement, 'count' can be used as the unwrapped optional - i.e. it's not an optional in here. It's the concrete value.

Type:

    let tuple: (String, Int) = ("RWDevCon", 180)
    println("\(tuple.0), \(tuple.1)")

This is a tuple. It’s a collection of values in a lightweight data structure. The data structure doesn’t need to be defined upfront like you would have done with a class in Objective-C.

Type:

    let namedTuple: (foo: String, bar: Int) = ("RWDevCon", 180)
    println("\(namedTuple.foo), \(namedTuple.bar)")

You can also name the values of a tuple.

Type:

    for (key: String, value: Int) in farmAnimals {
      println("\(key) => \(value)")
    }

Tuples are used when enumerating a dictionary. The key and value are wrapped up into a tuple.

## Step 3 – Introducing Tic Tac Toe

Type:

    enum Player {
      case X
      case O
    }

This is an `Enum` in Swift. It's much like `NS_ENUM` from Objective-C, but much more powerful as we'll see.

Type:

    struct Position {
      var column: Int
      var row: Int
    }

This is a Struct in Swift. It's like a class, in that it has members, but it is a value type.

Type:

    var pos1: Position = Position(column: 0, row: 0)
    var pos2: Position = pos1

This sets up two `Position` variables.

Type:

    pos1.column = 1
    println(pos1.column)
    println(pos2.column)

Only `pos1` has `column` set to 1. This is because `Struct`s are value types. When you assign a `struct` variable it takes a copy. If this were a class, then `pos1.column` would equal `pos2.column`.

Add the following method to Position:

    func asString() -> String {
      return "\(column):\(row)"
    }

Structs can have methods just like classes can.

Type:

    println(pos1.asString())

We're using the method we just added to the struct.

We're going to want to use this struct as the key in a `Dictionary`. To do this, it needs to be `Hashable`. `Hashable` is a protocol in Swift. `Struct`s can implement protocols too.

Change Position definitions to:

    struct Position: Hashable

It tells us we need to implement a few methods. The first is 'hashValue', a computed property.

Add the following method to Position:

    var hashValue: Int {
      return column * 10 + row
    }

This is just like 'hash' from `NSObject` in Objective-C.

One more thing needs adding for the `Hashable` protocol conformance. We need to know when two Position objects are equal. `Hashable` extends `Equatable`. To do this we need to use operator overloading.

Type:

    func ==(lhs: Position, rhs: Position) -> Bool {
      return lhs.column == rhs.column && lhs.row == rhs.row
    }

This is a top-level function. It's called `==` and takes two values - the left hand side and the right hand side of the operator, and returns a Boolean. It's equal if the left hand side row and column equal the right hand side row and column.

Type:

    if pos1 == pos2 {
      println("They're equal")
    } else {
      println("They're not equal")
    }

It's worked. Now let's use the struct in a dictionary.

Type:

    var turns: [Position:Player] = [:]

This created an empty dictionary. We've had to specify the type because type inference can't work out what types we want if the dictionary is empty.

Type:

    turns[pos1] = Player.X
    turns[pos2] = .O

We've used the struct as the key of the dictionary. The value is a `Player` enum. Notice the different ways of accessing the enum. In the second case we’re just using the `.O` because the compiler knows to look inside the `Player` enum because it knows that’s going to be the type of the value already.

This makes the start of the Tic Tac Toe game. You'll build on this in the lab and challenge. The Position struct is the position on the game board and the `Player` enum is X or O.

One more thing. Type inference.

Go back to the top of the file and remove the `: String` from the first line.

Explain that it still works as expected. This is because the compiler infers the type.

Challenge people to go through and remove various type annotations and see what happens.

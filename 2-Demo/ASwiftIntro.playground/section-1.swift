// Playground - noun: a place where people can play

import UIKit

// STEP 1 - Variables, strings, string interpolation

let conference = "RWDevCon"
println("The best conference is \(conference)")





// STEP 2 - Numbers, control flow

let attendees = 1_000
let cakes = 850

let cakesPerAttendee = Double(cakes) / Double(attendees)

if cakesPerAttendee > 0.5 {
  println("At least half the attendees will get a cake.")
} else {
  println("All hell will break loose!")
}





// STEP 3 - Collections, optionals, tuples

var animals = ["Dog", "Cat", "Mouse", "Horse"]

animals.append("Cow")

//animals.append(123)

for animal in animals {
  println(animal)
}

let animalCounts = ["Dog":2, "Cat":0, "Cow":100]

let animal = "Mouse"
let count = animalCounts[animal]

if count != nil {
  println("I have \(count!) \(animal)s")
}

if let count = animalCounts[animal] {
  println("I have \(count) \(animal)s")
}

for (key, value) in animalCounts {
  println("\(key) => \(value)")
}




// STEP 4 - Introducing Tic Tac Toe

enum Player {
  case X
  case O
}

struct Position: Hashable {
  let column: Int
  let row: Int

  func asString() -> String {
    return "\(column):\(row)"
  }

  var hashValue: Int {
    return row * column
  }
}

func ==(lhs: Position, rhs: Position) -> Bool {
  return lhs.row == rhs.row && lhs.column == rhs.column
}

//var pos1 = Position(column: 0, row: 0)
//var pos2 = pos1
//
//pos1.column = 1
//println(pos1.column)
//println(pos2.column)

let pos1 = Position(column: 0, row: 0)
let pos2 = Position(column: 0, row: 1)
println(pos1.asString())

if pos1 == pos2 {
  println("They're equal")
} else {
  println("They're not equal")
}

var turns: [Position:Player] = [:]

turns[pos1] = .X
turns[pos2] = .O

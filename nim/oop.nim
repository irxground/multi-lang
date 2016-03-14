type
  Animal = ref object of RootObj
  Dog = ref object of Animal
  Cat = ref object of Animal

method hello(a: Animal): string {.base.} =
  discard

method hello(dog: Dog): string =
  return "Bark"

method hello(cat: Cat): string =
  return "Meow"

var animals = [Dog(), Cat()]
for a in animals:
  echo a.hello()


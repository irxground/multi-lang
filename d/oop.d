import std.stdio;

abstract class Animal {
  public abstract string hello();
}

class Dog : Animal {
  public override string hello() {
    return "Bark";
  }
}

class Cat : Animal {
  public override string hello() {
    return "Meow";
  }
}

void main() {
  auto animals = [new Dog(), new Cat()];
  foreach (a; animals) {
    writeln(a.hello());
  }
}

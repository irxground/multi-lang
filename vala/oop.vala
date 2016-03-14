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
  Animal[] animals = {new Dog(), new Cat()};
  foreach (Animal a in animals) {
    print("%s\n", a.hello());
  }
}

abstract class Animal
  abstract def hello
end

class Dog < Animal
  def hello
    "Bark"
  end
end

class Cat < Animal
  def hello
    "Meow"
  end
end

animals = [Dog.new, Cat.new]
animals.each do |a|
  puts a.hello
end

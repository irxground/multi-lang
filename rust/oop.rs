trait Animal {
    fn hello(&self) -> String;
}

struct Dog;
impl Animal for Dog {
    fn hello(&self) -> String {
        String::from("Bark")
    }
}

struct Cat;
impl Animal for Cat {
    fn hello(&self) -> String {
        String::from("Meow")
    }
}

fn main() {
    let animals = [&Dog as &Animal, &Cat as &Animal];
    for a in &animals {
        println!("{}", a.hello());
    }
}

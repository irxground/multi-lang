#include <stdlib.h>
#include <stdio.h>

struct Animal;

typedef struct {
  char * (*hello)(struct Animal*);
} Animal_VTable;

typedef struct Animal {
  Animal_VTable *vtable;
} Animal;

char * Dog_hello(Animal *dog) {
  return "Bark";
}

Animal_VTable Dog_VTable = {
  .hello = Dog_hello
};

typedef struct {
  Animal inherit;
} Dog;

Dog *newDog() {
  Dog *dog = (Dog*)malloc(sizeof(Dog));
  dog->inherit.vtable = &Dog_VTable;
  return dog;
}

char * Cat_hello(Animal *cat) {
  return "Meow";
}

Animal_VTable Cat_VTable = {
  .hello = Cat_hello
};

typedef struct {
  Animal inherit;
} Cat;

Cat *newCat() {
  Cat *cat = (Cat*)malloc(sizeof(Cat));
  cat->inherit.vtable = &Cat_VTable;
  return cat;
}

int LEN = 2;
int main(void) {
  Animal** animals = (Animal**) malloc(LEN * sizeof(Animal*));
  animals[0] = (Animal*) newDog();
  animals[1] = (Animal*) newCat();

  for (int i = 0; i < LEN; i++) {
    Animal *a = animals[i];
    printf("%s\n", a->vtable->hello(a));
  }

  for (int i = 0; i < LEN; i++)
    free(animals[i]);
  free(animals);
}

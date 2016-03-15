import std.stdio : write, writeln;
import std.conv : to;
import std.algorithm.iteration : map, reduce;
import std.algorithm.comparison : max;

void main(string[] args) {
  if (args.length == 1) {
    return;
  }
  // TODO: support invalid arguments
  auto values = args[1..$].map!(str => to!int(str));
  auto max = values.reduce!(max);
  auto table = sieve(max);
  foreach(num; values) {
    if (table[num]) {
      write("Yes ");
    } else {
      write("No ");
    }
  }
  writeln();
}

bool[] sieve(int n) {
  auto array = new bool[n + 1];
  for (int i = 2; i < array.length; i++) {
    array[i] = true;
  }
  for (int i = 2; i < array.length; i++) {
    if (!array[i]) {
      continue;
    }
    for (int j = i * i; j < array.length; j += i) {
      array[j] = false;
    }
  }
  return array;
}

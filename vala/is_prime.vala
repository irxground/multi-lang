int main(string[] args) {
  if (args.length == 1) {
    return 0;
  }
  int[] values = new int[args.length - 1];
  int max = 0;
  for (int i = 0; i < values.length; i++) {
    int v = int.parse(args[i + 1]);
    values[i] = v;
    if (v > max) max = v;
  }
  bool[] table = sieve(max);
  foreach(int num in values) {
    if (table[num]) {
      print("Yes ");
    } else {
      print("No ");
    }
  }
  print("\n");
  return 0;
}

bool[] sieve(int n) {
  bool[] array = new bool[n + 1];
  array[0] = false;
  array[1] = false;
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

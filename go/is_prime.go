package main

import(
	"fmt"
	"os"
	"strconv"
)

func main() {
	if len(os.Args) == 0 {
		return
	}

	values := make([]int, len(os.Args) - 1)
	max := -1;
	for i := 0; i < len(values); i++ {
		v, _ := strconv.Atoi(os.Args[i + 1])
		values[i] = v
		if v > max {
			max = v
		}
	}
	prime_table := sieve(max)
	for _, num := range(values) {
		if prime_table[num] {
			fmt.Print("Yes ")
		} else {
			fmt.Print("No ")
		}
	}
	fmt.Println()
}

func sieve(max int) []bool {
	array := make([]bool, max + 1)
	for i := 2; i < len(array); i++ {
		array[i] = true
	}
	for i := 2; i < len(array); i++ {
		if !array[i] {
			continue
		}
		for j := i * i; j < len(array); j += i {
			array[j] = false
		}
	}
	return array
}

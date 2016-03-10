use std::env;

fn sieve(n: usize) -> Vec<bool> {
    let mut v = vec![true; n + 1];
    v[0] = false;
    v[1] = false;
    for i in 2 .. v.len() {
        if v[i] == false {
            continue;
        }
        let mut j = i * i;
        while j < v.len() {
            v[j] = false;
            j += i;
        }
    }
    return v;
}

fn main() {
    let values: Vec<usize> = env::args().skip(1).map(|s: String| s.parse().unwrap()).collect();
    if values.len() == 0 {
        return;
    }
    let max = values.iter().max().unwrap().clone();
    let prime_table = sieve(max);
    for i in &values {
        if prime_table[*i] {
            print!("Yes ");
        } else {
            print!("No ");
        }
    }
    println!("");
}


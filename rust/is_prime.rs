use std::env;

fn sieve(n: usize) -> Vec<bool> {
    let mut v = vec![true; n + 1];
    v[0] = false;
    if v.len() > 1 {
        v[1] = false;
    }
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
    let values: Vec<Option<usize>> = env::args().skip(1).map(|s| s.parse().ok()).collect();
    if values.len() == 0 {
        return;
    }
    let max: usize = values.iter().filter_map(|x| *x).max().unwrap_or(0);
    let prime_table = sieve(max);
    for &x in &values {
        if let Some(i) = x {
            if prime_table[i] {
                print!("Yes ");
            } else {
                print!("No ");
            }
        } else {
            print!("Err ");
        }
    }
    println!("");
}

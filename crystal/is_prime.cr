exit if ARGV.empty?
values = ARGV.map(&.to_i?)

max = values.compact.max? || 0
prime_table = sieve(max)
values.each do |num|
  if num
    if prime_table[num]
      print "Yes "
    else
      print "No "
    end
  else
    print "Err "
  end
end
puts ""

def sieve(n): Array(Bool)
  array = Array.new(n + 1, true)
  array[0] = false
  array[1] = false if array.size > 1
  2.upto(array.size - 1) do |i|
    next unless array[i]
    j = i * i
    while j < array.size
      array[j] = false
      j += i
    end
  end
  array
end

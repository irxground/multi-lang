
values = ARGV.map(&.to_i)
exit if values.empty?

max = values.max
prime_table = sieve(max)
values.each do |num|
  if prime_table[num]
    print "Yes "
  else
    print "No "
  end
end
puts ""

def sieve(n): Array(Bool)
  array = Array.new(n + 1, true)
  array[0] = false
  array[1] = false
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

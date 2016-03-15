from strutils import parseInt
from os import paramCount, paramStr
from sequtils import foldl

proc sieve(n: int): seq[bool] =
  var table = newSeq[bool](n + 1)
  for i in 2..high(table):
    table[i] = true
  for i in 2..high(table):
    if not table[i]:
      continue
    var j = i * i
    while j < table.len:
      table[j] = false
      j += i
  return table

if paramCount() == 0:
  quit()

var values = newSeq[int](paramCount())
for i in 0..high(values):
  values[i] = parseInt(paramStr(i + 1))

let maxValue = foldl(values, max(a, b))
let primeTable = sieve(maxValue)
for num in values:
  if primeTable[num]:
    write(stdout, "Yes ")
  else:
    write(stdout, "No ")
echo ""

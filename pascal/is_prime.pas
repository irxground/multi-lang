program IsPrime;

uses
  sysutils,
  math;

type
  BoolArray = Array of Boolean;

function Sieve(N: LongInt): BoolArray;
var
  I, J: LongInt;
begin
  SetLength(Sieve, N + 1);
  for I := 2 to N do
    Sieve[I] := True;
  for I := 2 to N do
    begin
      if not Sieve[N] then
        continue;
      J := I * I;
      while J <= N do
        begin
          Sieve[J] := False;
          J := J + I;
        end;
    end;
end;

var
  N, I, Max: LongInt;
  Values: Array of LongInt;
  PrimeTable: BoolArray;
begin
  N := ParamCount();
  if N = 0 then
    exit;

  SetLength(Values, N);
  for I := 0 to N - 1 do
    Values[I] := StrToInt(ParamStr(I + 1));

  Max := MaxValue(Values);
  PrimeTable := Sieve(Max);

  for I := 0 to N - 1 do
    begin
      if I <> 0 then
        Write(' ');
      if PrimeTable[Values[I]] then
        Write('Yes')
      else
        Write('No');
    end;
  WriteLn('');
end.

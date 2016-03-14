{$mode objfpc}{$H+}

type
  TAnimal = class(TObject)
  public
    function hello: String; virtual; abstract;
  end;

  TDog = class(TAnimal)
  public
    function hello: String; override;
  end;

  TCat = class(TAnimal)
  public
    function hello: String; override;
  end;

function TDog.hello: String;
begin
  Result := 'Bark'
end;

function TCat.hello: String;
begin
  Result := 'Meow'
end;

var
  Animals: array[0..1] of TAnimal;
  A: TAnimal;
begin
  Animals[0] := TDog.Create;
  Animals[1] := TCat.Create;
  for A in Animals do
    WriteLn(A.hello())
end.

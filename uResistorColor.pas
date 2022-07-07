unit uResistorColor;

interface

  type TResistor = class
    const
      ColorsList : array[0..9] of string = ('black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white');
    class function colorCode(const AColorName : string) : Integer;
    class function colors() : TArray<string>;
  end;

implementation

  uses
    StrUtils;

  class function TResistor.colors() : TArray<string>;
    var
      ADynArray : TArray<string>;
    begin
      // cf. : http://www.delphigroups.info/2/91/524142.html
      SetLength(ADynArray, Length(self.ColorsList));
      Move(self.ColorsList, ADynArray[0], Length(self.ColorsList) * SizeOf(self.ColorsList[0]));
      Result := ADynArray;
    end;

  class function TResistor.colorCode(const AColorName : string) : Integer;
    begin
      Result := IndexStr(AColorName, self.ColorsList);
    end;
end.

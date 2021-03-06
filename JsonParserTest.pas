// WARNING - This code assumes you have access to TStringList, WriteLn, IntToStr, Length and Format from PascalScript

{$INCLUDE JsonParser.pas}

var
  Source, Lines: TStringList;
  JsonParser: TJsonParser;
  I, J: Integer;

begin
  for I := 1 to 5 do
  begin
    WriteLn(IntToStr(I));
    Source := TStringList.Create;
    Source.LoadFromFile(Format('Test%.2d.json', [I]));
    ClearJsonParser(JsonParser);
    ParseJson(JsonParser, Source.Text);
    Source.Free;
    for J := 0 to Length(JsonParser.Output.Errors) - 1 do
      WriteLn(JsonParser.Output.Errors[J]);
    Lines := TStringList.Create;
    PrintJsonParserOutput(JsonParser.Output, Lines);
    Lines.SaveToFile(Format('Test%.2d.txt', [I]));
    Lines.Free;
  end;
end.

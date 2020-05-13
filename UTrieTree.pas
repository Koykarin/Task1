unit UTrieTree;

interface
uses
  UTrieNode, Classes,ComCtrls;
type
	TTrieTree = class
		private
			root: TNode;
		public
			constructor Create;
			procedure push(s :string);
			function getAllWords(s: string; n: integer): TStrings;
      procedure print(treeView:TTreeView);
      destructor Destroy; override;
      function LoadFromFile(FileName: string): Boolean;
	end;

implementation

constructor TTrieTree.Create;
begin
	inherited;
	root := TNode.Create;
end;

procedure TTrieTree.push(s: string);
begin
	if s<>'' then
    root.push(s);
end;

function TTrieTree.getAllWords(s: string; n: integer): TStrings;
begin
  result := TStringList.Create;
  root.getAllWordsOf(copy(s,1,length(s)-n), '', result);
end;

procedure TTrieTree.print(treeView:TTreeView);
begin
  treeView.Items.Clear;
  root.print(treeView, nil);
end;

destructor TTrieTree.Destroy;
begin
  root.Free;
  inherited;
end;

function NextWord(str: string; var i: Integer): String;
var l: integer;
begin
  l:= length(str);
  while (i<l) and not (str[i] in ['a'..'z']) do
    inc(i);
  Result:='';
  while (i<l) and (str[i] in ['a'..'z']) do
  begin
    Result:= result + str[i];
    inc(i);
  end;
end;

function TTrieTree.LoadFromFile(FileName: string): Boolean;
var F: TextFile;
    str, wrd: string;
    i, len: integer;
begin
  AssignFile(f, FileName);
  Reset(f);
  Result:= True;
  while not Eof(f) do
  begin
    Readln(f, str);
    len:= length(str);
    i:=1;
    while i<= len do
    begin
      wrd:= NextWord(str, i);
      if wrd<>'' then
        push(wrd)
      else
        inc(i);
    end;
  end;
  CloseFile(f);
end;

end.


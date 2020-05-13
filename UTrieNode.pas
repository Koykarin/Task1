unit UTrieNode;

interface
uses Classes, ComCtrls;
type
	TIndex = 'a'..'z';

	TNode = class
  private
    ptrs : array[TIndex] of TNode;
    eow : integer;
  public
      constructor Create;
		  procedure push(s: string);
      procedure getAllWordsOf(word: string; strToPush: string; var list: TStrings);
      procedure print(treeView: TTreeView; parent:TTreeNode);
      destructor Destroy; override;
      function GetEow: Integer;
	end;

implementation

uses SysUtils;

constructor TNode.Create;
var
	i: TIndex;
begin
	inherited;
	self.eow :=0;
	for i:=low(TIndex) to high(TIndex) do
			ptrs[i] := nil;
end;

procedure TNode.getAllWordsOf(word: string; strToPush: string; var list: TStrings);
var
  i: Char; n: integer; ok: Boolean;
begin
  if word = '' then
    begin
      if eow<>0 then
        list.Add(strToPush + ' - ' + IntToStr(eow));
      for i:= Low(TIndex) to high(TIndex) do
        if ptrs[i] <> nil then
          ptrs[i].getAllWordsOf(word, strToPush + i, list);
    end
  else
    if ptrs[word[1]] <> nil then
      ptrs[word[1]].getAllWordsOf(Copy(word,2,Length(word)),strToPush + word[1], list);
end;

procedure TNode.print(treeView: TTreeView; parent:TTreeNode);
var
  i:Char;
  newParent: TTreeNode;
begin
  for i:= Low(TIndex) to high(TIndex) do
      if ptrs[i]<>nil then
        begin
          newParent := treeView.Items.AddChild(parent, i);
          ptrs[i].print(treeView, newParent);
        end;
end;

procedure TNode.push(s: string);
begin
  if s = '' then
    Inc(eow)
  else
    begin
      if ptrs[s[1]] = nil then
        ptrs[s[1]] := TNode.Create;
      ptrs[s[1]].push(Copy(s,2,Length(s)));
    end;
end;

destructor TNode.Destroy;
var
  i:TIndex;
begin
  for i:=Low(TIndex) to High(TIndex) do
      ptrs[i].Free;
  inherited;
end;

Function TNode.GetEow: Integer;
begin
  Result:= eow;
end;

end.

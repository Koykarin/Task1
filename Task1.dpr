program Task1;

uses
  Forms,
  UMainForm in 'UMainForm.pas' {MainForm},
  UTrieNode in 'UTrieNode.pas',
  UTrieTree in 'UTrieTree.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.

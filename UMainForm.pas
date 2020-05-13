unit UMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, UTrieTree, Spin;

type
  TMainForm = class(TForm)
    grp1: TGroupBox;
    treeView: TTreeView;
    grp2: TGroupBox;
    resultMmo: TMemo;
    btnOpenFIle: TButton;
    btnPrintFile: TButton;
    dlgOpen: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnOpenFIleClick(Sender: TObject);
    procedure PrintClick(Sender: TObject);
  private
    tree: TTrieTree;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  tree := TTrieTree.Create();
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  tree.Free;
end;

procedure TMainForm.btnOpenFIleClick(Sender: TObject);
var FileName: string;
begin
  dlgOpen.InitialDir := GetCurrentDir;
  if dlgOpen.Execute then
    begin
      FileName := dlgOpen.FileName;
      tree.LoadFromFile(FileName);
    end;
  tree.print(treeView)
end;

procedure TMainForm.PrintClick(Sender: TObject);
var
  input: string;
  formLen: integer;
begin
  resultMmo.Lines := tree.getAllWords(input, formLen);
end;

end.

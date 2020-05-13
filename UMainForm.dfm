object MainForm: TMainForm
  Left = 813
  Top = 236
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'MainForm'
  ClientHeight = 556
  ClientWidth = 601
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object grp1: TGroupBox
    Left = 0
    Top = 40
    Width = 321
    Height = 513
    Caption = 'TrieTree'
    TabOrder = 0
    object treeView: TTreeView
      Left = 0
      Top = 16
      Width = 321
      Height = 497
      Indent = 19
      TabOrder = 0
    end
  end
  object grp2: TGroupBox
    Left = 328
    Top = 40
    Width = 273
    Height = 513
    Caption = 'Result'
    TabOrder = 1
    object resultMmo: TMemo
      Left = 0
      Top = 16
      Width = 273
      Height = 505
      Enabled = False
      TabOrder = 0
    end
  end
  object btnOpenFIle: TButton
    Left = 8
    Top = 8
    Width = 73
    Height = 25
    Caption = 'OpenFIle'
    TabOrder = 2
    OnClick = btnOpenFIleClick
  end
  object btnPrintFile: TButton
    Left = 96
    Top = 8
    Width = 65
    Height = 25
    Caption = 'PrintFile'
    TabOrder = 3
    OnClick = PrintClick
  end
  object dlgOpen: TOpenDialog
    Filter = 'Text files (*.txt)|*.txt'
    InitialDir = 'GetCurrentDir'
    Options = [ofHideReadOnly, ofNoChangeDir, ofEnableSizing]
    Left = 232
    Top = 8
  end
end

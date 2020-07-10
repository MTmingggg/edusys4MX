object Form4: TForm4
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #22823#32771#32508#21512#25104#32489#24405#20837
  ClientHeight = 541
  ClientWidth = 788
  Color = clHighlightText
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 788
    Height = 42
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 167
      Top = 14
      Width = 70
      Height = 14
      Caption = #65288#25991#20214#21517#65289
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -14
      Font.Name = #31561#32447
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 720
      Top = 23
      Width = 48
      Height = 12
      Caption = #23548#20837#25104#21151
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #31561#32447
      Font.Style = []
      ParentFont = False
    end
  end
  object strngrd1: TStringGrid
    Left = 416
    Top = 42
    Width = 372
    Height = 499
    Align = alRight
    TabOrder = 1
    ColWidths = (
      64
      64
      64
      64
      64)
    RowHeights = (
      24
      24
      24
      24
      24)
  end
  object Panel2: TPanel
    Left = 0
    Top = 42
    Width = 416
    Height = 499
    Align = alClient
    Caption = '=>'
    TabOrder = 2
  end
  object OpenDialog1: TOpenDialog
    Left = 688
    Top = 392
  end
  object ADOQuery1: TADOQuery
    Active = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\edusys4MX\school' +
      '_info.mdb;Persist Security Info=False'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from stu_score')
    Left = 744
    Top = 392
  end
end

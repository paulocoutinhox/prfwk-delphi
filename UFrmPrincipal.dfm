object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Projeto Teste - PRFWK'
  ClientHeight = 343
  ClientWidth = 561
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 312
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object lvItens: TListView
    Left = 8
    Top = 8
    Width = 545
    Height = 297
    Columns = <
      item
        Caption = 'ID'
      end
      item
        Caption = 'NOME'
        Width = 491
      end>
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
  end
  object edNome: TEdit
    Left = 45
    Top = 311
    Width = 188
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 397
    Top = 311
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 478
    Top = 311
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 316
    Top = 310
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 4
    OnClick = Button3Click
  end
end

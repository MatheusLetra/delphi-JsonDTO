object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 289
  ClientWidth = 655
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 424
    Top = 0
    Width = 231
    Height = 289
    Align = alRight
    Lines.Strings = (
      '{'
      '   "id": 1,'
      '   "cliente": "Matheus dos Santos Letra",'
      '   "produtos": ['
      '     {'
      '         "id": 1,'
      '         "descricao": "Produto 1",'
      '         "qtde": 10,'
      '         "unitario": 100.00'
      '     },'
      '     {'
      '         "id": 2,'
      '         "descricao": "Produto 2",'
      '         "qtde": 1,'
      '         "unitario": 125.00'
      '     },'
      '     {'
      '         "id": 4,'
      '         "descricao": "Produto 4",'
      '         "qtde": 23,'
      '         "unitario": 10.00'
      '     }'
      ']'
      '}')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 297
    Top = 218
    Width = 121
    Height = 25
    Caption = 'Popular Classe'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object Edit2: TEdit
    Left = 8
    Top = 59
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 86
    Width = 410
    Height = 120
    DataSource = DataSource1
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ClientDataSet1: TClientDataSet
    PersistDataPacket.Data = {
      610000009619E0BD010000001800000004000000000003000000610002494404
      000100000000000944455343524943414F010049000000010005574944544802
      00020014000451544445040001000000000008554E49544152494F0800040000
      0000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 88
    Top = 248
    object ClientDataSet1ID: TIntegerField
      FieldName = 'ID'
    end
    object ClientDataSet1DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
    object ClientDataSet1QTDE: TIntegerField
      FieldName = 'QTDE'
    end
    object ClientDataSet1UNITARIO: TFloatField
      FieldName = 'UNITARIO'
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 16
    Top = 248
  end
end

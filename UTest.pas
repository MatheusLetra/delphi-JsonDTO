unit UTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UPedido, Data.DB,
  Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    DBGrid1: TDBGrid;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    ClientDataSet1ID: TIntegerField;
    ClientDataSet1DESCRICAO: TStringField;
    ClientDataSet1QTDE: TIntegerField;
    ClientDataSet1UNITARIO: TFloatField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    Pedido: TPedido;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  I: Integer;
  Produto: TProdutos;
begin
  ClientDataSet1.Close;
  ClientDataSet1.CreateDataSet;

  Pedido := TPedido.Create();
  try
    Pedido.AsJson := Memo1.Text;

    Edit1.Text := Pedido.Id.ToString();
    Edit2.Text := Pedido.Cliente;

    Pedido.Produtos.Add(TProdutos.Create);
    I := Pedido.Produtos.Count - 1;
    Pedido.Produtos[I].ID := 3;
    Pedido.Produtos[I].Descricao := 'Produto 3';
    Pedido.Produtos[I].Qtde := 2;
    Pedido.Produtos[I].Unitario := 27.00;


    Pedido.Produtos.Remove(Pedido.Produtos[0]);

    for I := 0 to Pedido.Produtos.Count - 1 do
    begin
      ClientDataSet1.Append;
      ClientDataSet1ID.AsInteger := Pedido.Produtos[I].Id;
      ClientDataSet1DESCRICAO.AsString := Pedido.Produtos[I].Descricao;
      ClientDataSet1QTDE.AsInteger := Pedido.Produtos[I].Qtde;
      ClientDataSet1UNITARIO.AsFloat := Pedido.Produtos[I].Unitario;
      ClientDataSet1.Post;
    end;

    ClientDataSet1.IndexFieldNames := 'ID';

    Memo1.Lines.Clear;
    Memo1.Lines.Add(Pedido.GetAsJson)

  finally
    FreeAndNil(Pedido);
  end;
end;

end.

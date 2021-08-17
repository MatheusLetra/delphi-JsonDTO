unit UPedido;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TProdutos = class
  private
    FDescricao: string;
    FId: Integer;
    FQtde: Integer;
    FUnitario: Double;
  published
    property Descricao: string read FDescricao write FDescricao;
    property Id: Integer read FId write FId;
    property Qtde: Integer read FQtde write FQtde;
    property Unitario: Double read FUnitario write FUnitario;
  end;

  TPedido = class(TJsonDTO)
  private
    FCliente: string;
    FId: Integer;
    [JSONName('produtos'), JSONMarshalled(False)]
    FProdutosArray: TArray<TProdutos>;
    [GenericListReflect]
    FProdutos: TObjectList<TProdutos>;
  public
    function GetAsJson: string; override;
    function GetProdutos: TObjectList<TProdutos>;
    destructor Destroy; override;

  published
    property Cliente: string read FCliente write FCliente;
    property Id: Integer read FId write FId;
    property Produtos: TObjectList<TProdutos> read GetProdutos;
  end;

implementation

{ TRoot }

destructor TPedido.Destroy;
begin
  GetProdutos.Free;
  inherited;
end;

function TPedido.GetProdutos: TObjectList<TProdutos>;
begin
  Result := ObjectList<TProdutos>(FProdutos, FProdutosArray);
end;

function TPedido.GetAsJson: string;
begin
  RefreshArray<TProdutos>(FProdutos, FProdutosArray);
  Result := inherited;
end;

end.

unit UDMCliente;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,uCliente,
  FireDAC.Stan.StorageBin;

type
  TDMCliente = class(TDataModule)
    cdsEndereco: TFDMemTable;
    cdsCliente: TFDMemTable;
    cdsClientenome: TStringField;
    cdsClienteIdentidade: TStringField;
    cdsClienteCPF: TStringField;
    cdsClientetelefone: TStringField;
    cdsClienteemail: TStringField;
    cdsClienteid: TIntegerField;
    cdsEnderecocep: TStringField;
    cdsEnderecoLogradouro: TStringField;
    cdsEnderecoBairro: TStringField;
    cdsEnderecoComplemento: TStringField;
    cdsEnderecoCidade: TStringField;
    cdsEnderecoEstado: TStringField;
    cdsEnderecopais: TStringField;
    cdsEnderecoIDCliente: TIntegerField;
    cdsEnderecoNumero: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }

    function  GerarID: Integer;
    procedure InserirCliente(oCliente: TCliente);
    procedure InserirEndereco(oCliente: TCliente);
    function  RetornaDadosCliente: IFDDataSetReference;
    function  RetornaDadosEndereco: IFDDataSetReference;
  end;

var
  DMCliente: TDMCliente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}



{$R *.dfm}

{ TDataModule1 }

function TDMCliente.GerarID: Integer;
begin
  Result := cdsCliente.RecordCount + 1;
end;

procedure TDMCliente.InserirCliente(oCliente: TCliente);
begin
  cdsCliente.Insert;
  with oCliente do
  begin
    cdsClienteid.AsInteger        := GerarID;
    cdsClientenome.AsString       := Nome;
    cdsClienteIdentidade.AsString := Identidade;
    cdsClientecpf.AsString        := CPF;
    cdsClientetelefone.AsString   := Telefone;
    cdsClienteemail.AsString      := Email;
  end;
  try
    cdsCliente.Post;
  except on e: Exception do
  begin
    raise Exception.Create(e.Message);
  end;

  end;
end;

procedure TDMCliente.InserirEndereco(oCliente: TCliente);
var
  I: integer;
begin
  cdsEndereco.Insert;
try
  with oCliente do
  begin
    for I := 0 to Endereco.Count -1 do
    begin
      cdsEndereco.Insert;
      cdsEnderecoIDCliente.AsInteger  :=  Endereco.Items[i].IdCliente;
      cdsEnderecocep.AsString         :=  Endereco.Items[i].Cep;
      cdsEnderecoLogradouro.AsString  :=  Endereco.Items[i].Logradouro;
      cdsEnderecoNumero.AsString      :=  Endereco.Items[i].Numero;
      cdsEnderecoBairro.AsString      :=  Endereco.Items[i].Bairro;
      cdsEnderecoComplemento.AsString :=  Endereco.Items[i].Complemento;
      cdsEnderecoCidade.AsString      :=  Endereco.Items[i].Localidade;
      cdsEnderecoEstado.AsString      :=  Endereco.Items[i].Uf;
      cdsEnderecopais.AsString        :=  Endereco.Items[i].Pais;
      cdsEndereco.Post;
    end;
  end;
except on e: Exception do
begin
  raise Exception.Create('Erro ao inserir Endereco para o Cliente: ' + oCliente.Nome);
end;

end;

end;

function TDMCliente.RetornaDadosCliente: IFDDataSetReference;
begin
  Result := self.cdsCliente.Data;
end;

function TDMCliente.RetornaDadosEndereco: IFDDataSetReference;
begin
  Result := self.cdsEndereco.Data;
end;

end.

unit UEndereco;

interface

uses Rest.client,REST.Types,  System.SysUtils,  System.JSON, Rest.Json;

type
  TEndereco = class
  private
    FLogradouro: String;
    FBairro: String;
    FCep: String;
    FNumero: String;
    FComplemento: String;
    Flocalidade: String;
    FPais: String;
    FUf: String;
    FIdCliente: Integer;
    procedure SetBairro(const Value: String);
    procedure SetCep(const Value: String);
    procedure SetLocalidade(const Value: String);
    procedure SetComplemento(const Value: String);
    procedure SetUF(const Value: String);
    procedure SetLogradouro(const Value: String);
    procedure SetNumero(const Value: String);
    procedure SetPais(const Value: String);
    procedure SetIdCliente(const Value: Integer);
  public
    constructor Create;
    destructor Destroy; override;
    property IdCliente:Integer read FIdCliente write SetIdCliente;
    property Cep: String read FCep write SetCep;
    property Logradouro: String read FLogradouro write SetLogradouro;
    property Numero: String read FNumero write SetNumero;
    property Complemento: String read FComplemento write SetComplemento;
    property Bairro: String read FBairro write SetBairro;
    property Localidade: String read Flocalidade write SetLocalidade;
    property Uf: String read FUf write SetUF;
    property Pais: String read FPais write SetPais;

    function GetCep(CEP:String): TJSONObject;
    function ValidaCep(Cep:String): Boolean;

    const URL_BASE_CEP = 'https://viacep.com.br/ws/';
    const COMPRIMENTO_CEP = 8;

  end;

implementation





{ TEndereco }

constructor TEndereco.Create;
begin
   FLogradouro := '';
   FBairro := '';
   FComplemento := '';
   FLocalidade := '';
   FUf := '';
   FCep := '';
end;

destructor TEndereco.Destroy;
begin

  inherited;
end;

function TEndereco.GetCep(CEP: String): TJSONObject;
var
  Cliente   : TRESTClient;
  Requisicao: TRESTRequest;
  Resposta  : TRESTResponse;
begin
  Cliente                     := TRESTClient.Create(nil);
  Requisicao                  := TRESTRequest.Create(nil);
  Resposta                    := TRESTResponse.Create(nil);
  try
    Cliente.BaseURL           := URL_BASE_CEP;
    Requisicao.Client         := Cliente;
    Requisicao.Response       := Resposta;
    Requisicao.Resource       := '{CEP}';
    Requisicao.ResourceSuffix := 'json';
    Requisicao.Method         := rmGet;
    Requisicao.Params.AddUrlSegment('CEP',CEP);
    Requisicao.Execute;
    Result                    := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes( Utf8ToAnsi(RawByteString(Resposta.JSONText))), 0) as TJSONObject
  finally
    Cliente.Free;
    Requisicao.Free;
    Resposta.Free;

  end;
end;

procedure TEndereco.SetBairro(const Value: String);
begin
  FBairro := Value;
end;

procedure TEndereco.SetCep(const Value: String);
var
  oEndereco: TEndereco;
begin
  if not ValidaCep(Value) then
    exit;
  FCep           := Value;
  try
    oEndereco    := TJSON.JsonToObject<TEndereco>(GetCep(FCep));
    if not Assigned(oEndereco) then
       raise Exception.Create('CEP inválido.');

     FLogradouro := oEndereco.Logradouro;
     FComplemento:= oEndereco.Complemento;
     FBairro     := oEndereco.Bairro;
     FLocalidade := oEndereco.Localidade;
     FUf         := oEndereco.Uf;
  finally
    FreeAndNil(oEndereco);
  end;

end;

procedure TEndereco.SetLocalidade(const Value: String);
begin
  Flocalidade := Value;
end;

procedure TEndereco.SetComplemento(const Value: String);
begin
  FComplemento := Value;
end;

procedure TEndereco.SetUF(const Value: String);
begin
  FUf := Value;
end;

procedure TEndereco.SetIdCliente(const Value: Integer);
begin
  FIdCliente := Value;
end;

procedure TEndereco.SetLogradouro(const Value: String);
begin
  FLogradouro := Value;
end;

procedure TEndereco.SetNumero(const Value: String);
begin
  FNumero := Value;
end;

procedure TEndereco.SetPais(const Value: String);
begin
  FPais := Value;
end;

function TEndereco.ValidaCep(Cep:String): Boolean;
begin
  Result := True;
  if (Cep.Trim.Length <> COMPRIMENTO_CEP) or (cep.IsEmpty) then
    Result := False;
end;

end.

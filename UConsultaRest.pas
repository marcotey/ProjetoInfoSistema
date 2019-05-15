unit UConsultaRest;

interface

uses System.Json,Rest.client;

type
TConsultaRest = class
  private

  public
    //class function ExecutaServicoGET(URLBase, Parametro:String): String; override;
    class function ExecutaServicoGET(URLBase, Parametro:String): String;
//    class function GetCEP(CEP: string): TJSONObject;
end;


implementation

uses
  REST.Types, IdHTTP, System.Classes, System.SysUtils,IdSSLOpenSSL;

{ TConsultaRest }

class function TConsultaRest.ExecutaServicoGET(URLBase,
  Parametro: String): String;
var
    Cliente   : TRESTClient;
    Requisicao: TRESTRequest;
    Resposta  : TRESTResponse;
begin
  Cliente                     := TRESTClient.Create(nil);
  Requisicao                  := TRESTRequest.Create(nil);
  Resposta                    := TRESTResponse.Create(nil);
  try
    Cliente.BaseURL           := URLBase;
    Requisicao.Client         := Cliente;
    Requisicao.Response       := Resposta;
    Requisicao.Resource       := '{Parametro}';
    Requisicao.ResourceSuffix := 'json';
    Requisicao.Method         := rmGet;
    Requisicao.Params.AddUrlSegment('Parametro',Parametro);
    Requisicao.Execute;
    Result                    := Resposta.JSONText;
  finally
    Cliente.Free;
    Requisicao.Free;
    Resposta.Free;

  end;
end;

{class function TConsultaRest.GetCEP(CEP: string): TJSONObject;
var
   HTTP: TIdHTTP;
   IDSSLHandler : TIdSSLIOHandlerSocketOpenSSL;
   Response: TStringStream;
   LJsonObj: TJSONObject;
begin
   try
      HTTP := TIdHTTP.Create;
      IDSSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create;
      HTTP.IOHandler := IDSSLHandler;
      Response := TStringStream.Create('');
      HTTP.Get('https://viacep.com.br/ws/' + CEP + '/json', Response);}
//    if (HTTP.ResponseCode = 200) and not(Utf8ToAnsi(Response.DataString) = '{'#$A'  "erro": true'#$A'}') then
  {       Result := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes( Utf8ToAnsi(Response.DataString)), 0) as TJSONObject;
   finally
      FreeAndNil(HTTP);
      FreeAndNil(IDSSLHandler);
      Response.Destroy;
   end;
end; }

end.

unit UClienteXML;

interface

uses
  Xml.XMLIntf,XML.xmlDoc,FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,  FireDAC.Comp.DataSet, FireDAC.Comp.Client;//, System.sYsutils;

  type
    TClienteXML = class
    private

    public
      class function CriaXMLCliente(XMLDOcument: TXMLDocument;cdsCliente,cdsEndereco:TFDMemTable; CaminhoExe:String): String;

    end;

implementation

{ TClienteXML }

class function TClienteXML.CriaXMLCliente(XMLDOcument: TXMLDocument;cdsCliente,cdsEndereco:TFDMemTable; CaminhoExe:String): String;
var
  FCliente: IXMLNode;
  FEndereco: IXMLNode;
  Contador: Integer;
begin
  Contador                                  := 0;
  FCliente                                  := XMLDOcument.AddChild('Cliente');
  FCliente.AddChild('Nome').Text            := cdsCliente.FieldByName('Nome').AsString;
  FCliente.AddChild('Identidade').Text      := cdsCliente.FieldByName('Identidade').AsString;
  FCliente.AddChild('CPF').Text             := cdsCliente.FieldByName('CPF').AsString;
  FCliente.AddChild('Telefone').Text        := cdsCliente.FieldByName('Telefone').AsString;
  FCliente.AddChild('Email').Text           := cdsCliente.FieldByName('Email').AsString;

  cdsEndereco.First;
  while not cdsEndereco.Eof do
  begin
    Inc(Contador);
    FEndereco                               := FCliente.AddChild('Endereço');
    FEndereco.Attributes['EndereçoN']       := Contador;
    FEndereco.AddChild('CEP').Text          := cdsEndereco.FieldByName('CEP').AsString;
    FEndereco.AddChild('Logradouro').Text   := cdsEndereco.FieldByName('Logradouro').AsString;
    FEndereco.AddChild('Numero').Text       := cdsEndereco.FieldByName('Numero').AsString;
    FEndereco.AddChild('Complemento').Text  := cdsEndereco.FieldByName('Complemento').AsString;
    FEndereco.AddChild('Bairro').Text       := cdsEndereco.FieldByName('Bairro').AsString;
    FEndereco.AddChild('Cidade').Text       := cdsEndereco.FieldByName('Cidade').AsString;
    FEndereco.AddChild('Estado').Text       := cdsEndereco.FieldByName('Estado').AsString;
    FEndereco.AddChild('Pais').Text         := '';

    cdsEndereco.Next;
  end;
  XMLDOcument.SaveToFile(CaminhoExe);
  Result := CaminhoExe;
end;

end.

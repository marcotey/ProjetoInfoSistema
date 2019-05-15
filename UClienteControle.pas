unit UClienteControle;

interface

uses UCliente,FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TClienteControle = class

  private

  public

    procedure InserirCliente(oCliente: TCliente);
    procedure InserirEndereco(oCliente: TCliente);
    function  RetornaDadosCliente : IFDDataSetReference;
    function  RetornaDadosEndereco: IFDDataSetReference;

  end;


implementation


{ TClienteControle }

uses UDMCliente;

procedure TClienteControle.InserirCliente(oCliente: TCliente);
begin
  DMCliente.InserirCliente(oCliente);
end;

procedure TClienteControle.InserirEndereco(oCliente: TCliente);
begin
  DMCliente.InserirEndereco(oCliente);
end;

function TClienteControle.RetornaDadosCliente: IFDDataSetReference;
begin
  Result := DMCliente.RetornaDadosCliente;
end;

function TClienteControle.RetornaDadosEndereco: IFDDataSetReference;
begin
  Result := DMCliente.RetornaDadosEndereco;
end;

end.

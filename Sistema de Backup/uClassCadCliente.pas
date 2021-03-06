unit uClassCadCliente;

interface

uses
  Data.DB;

type
  TClassCadCliente = class
    class function sqldsCadastroCliente: string;
    class procedure ConfigurarCampos(Fields: TFields);
  end;

implementation

uses
  uDM_Conexao;

{ TClassCadCliente }

class procedure TClassCadCliente.ConfigurarCampos(Fields: TFields);
var
  I: Integer;
begin
  for I := 0 to Fields.Count - 1 do
  begin
    if      Fields[I].FieldName = 'CODIGO_CLIENTE' then
            Fields[I].DisplayLabel := 'C?digo'

    else if Fields[I].FieldName = 'NOME_CLIENTE' then
            Fields[I].DisplayLabel := 'Nome'

    else if Fields[I].FieldName = 'STATUS_CLIENTE' then
            Fields[I].DisplayLabel := 'Status'
  end;

end;

class function TClassCadCliente.sqldsCadastroCliente: string;

begin
  Result := '    select CLIENTE.CODIGO_CLIENTE,'     +#13+
            '    CLIENTE.NOME_CLIENTE,'              +#13+
            '    CLIENTE.STATUS_CLIENTE,'            +#13+
            '    CLIENTE.IMAGEM_CLIENTE'             +#13+
            '    from CLIENTE'                       +#13+
            '    where CLIENTE.CODIGO_CLIENTE=:COD';
end;
end.

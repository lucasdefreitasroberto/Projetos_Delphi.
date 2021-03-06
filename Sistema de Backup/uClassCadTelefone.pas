unit uClassCadTelefone;

interface

uses Data.DB;

type
  TClassCadTelefone = class
 class function sqldsCadastroTelefone: string;
 class procedure ConfigurarCampos(Fields: TFields);
  end;

implementation

uses
  uDM_Conexao;

{ TClassCadEndereco }

class procedure TClassCadTelefone.ConfigurarCampos(Fields: TFields);
var
  I: Integer;
begin
  for I := 0 to Fields.Count - 1 do
  begin
    if      Fields[I].FieldName = 'CODIGO_TELEFONE' then
            Fields[I].DisplayLabel := 'C?digo'

    else if Fields[I].FieldName = 'NUMERO_TELEFONE' then
            Fields[I].DisplayLabel := 'N?mero Telefone'

    else if Fields[I].FieldName = 'TIPO_TELEFONE' then
            Fields[I].DisplayLabel := 'Tipo Telefone'

    else if Fields[I].FieldName = 'ID_TELEFONE_CLIENTE' then
            Fields[I].DisplayLabel := 'C?digo Cliente'

      else if Fields[I].FieldName = 'ID_TEFONE_CLIENTE' then
            Fields[I].DisplayLabel :='C?digo Cliente'
  end;

end;

class function TClassCadTelefone.sqldsCadastroTelefone: string;
begin
  Result := '    select CODIGO_TELEFONE, NUMERO_TELEFONE, TIPO_TELEFONE from TELEFONE '+#13+
            '    WHERE ID_TELEFONE_CLIENTE = :CODIGO_CLIENTE';
end;

end.

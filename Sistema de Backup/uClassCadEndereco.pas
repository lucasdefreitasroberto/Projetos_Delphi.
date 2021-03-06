unit uClassCadEndereco;

interface

uses Data.DB;

type
  TClassCadEndereco = class
    class function sqldsCadastroEndereco: string;
    class procedure ConfigurarCampos(Fields: TFields);
  end;

implementation

uses
  uDM_Conexao;

{ TClassCadEndereco }

class procedure TClassCadEndereco.ConfigurarCampos(Fields: TFields);
var
  Field: TField;
begin
  for Field in Fields do
  begin
    if      Field.FieldName = 'CODIGO_ENDERECO' then
            Field.DisplayLabel := 'C?digo'

    else if Field.FieldName = 'RUA_ENDERECO' then
            Field.DisplayLabel := 'Rua'

    else if Field.FieldName = 'BAIRRO_ENDERECO' then
            Field.DisplayLabel := 'Bairro'

    else if Field.FieldName = 'CIDADE_ENDERECO' then
            Field.DisplayLabel := 'Cidade'

    else if Field.FieldName = 'NUMERO_ENDERECO' then
            Field.DisplayLabel := 'N?mero'

    else if Field.FieldName = 'UF_ENDERECO' then
            Field.DisplayLabel := 'UF'

    else if Field.FieldName = 'ID_ENDERECO_CLIENTE' then
            Field.DisplayLabel :='C?digo Cliente'
  end;

end;

class function TClassCadEndereco.sqldsCadastroEndereco: string;
begin
  Result := '    select ENDERECO.CODIGO_ENDERECO, ENDERECO.RUA_ENDERECO, ENDERECO.BAIRRO_ENDERECO, ENDERECO.CIDADE_ENDERECO,  '+ #13 +
            '    ENDERECO.NUMERO_ENDERECO, ENDERECO.UF_ENDERECO, ENDERECO.ID_ENDERECO_CLIENTE  ' + #13 +
            '    from ENDERECO '  +#13+
            '    Where ENDERECO.ID_ENDERECO_CLIENTE = :CODIGO_CLIENTE';
end;

end.

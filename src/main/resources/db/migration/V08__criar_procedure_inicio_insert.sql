CREATE PROC SP_GERAR_INICIO_INSERT (
	@tabela_nome varchar(200), 
	@colunas_ignorar varchar(5000) = NULL
)
AS
BEGIN
SET NOCOUNT ON
DECLARE	@Coluna_ID int,
		@Lista_Colunas varchar(8000),
		@Nome_Coluna varchar(100),
		@Inicio_Insert varchar(max),
		@Data_Type varchar(100)
		
SET @Coluna_ID = 0
SET @Nome_Coluna = ''
SET @Lista_Colunas = ''

BEGIN
	SET @Inicio_Insert = 'INSERT INTO ' + '[' + RTRIM(@tabela_nome) + ']'
END

SELECT	@Coluna_ID = MIN(ORDINAL_POSITION)
FROM	INFORMATION_SCHEMA.COLUMNS (NOLOCK)
WHERE 	TABLE_NAME = @tabela_nome

WHILE @Coluna_ID IS NOT NULL
	BEGIN
		SELECT 	@Nome_Coluna = QUOTENAME(COLUMN_NAME), @Data_Type = DATA_TYPE
		FROM 	INFORMATION_SCHEMA.COLUMNS (NOLOCK)
		WHERE 	ORDINAL_POSITION = @Coluna_ID AND TABLE_NAME = @tabela_nome
		--ignora_colunas
		IF @colunas_ignorar IS NOT NULL
		BEGIN
			IF CHARINDEX( '''' + SUBSTRING(@Nome_Coluna,2,LEN(@Nome_Coluna)-2) + '''',@colunas_ignorar) <> 0
			BEGIN
				GOTO SKIP_LOOP
			END
		END
		SET @Lista_Colunas = @Lista_Colunas +  @Nome_Coluna + ','
		
		SKIP_LOOP:
		SELECT 	@Coluna_ID = MIN(ORDINAL_POSITION)
		FROM 	INFORMATION_SCHEMA.COLUMNS (NOLOCK)
		WHERE 	TABLE_NAME = @tabela_nome AND ORDINAL_POSITION > @Coluna_ID
	END
SET @Lista_Colunas = LEFT(@Lista_Colunas,len(@Lista_Colunas) - 1)
select RTRIM(@Inicio_Insert)+'(' + RTRIM(@Lista_Colunas) +')'
SET NOCOUNT OFF
RETURN 0
END;
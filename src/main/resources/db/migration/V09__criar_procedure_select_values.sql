CREATE PROC SP_GERAR_INSERT_VALUES (
	@nome_tabela varchar(200),
	@colunas_ignorar varchar(5000) = NULL
)
AS BEGIN
SET NOCOUNT ON
DECLARE	@Coluna_ID int,
		@Lista_Colunas varchar(8000),
		@Nome_Coluna varchar(100),
		@Inicio_Insert varchar(max),
		@Data_Type varchar(100),
		@Values varchar(max)
		
SET @Coluna_ID = 0
SET @Nome_Coluna = ''
SET @Lista_Colunas = ''
SET @Values = ''

BEGIN
	SET @Inicio_Insert = 'INSERT INTO ' + '[' + RTRIM(@nome_tabela) + ']'
END
SELECT	@Coluna_ID = MIN(ORDINAL_POSITION)
FROM	INFORMATION_SCHEMA.COLUMNS (NOLOCK)
WHERE 	TABLE_NAME = @nome_tabela

WHILE @Coluna_ID IS NOT NULL
	BEGIN
		SELECT 	@Nome_Coluna = QUOTENAME(COLUMN_NAME), @Data_Type = DATA_TYPE
		FROM 	INFORMATION_SCHEMA.COLUMNS (NOLOCK)
		WHERE 	ORDINAL_POSITION = @Coluna_ID AND TABLE_NAME = @nome_tabela
		--ignora_colunas
		IF @colunas_ignorar IS NOT NULL
		BEGIN
			IF CHARINDEX( '''' + SUBSTRING(@Nome_Coluna,2,LEN(@Nome_Coluna)-2) + '''',@colunas_ignorar) <> 0
			BEGIN
				GOTO SKIP_LOOP
			END
		END
		SET @Values = @Values  +
		CASE
			WHEN @Data_Type IN ('char','varchar','nchar','nvarchar')
				THEN 'COALESCE('''''''' + REPLACE(RTRIM(' + @Nome_Coluna + '),'''''''','''''''''''')+'''''''',''NULL'')'
			WHEN @Data_Type IN ('datetime','smalldatetime')
				THEN 'COALESCE('''''''' + RTRIM(CONVERT(char,' + @Nome_Coluna + ',121) COLLATE DATABASE_DEFAULT)+'''''''',''NULL'')'
			WHEN @Data_Type IN ('uniqueidentifier')
				THEN 'COALESCE('''''''' + REPLACE(CONVERT(varchar(128),RTRIM(' + @Nome_Coluna + ') COLLATE DATABASE_DEFAULT),'''''''','''''''''''')+'''''''',''NULL'')'
			WHEN @Data_Type IN ('text','ntext')
				THEN 'COALESCE('''''''' + REPLACE(CONVERT(varchar(max),' + @Nome_Coluna + ') COLLATE DATABASE_DEFAULT,'''''''','''''''''''')+'''''''',''NULL'')'
			WHEN @Data_Type IN ('timestamp','rowversion')
				THEN '''DEFAULT'''
			WHEN @Data_Type IN ('float','real','money','smallmoney')
				THEN 'COALESCE(LTRIM(RTRIM(' + 'CONVERT(varchar, ' +  @Nome_Coluna  + ',2) COLLATE DATABASE_DEFAULT' + ')),''NULL'')'
			ELSE
				'COALESCE(LTRIM(RTRIM(' + 'CONVERT(varchar, ' +  @Nome_Coluna  + ') COLLATE DATABASE_DEFAULT' + ')),''NULL'')'
		END   + '+' +  ''',''' + ' + '

		SET @Lista_Colunas = @Lista_Colunas +  @Nome_Coluna + ','
		SKIP_LOOP:

		SELECT 	@Coluna_ID = MIN(ORDINAL_POSITION)
		FROM 	INFORMATION_SCHEMA.COLUMNS (NOLOCK)
		WHERE 	TABLE_NAME = @nome_tabela AND ORDINAL_POSITION > @Coluna_ID
	END

SET @Lista_Colunas = LEFT(@Lista_Colunas,len(@Lista_Colunas) - 1)
SET @Values = LEFT(@Values,len(@Values) - 6)
	BEGIN
		SET @Values =
			'SELECT ' +
			''''  +
			' '' +''VALUES(''+ ' +  @Values + '+'')''' + ' ' +
			' FROM [' + rtrim(@nome_tabela) + ']' + '(NOLOCK)'
	END
select @Values
SET NOCOUNT OFF
RETURN 0
END;
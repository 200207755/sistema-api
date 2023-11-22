CREATE TABLE REQUISICAODADOS (
	codigo NUMERIC(18,0) IDENTITY PRIMARY KEY,
	data_requisicao DATE,
	data_processamento DATE,
	link VARCHAR(MAX),
	banco_dados VARCHAR(150),
	status VARCHAR (50)
);
CREATE TABLE CONTATO (
	codigo NUMERIC(18,0) IDENTITY PRIMARY KEY ,
	codigo_pessoa NUMERIC(18,0) NOT NULL,
	nome VARCHAR(100) NOT NULL,
	email VARCHAR(150) NOT NULL,
	telefone VARCHAR(25) NOT NULL,
  FOREIGN KEY (codigo_pessoa) REFERENCES PESSOA(codigo)
);

insert into CONTATO (codigo_pessoa, nome, email, telefone) values (1, 'CONTATO 1', 'contato1@gmail.com', '00 0000-0000');
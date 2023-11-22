CREATE TABLE PESSOA (
	codigo NUMERIC(18,0) IDENTITY PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	logradouro VARCHAR(50),
	numero VARCHAR(20),
	complemento VARCHAR(50),
	bairro VARCHAR(50),
	cep VARCHAR(15),
	cidade VARCHAR(50),
	estado VARCHAR(50),
	ativo CHAR(1) NOT NULL
);

INSERT INTO PESSOA (nome, logradouro, numero, complemento, bairro, cep, cidade, estado, ativo) values ('João Carlos', 'Rua 1', '10', null, 'Morumbi', '99.400-121', 'São Paulo', 'SP', '1');
INSERT INTO PESSOA (nome, logradouro, numero, complemento, bairro, cep, cidade, estado, ativo) values ('Maria das Lurdes', 'Rua 2', '110', 'Apto 101', 'Morumbi', '99.400-121', 'São Paulo', 'SP', '1');
INSERT INTO PESSOA (nome, logradouro, numero, complemento, bairro, cep, cidade, estado, ativo) values ('Enzo dos Santos', 'Rua 3', '23', null, 'Morumbi', '99.400-121', 'São Paulo', 'SP', '1');
INSERT INTO PESSOA (nome, logradouro, numero, complemento, bairro, cep, cidade, estado, ativo) values ('Pedro Pereira', 'Rua 4', '123', 'Apto 302', 'Morumbi', '99.400-121', 'São Paulo', 'SP', '1');
INSERT INTO PESSOA (nome, logradouro, numero, complemento, bairro, cep, cidade, estado, ativo) values ('José da Silva1', 'Rua 5', '321', null, 'Morumbi', '99.400-121', 'São Paulo', 'SP', '1');
INSERT INTO PESSOA (nome, logradouro, numero, complemento, bairro, cep, cidade, estado, ativo) values ('Pedro Alvares', 'Rua 6', '100', null, 'Estacio', '77.400-121', 'Porto Alegre', 'RS', '1');
INSERT INTO PESSOA (nome, logradouro, numero, complemento, bairro, cep, cidade, estado, ativo) values ('Monteiro Medeiros', 'Rua 5', '120', 'Apto 201', 'Morumbi', '99.400-121', 'São Paulo', 'SP', '1');
INSERT INTO PESSOA (nome, logradouro, numero, complemento, bairro, cep, cidade, estado, ativo) values ('Roberto Santana', 'Rua 3', '43', null, 'Morumbi', '99.400-121', 'São Paulo', 'SP', '1');
INSERT INTO PESSOA (nome, logradouro, numero, complemento, bairro, cep, cidade, estado, ativo) values ('Leandro de Oliveira', 'Rua 4', '66', null, 'Morumbi', '99.400-121', 'São Paulo', 'SP', '1');
INSERT INTO PESSOA (nome, logradouro, numero, complemento, bairro, cep, cidade, estado, ativo) values ('Isa Martines', 'Rua 2', '133', 'Apto 102', 'Morumbi', '99.400-121', 'São Paulo', 'SP', '1');
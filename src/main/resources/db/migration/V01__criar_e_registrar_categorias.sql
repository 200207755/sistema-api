CREATE TABLE CATEGORIA (
	codigo NUMERIC(18,0) IDENTITY PRIMARY KEY,
	nome VARCHAR(100) NOT NULL
);

INSERT INTO categoria (nome) values ('Alimentação');
INSERT INTO categoria (nome) values ('Lazer');
INSERT INTO categoria (nome) values ('Farmácia');
INSERT INTO categoria (nome) values ('Supermercado');
INSERT INTO categoria (nome) values ('Brinquedo');
INSERT INTO categoria (nome) values ('Outros');
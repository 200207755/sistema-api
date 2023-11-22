CREATE TABLE USUARIO (
	codigo NUMERIC(18,0) PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL,
	senha VARCHAR(150) NOT NULL
)

CREATE TABLE PERMISSAO (
	codigo NUMERIC(18,0) PRIMARY KEY,
	descricao VARCHAR(100) NOT NULL
);

CREATE TABLE USUARIO_PERMISSAO (
	codigo_usuario NUMERIC(18,0) NOT NULL,
	codigo_permissao NUMERIC(18,0) NOT NULL,
	PRIMARY KEY (codigo_usuario, codigo_permissao),
	FOREIGN KEY (codigo_usuario) REFERENCES USUARIO(codigo),
	FOREIGN KEY (codigo_permissao) REFERENCES PERMISSAO(codigo)
);

INSERT INTO USUARIO (codigo, nome, email, senha) values (1, 'Administrador', 'admin@gmail.com', '$2a$10$zSxfFlWcMYnUoPvcde/vt.wlmpyfOnPnf1aphpvyV1njf.6jGb3t2');
INSERT INTO USUARIO (codigo, nome, email, senha) values (2, 'Usuario2', 'user@gmail.com', '$2a$10$zSxfFlWcMYnUoPvcde/vt.wlmpyfOnPnf1aphpvyV1njf.6jGb3t2');

INSERT INTO PERMISSAO (codigo, descricao) values (1, 'ROLE_CADASTRAR_CATEGORIA');
INSERT INTO PERMISSAO (codigo, descricao) values (2, 'ROLE_PESQUISAR_CATEGORIA');

INSERT INTO PERMISSAO (codigo, descricao) values (3, 'ROLE_CADASTRAR_PESSOA');
INSERT INTO PERMISSAO (codigo, descricao) values (4, 'ROLE_REMOVER_PESSOA');
INSERT INTO PERMISSAO (codigo, descricao) values (5, 'ROLE_PESQUISAR_PESSOA');

INSERT INTO PERMISSAO (codigo, descricao) values (6, 'ROLE_CADASTRAR_LANCAMENTO');
INSERT INTO PERMISSAO (codigo, descricao) values (7, 'ROLE_REMOVER_LANCAMENTO');
INSERT INTO PERMISSAO (codigo, descricao) values (8, 'ROLE_PESQUISAR_LANCAMENTO');

INSERT INTO PERMISSAO (codigo, descricao) values (9, 'ROLE_CADASTRAR_REQUISICAO');
INSERT INTO PERMISSAO (codigo, descricao) values (10, 'ROLE_PESQUISAR_REQUISICAO');
INSERT INTO PERMISSAO (codigo, descricao) values (11, 'ROLE_REMOVER_REQUISICAO');

-- admin
INSERT INTO USUARIO_PERMISSAO (codigo_usuario, codigo_permissao) values (1, 1);
INSERT INTO USUARIO_PERMISSAO (codigo_usuario, codigo_permissao) values (1, 2);
INSERT INTO USUARIO_PERMISSAO (codigo_usuario, codigo_permissao) values (1, 3);
INSERT INTO USUARIO_PERMISSAO (codigo_usuario, codigo_permissao) values (1, 4);
INSERT INTO USUARIO_PERMISSAO (codigo_usuario, codigo_permissao) values (1, 5);
INSERT INTO USUARIO_PERMISSAO (codigo_usuario, codigo_permissao) values (1, 6);
INSERT INTO USUARIO_PERMISSAO (codigo_usuario, codigo_permissao) values (1, 7);
INSERT INTO USUARIO_PERMISSAO (codigo_usuario, codigo_permissao) values (1, 8);
INSERT INTO USUARIO_PERMISSAO (codigo_usuario, codigo_permissao) values (1, 9);
INSERT INTO USUARIO_PERMISSAO (codigo_usuario, codigo_permissao) values (1, 10);
INSERT INTO USUARIO_PERMISSAO (codigo_usuario, codigo_permissao) values (1, 11);
-- usuario2
INSERT INTO USUARIO_PERMISSAO (codigo_usuario, codigo_permissao) values (2, 2);
INSERT INTO USUARIO_PERMISSAO (codigo_usuario, codigo_permissao) values (2, 5);
INSERT INTO USUARIO_PERMISSAO (codigo_usuario, codigo_permissao) values (2, 8);
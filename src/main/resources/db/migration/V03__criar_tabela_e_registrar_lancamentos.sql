CREATE TABLE LANCAMENTO (
	codigo NUMERIC(18,0) IDENTITY PRIMARY KEY,
	descricao VARCHAR(100) NOT NULL,
	data_vencimento DATE NOT NULL,
	data_pagamento DATE,
	valor NUMERIC(10,2) NOT NULL,
	observacao VARCHAR(150),
	tipo VARCHAR(25) NOT NULL,
	codigo_categoria NUMERIC(18,0) NOT NULL,
	codigo_pessoa NUMERIC(18,0) NOT NULL,
	FOREIGN KEY (codigo_categoria) REFERENCES CATEGORIA(codigo),
	FOREIGN KEY (codigo_pessoa) REFERENCES PESSOA(codigo)
);

INSERT INTO LANCAMENTO (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa)
VALUES ('Bônus Anual', '2023-12-15', null, 8000.00, 'Prêmio de desempenho', 'RECEITA', 1, 1);
INSERT INTO LANCAMENTO (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa)
VALUES ('Férias nas Bahamas', '2023-11-20', '2023-11-20', 3500.50, 'Viagem de sonho', 'DESPESA', 2, 2);
INSERT INTO LANCAMENTO (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa)
VALUES ('Show no Top Club', '2023-12-30', null, 280.75, 'Apresentação musical', 'RECEITA', 3, 3);
INSERT INTO LANCAMENTO (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa)
VALUES ('Energia Solar', '2023-12-15', '2023-12-15', 210.75, 'Energia renovável', 'RECEITA', 3, 4);
INSERT INTO LANCAMENTO (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa)
VALUES ('Conta de Água', '2023-05-30', null, 180.20, null, 'DESPESA', 3, 5);
INSERT INTO LANCAMENTO (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa)
VALUES ('Investimento em Ações', '2023-11-05', '2023-11-05', 1520.45, null, 'RECEITA', 4, 6);
INSERT INTO LANCAMENTO (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa)
VALUES ('Evento Corporativo', '2023-11-15', null, 780.00, 'Conferência empresarial', 'RECEITA', 1, 7);
INSERT INTO LANCAMENTO (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa)
VALUES ('Jantar no Top Club', '2023-11-25', '2023-11-25', 450.25, 'Jantar de negócios', 'DESPESA', 4, 8);
INSERT INTO LANCAMENTO (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa)
VALUES ('Documentação de Veículo', '2023-12-10', null, 190.60, 'Regularização', 'DESPESA', 3, 9);
INSERT INTO LANCAMENTO (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa)
VALUES ('Venda de Pneus Usados', '2023-12-20', '2023-12-20', 430.90, 'Clientes habituais', 'RECEITA', 5, 10);
INSERT INTO LANCAMENTO (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa)
VALUES ('Café Gourmet', '2023-12-05', null, 12.50, null, 'DESPESA', 1, 5);
INSERT INTO LANCAMENTO (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa)
VALUES ('Compra de Smartphone', '2023-10-10', '2023-10-10', 820.75, null, 'DESPESA', 5, 4);
INSERT INTO LANCAMENTO (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa)
VALUES ('Equipamento de Música', '2023-10-05', null, 1650.30, null, 'DESPESA', 4, 3);
INSERT INTO LANCAMENTO (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa)
VALUES ('Café no Trabalho', '2023-12-15', '2023-12-15', 7.20, null, 'DESPESA', 4, 2);
INSERT INTO LANCAMENTO (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa)
VALUES ('Almoço Rápido', '2023-12-20', null, 14.99, null, 'DESPESA', 4, 1);
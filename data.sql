INSERT INTO Endereco(rua, numero, cidade, estado)
VALUES('Alvarenga de Alencar', 123, 'Campos do Goytacazes', 'Rio de Janeiro'),
	  ('Travessa Murilo Peixoto', 435, 'Campos do Goytacazes', 'Rio de Janeiro'),
	  ('Rua Vinte e Seis de Janeiro', 34, 'Campos do Goytacazes', 'Rio de Janeiro'),
      ('Rua Mariana dos Santos Martins', 23, 'Campos do Goytacazes', 'Rio de Janeiro'),
      ('Rua Mariana dos Santos Martins', 145, 'Campos do Goytacazes', 'Rio de Janeiro'),
      ('Rua Amaro Burla', 46, 'Campos do Goytacazes', 'Rio de Janeiro'),
      ('Rua Carapebus', 234, 'Campos do Goytacazes', 'Rio de Janeiro');

INSERT INTO Cliente(nome, sobrenome, senha, email, cpf) 
VALUES('Pedro', 'Silva', '11111', 'pedrosilva@email.com', '11111111111'), 
	  ('Jessica', 'Teixeira', '22222', 'jessicateixeira@email.com', '22222222222'), 
	  ('Algusta', 'Santos', '33333', 'algustasantos@email.com', '33333333333'),
	  ('Carlos', 'Souza', '44444', 'carlossouza@email.com', '44444444444'),
      ('Lais', 'Correa', '55555', 'laiscorrea@email.com', '55555555555'),
      ('Mariana', 'Larrubia', '66666', 'marianalarrubia@email.com', '66666666666');
      

INSERT INTO Agenda_corretor(dia, mes, ano) 
VALUES(23, 04, 2022),
	  (02, 12, 2022),
      (28, 06, 2022);

INSERT INTO Corretor(id_agenda_corretor, nome, sobrenome, senha, email, cpf, aprovado)
VALUES(1, 'Mario', 'Brazzi', '11111', 'mariobrazzi@email.com', '44444444444',0),
	  (2, 'Carla', 'Lopes', '22222', 'carlalopes@email.com', '55555555555', 1),
	  (3, 'Rodrigo', 'Nobrega', '33333', 'rodrigonobrega@email.com', '66666666666', 1);

INSERT INTO Administrador(id_corretor, senha, email) VALUES(2, 'carlalopes@email.com', '12345');

INSERT INTO Imovel (id_corretor, id_endereco,id_cliente_venda, area, valor, qtde_banheiro, tipo_imovel, aluguel_venda)
VALUES(2, 1, 2, 140, 400000, 5, 'Casa', 'Venda');

INSERT INTO Imovel (id_corretor, id_endereco, id_cliente_compra, id_cliente_venda, area, valor, qtde_banheiro, observacao, tipo_imovel, aluguel_venda, negociado, aprovado)
VALUES(3, 2, 3, 1, 80, 850,  1, "precisa reformar piso", 'Apartamento', 'Aluguel', 1, 1);

INSERT INTO Imovel (id_corretor, id_endereco, id_cliente_venda, area, valor, qtde_banheiro, observacao, tipo_imovel, aluguel_venda, negociado, aprovado)
VALUES(2, 3, 1, 300, 1400000, 7, "possui jardim", 'Casa', 'Venda', 0, 1);

INSERT INTO Imovel(id_endereco, id_cliente_venda, area, valor, qtde_banheiro, observacao, tipo_imovel, aluguel_venda, negociado, aprovado) 
VALUES(4, 6, 80, 200000, 2, 'uma suite', 'Casa', 'Venda', 0, 0);

INSERT INTO Imovel(id_endereco, id_cliente_venda, area, valor, qtde_banheiro, tipo_imovel, aluguel_venda, aprovado) 
VALUES(5,5, 60, 600, 1, 'Apartamento', 'Aluguel', 1);

INSERT INTO Imovel(id_endereco, id_cliente_venda, area, valor, qtde_banheiro, observacao, tipo_imovel, aluguel_venda, negociado, aprovado) 
VALUES(6, 6, 80, 150000, 1, 'casa com dois andares', 'Casa', 'Venda', 0, 1);

INSERT INTO Imovel(id_endereco, id_cliente_venda, area, valor, qtde_banheiro, observacao, tipo_imovel, aluguel_venda, negociado, aprovado) 
VALUES(7, 6, 80, 150000, 1, 'casa com dois andares', 'Casa', 'Venda', 0, 0);

INSERT INTO Agendamento_visita(id_cliente, id_imovel)
VALUES(3, 3),
	  (4, 2),
	  (1, 5);
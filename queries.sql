--Update dos Corretores, atribuindo corretores para casas com id impar e par 
UPDATE Imovel set id_corretor = 
CASE WHEN (id_imovel MOD 2) = 0 THEN 3
ELSE 2
END
;

--Consulta  para mostrar o nome do Cliente que agendou uma visita ao Imovel e do Corretor Responsável junto com parte do endereco do Imovel
select co.nome as corretor, c.nome as cliente, e.rua, e.numero from corretor co join imovel i 
on co.id_corretor = i.id_corretor
join agendamento_visita av on av.id_imovel = i.id_imovel
join cliente c on c.id_cliente = av.id_cliente join endereco e on e.id_endereco = i.id_endereco;

--Consulta para determinar quais imoveis ainda precisam ser avaliados e quais ja foram aprovados mostrando o nome dos donos do Imovel 
select i.id_imovel, c.nome , c.sobrenome, 
case 
	when i.aprovado = 0 then 'avaliação necessaria'
    else 'imovel aprovado'
end as 'situação do imovel'
from  Imovel i join Cliente c on i.id_cliente_venda = c.id_cliente;

--Consulta dos dados dos clientes que possuem imoveis cadastrados e aprovados 
select nome, sobrenome, cpf from cliente where id_cliente in (select id_cliente_venda from imovel  where aprovado = 1);

--Mostrar os cliente que alugam os imoveis, com o endereco e valor do aluguel 
select i.id_imovel, i.valor, c.nome, c.sobrenome, e.rua, e.numero from imovel i join cliente c on i.id_cliente_compra  = c.id_cliente 
join endereco e on e.id_endereco = i.id_endereco 
where i.aluguel_venda = 'Aluguel';

--Nome dos Clientes e Imoveis com valor acima de 200000 e com mais de 2 banheiros
select c.nome, c.sobrenome, i.id_imovel, i.qtde_banheiro, i.valor from cliente c
join imovel i on c.id_cliente = i.id_cliente_venda and i.qtde_banheiro > 2 and i.valor>200000 order by i.qtde_banheiro desc;
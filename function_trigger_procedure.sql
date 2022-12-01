DELIMITER //
DROP FUNCTION IF EXISTS quantidade_casas_tipoNegocio //
CREATE FUNCTION quantidade_casas_tipoNegocio(xaluguel_venda varchar(30)) returns int
BEGIN
	declare n int;
    select count(*) into n from imovel where aluguel_venda = xaluguel_venda group by aluguel_venda;
    return(n);
end
//

select quantidade_casas_tipoNegocio("venda");

set global log_bin_trust_function_creators = 1;


DELIMITER //
DROP PROCEDURE IF EXISTS aprovar_corretor //
CREATE PROCEDURE aprovar_corretor(xid_corretor int)
BEGIN 
		update corretor set aprovado = 1
        where corretor.id_corretor = xid_corretor and corretor.aprovado = 0 ;
end
//

call aprovar_corretor(1);


DELIMITER //
DROP TRIGGER IF EXISTS atualizar_negociado //
CREATE TRIGGER atualizar_negociado after update on numero for each row
BEGIN
	UPDATE numero SET i  =  2;
END
//

UPDATE Imovel set id_corretor = 1 where id_imovel = 7;
Update Imovel set negociado = 1 where id_imovel = 6;

select * from imovel;

create table numero( i int) ;

insert into numero values (1);

select * from numero;

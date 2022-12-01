create user admin IDENTIFIED BY '123';
GRANT ALL PRIVILEGES ON * . * TO admin;

create user corretor IDENTIFIED BY'321';
grant update, insert, select, delete on imobiliaria.corretor to corretor; 
grant update, insert, select, delete on papelaria.agenda_corretor to corretor; 
grant update, insert, select, delete on papelaria.agendamento_visita to corretor; 

create user mario IDENTIFIED BY'432';
GRANT SELECT, update(id_cliente_compra, aprovado, negociao)
ON db_biblioteca.tbl_autores
TO mario;


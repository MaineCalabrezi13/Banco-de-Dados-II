create user ceo1 password '123';
CREATE GROUP ceo;
alter group ceo add user ceo1;

grant select,insert, update, delete on categorias to ceo with grant option;
grant select,insert, update, delete on cidades to ceo with grant option;
grant select,insert, update, delete on entrada to ceo with grant option;
grant select,insert, update, delete on fornecedor to ceo with grant option;
grant select,insert, update, delete on itens_entrada to ceo with grant option;
grant select,insert, update, delete on produtos to ceo with grant option;
grant select,insert, update, delete on venda to ceo with grant option;
grant select,insert, update, delete on itens_venda to ceo with grant option;

create user sup1 password '123';
CREATE GROUP suprimento;
alter group suprimento add user sup1;

grant select,insert, update, delete on cidades to suprimento with grant option;
grant select,insert, update, delete on fornecedor to suprimento with grant option;
grant select,insert, update, delete on produtos to suprimento with grant option;
grant select,insert, update, delete on categorias to suprimento with grant option;
grant select,insert, update, delete on entrada to suprimento with grant option;
grant select,insert, update, delete on itens_entrada to suprimento with grant option;

create user comer password '123';
CREATE GROUP comercial;
alter group comercial add user comer;
grant select,insert, update, delete on venda to comercial with grant option;
grant select,insert, update, delete on itens_venda to comercial with grant option;

--1) Selecionar todas as categorias que não têm nenhum produto no 
select * from categorias c
where c.cat_codigo not in (select distinct(cat_codigo) from produtos)

--2) Selecionar todos os produtos onde a categoria do mesmo começa com a letra “A

select * from produtos p
inner join categorias c on c.cat_codigo = p.cat_codigo
where c.cat_nome like 'A%'

--3) Selecionar todos os fornecedores (todos os dados), mais o nome e estado de sua respectiva cidade, ordenando por nome de cidade e nome do fornecedor 

select * from fornecedor f
inner join cidades c on c.cid_cep = f.cid_cep 
order by c.cid_nome, f.for_nome

--4) Selecionar todos os produtos, sua categoria, nome do seu representante e de qual cidade é (nome da cidade)

select * from produtos p
inner join categorias c on c.cat_codigo = p.cat_codigo
inner join fornecedor f on f.for_codigo = p.for_codigo
inner join cidades cc on cc.cid_cep = f.cid_cep

--5) Selecionar todas as vendas do mês de março, mostrando todos os itens, dados dos produtos e sua categoria, ordenando a consulta pela data da venda, código do produto e quantidade vendida

select * from venda v
inner join itens_venda iv on iv.ven_codigo = v.ven_codigo
inner join produtos p on p.pro_codigo = iv.pro_codigo
inner join categorias c on c.cat_codigo = p.cat_codigo
where v.ven_data >= '2025-03-01'
and v.ven_data <= '2025-03-01'
order by v.ven_data, p.pro_codigo, iv.ven_quatidade

select * from venda v
inner join itens_venda iv on iv.ven_codigo = v.ven_codigo
inner join produtos p on p.pro_codigo = iv.pro_codigo
inner join categorias c on c.cat_codigo = p.cat_codigo
where v.ven_data between '2025-03-01' and '2025-03-31'
order by v.ven_data, p.pro_codigo, iv.ven_quatidade

select * from venda v
inner join itens_venda iv on iv.ven_codigo = v.ven_codigo
inner join produtos p on p.pro_codigo = iv.pro_codigo
inner join categorias c on c.cat_codigo = p.cat_codigo
where extract(month from v.ven_data) = 3 
and extract(year from v.ven_data) = 2025
order by v.ven_data, p.pro_codigo, iv.ven_quatidade

--6) selecionar todas as entradas do estoque no mês de março, mostrando todos os tens (código, preço, nome dele, nome de sua categoria, nome do fornecedor ordenando pela maior entrada 

select * from entrada e
inner join itens_entrada ie on ie.ent_codigo = e.ent_codigo
inner join produtos p on p.pro_codigo = ie.pro_codigo
inner join categorias c on c.cat_codigo = p.cat_codigo
inner join fornecedor f on f.for_codigo = p.for_codigo
where extract(month from e.ent_data) = 3 
and extract(year from e.ent_data) = 2025
order by ie.ent_quatidade

--7) seleciona todos os produtos com quantidade maior que zero no estoque e mostre também uma coluna com a soma das entradas desse produto e a soma das vendas desse produto 

select p.pro_codigo, p.pro_nome,
coalesce (sum(ie.ent_quatidade),0) as soma_entradas,
coalesce (sum(iv.ven_quatidade),0) as soma_vendas,
p.pro_qnt as estoque_atual
from produtos p
left join itens_entrada ie on p.pro_codigo = ie.pro_codigo
left join itens_venda iv on p.pro_codigo = iv.pro_codigo
where p.pro_qnt > 0
group by p.pro_codigo, p.pro_nome, p.pro_qnt
order by p.pro_nome

--8) selecionar nome do fornecedor, nome do produto, preço do produto, quantidade das entradas, e quantidade das saídas de todos os fornecedores do sul do Brasil, no mês de março 

--9) Selecionar a quantidade total de itens vendido, agrupando por código do produto, nome do produto e nome da categoria do produto. Mostrar apenas os itens que a soma total deu mais de 500 itens vendido 
select p.pro_codigo as codigo_produto,
p.pro_nome as nome_produto,
c.cat_nome as nome_categoria,
sum(iv.ven_quatidade) as total_vendido
from itens_venda iv
join produtos p on iv.pro_codigo = p.pro_codigo
join categorias c on p.cat_codigo = c.cat_codigo
group by p.pro_codigo, p.pro_nome, c.cat_nome
having sum (iv.ven_quatidade) > 500
order by total_vendido desc;

--10) Selecione a quantidade de entrada de produto diferentes por cidades no ano de 2025, ordenando da maior quantidade encontrada para a menor 
select c.cid_nome as cidade,
count(distinct ie.pro_codigo) as qtd_produtos_entrados
from itens_entrada ie
join produtos p on ie.pro_codigo = p.pro_codigo
join fornecedor f on ie.for_codigo = f.for_codigo
join entrada e on ie.ent_codigo = e.ent_codigo
join cidades c on f.cid_cep = c.cid_cep
where extract(year from e.ent_data) = 2025
group by c.cid_nome
order by qtd_produtos_entrados desc;
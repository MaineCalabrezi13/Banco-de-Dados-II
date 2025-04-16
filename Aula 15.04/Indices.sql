--1)	Criar um índice b-tree pelo campo for_codigo na tabela itens_entrada;
CREATE INDEX idx_codigo ON itens_entrada (for_codigo);
--2)	Criar um índice b-tree pelo campo data na tabela entrada;
CREATE INDEX idx_data ON entrada (ent_data);
--3)	Criar um índice composto pelos campos data e hora da venda;
CREATE INDEX idx_datahota ON venda (ven_data,ven_hora);
--4)	Criar um indice único pelo campo nome da categoria;
CREATE UNIQUE INDEX idx_nome_cat ON categorias (cat_nome);
--5)	Criar um indice único pelo nome do produto
CREATE UNIQUE INDEX idx_nome_pro ON produtos (pro_nome);
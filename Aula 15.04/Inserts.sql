-- Inserindo categorias de exemplo
INSERT INTO public.categorias (cat_codigo, cat_nome) VALUES
(1, 'Alimentos'),
(2, 'Bebidas'),
(3, 'Higiene'),
(4, 'Limpeza'),
(5, 'Eletrônicos'),
(6, 'Papelaria'),
(7, 'Vestuário'),
(8, 'Brinquedos'),
(9, 'Ferramentas'),
(10, 'Móveis');

-- Inserindo cidades de exemplo
INSERT INTO public.cidades (cid_cep, cid_nome, cid_estado) VALUES
('01001-000', 'São Paulo', 'SP'),
('20040-002', 'Rio de Janeiro', 'RJ'),
('30130-010', 'Belo Horizonte', 'MG'),
('70040-010', 'Brasília', 'DF'),
('80010-000', 'Curitiba', 'PR'),
('40010-000', 'Salvador', 'BA'),
('60060-000', 'Fortaleza', 'CE'),
('69005-070', 'Manaus', 'AM'),
('66010-000', 'Belém', 'PA'),
('88010-400', 'Florianópolis', 'SC');


-- Inserindo fornecedores de exemplo
INSERT INTO public.fornecedor (
    for_codigo, cid_cep, for_nome, for_telefone, for_celular,
    for_email, for_cnpj, for_sexo, for_rua, for_numero, for_bairro
) VALUES
(1, '01001-000', 'Distribuidora São Paulo', '1133221100', '11988776655', 'contato@dsp.com.br', '12345678000190', 'Outro', 'Rua das Flores', '123', 'Centro'),
(2, '20040-002', 'Rio Importados', '2122334455', '21999887766', 'vendas@rioimport.com', '22345678000191', 'Masculino', 'Av. Brasil', '456', 'Copacabana'),
(3, '30130-010', 'Minas Logística', '3133445566', '31988776655', 'suporte@minaslog.com', '32345678000192', 'Feminino', 'Rua da Liberdade', '789', 'Savassi'),
(4, '70040-010', 'Brasília Tech', '6133556677', '61988776655', 'atendimento@btech.com', '42345678000193', 'Outro', 'SQS 102 Bloco A', '10', 'Asa Sul'),
(5, '80010-000', 'Curitiba Peças', '4133667788', '41988776655', 'curitiba@pecas.com.br', '52345678000194', 'Masculino', 'Rua XV de Novembro', '321', 'Centro'),
(6, '40010-000', 'Salvador Produtos', '7133778899', '71988776655', 'vendas@salvadorprod.com', '62345678000195', 'Feminino', 'Av. Sete de Setembro', '654', 'Barra'),
(7, '60060-000', 'Fortaleza Serv', '8533889900', '85988776655', 'contato@fortaserv.com', '72345678000196', 'Outro', 'Rua das Palmeiras', '987', 'Aldeota'),
(8, '69005-070', 'Amazonas Indústria', '9233990011', '92988776655', 'ind@amazonas.com.br', '82345678000197', 'Masculino', 'Rua Rio Negro', '159', 'Centro'),
(9, '66010-000', 'Belém Fornecimentos', '9134001122', '91988776655', 'comercial@belemforn.com', '92345678000198', 'Feminino', 'Av. Presidente Vargas', '753', 'Reduto'),
(10, '88010-400', 'Florianópolis Soluções', '4834112233', '48988776655', 'info@florisol.com.br', '10345678000199', 'Outro', 'Rua Felipe Schmidt', '852', 'Centro');

-- Inserindo produtos de exemplo (ajustado para novo tipo de pro_preco)
INSERT INTO public.produtos (
    pro_codigo, for_codigo, cat_codigo, pro_nome, pro_foto,
    pro_qnt, pro_barra, pro_quant_min_estoque, codigo_pro, pro_preco
) VALUES
(1, 1, 1, 'Arroz Tipo 1', 'arroz.jpg', 100.000, '7891234560011', 10.000, 'ARZ001', 25.900),
(2, 2, 2, 'Refrigerante Cola 2L', 'refri_cola.jpg', 200.000, '7891234560022', 20.000, 'REF002', 8.500),
(3, 3, 3, 'Sabonete Neutro', 'sabonete.jpg', 500.000, '7891234560033', 50.000, 'SBN003', 2.300),
(4, 4, 4, 'Detergente Neutro', 'detergente.jpg', 300.000, '7891234560044', 30.000, 'DTG004', 3.100),
(5, 5, 5, 'Fone de Ouvido', 'fone.jpg', 50.000, '7891234560055', 5.000, 'FON005', 59.900),
(6, 6, 6, 'Caderno 100 folhas', 'caderno.jpg', 150.000, '7891234560066', 15.000, 'CAD006', 12.750),
(7, 7, 7, 'Camiseta Branca M', 'camiseta.jpg', 80.000, '7891234560077', 10.000, 'CAM007', 29.900),
(8, 8, 8, 'Boneco de Ação', 'boneco.jpg', 60.000, '7891234560088', 6.000, 'BNQ008', 45.000),
(9, 9, 9, 'Chave de Fenda', 'chave.jpg', 120.000, '7891234560099', 12.000, 'CHF009', 9.900),
(10, 10, 10, 'Mesa Escritório', 'mesa.jpg', 10.000, '7891234560100', 2.000, 'MSA010', 399.900);

-- Inserindo produtos de Informática
INSERT INTO public.produtos (
    pro_codigo, for_codigo, cat_codigo, pro_nome, pro_foto,
    pro_qnt, pro_barra, pro_quant_min_estoque, codigo_pro, pro_preco
) VALUES
(11, 1, 1, 'Mouse Óptico USB', 'mouse_optico.jpg', 150.000, '7894561230001', 15.000, 'INF011', 39.900),
(12, 2, 2, 'Teclado Mecânico RGB', 'teclado_rgb.jpg', 100.000, '7894561230002', 10.000, 'INF012', 229.900),
(13, 3, 3, 'Monitor LED 24" Full HD', 'monitor_24.jpg', 40.000, '7894561230003', 5.000, 'INF013', 749.900),
(14, 4, 4, 'HD Externo 1TB USB 3.0', 'hd_externo.jpg', 60.000, '7894561230004', 8.000, 'INF014', 299.900),
(15, 5, 5, 'Pen Drive 64GB', 'pendrive_64.jpg', 300.000, '7894561230005', 30.000, 'INF015', 49.900),
(16, 6, 6, 'Webcam Full HD', 'webcam.jpg', 70.000, '7894561230006', 7.000, 'INF016', 159.900),
(17, 7, 7, 'Fone Headset Gamer', 'headset.jpg', 90.000, '7894561230007', 9.000, 'INF017', 199.900),
(18, 8, 8, 'Notebook i5 8GB 256SSD', 'notebook.jpg', 20.000, '7894561230008', 2.000, 'INF018', 2999.900),
(19, 9, 9, 'Roteador Dual Band', 'roteador.jpg', 85.000, '7894561230009', 8.000, 'INF019', 179.900),
(20, 10, 10, 'Estabilizador 500VA', 'estabilizador.jpg', 50.000, '7894561230010', 5.000, 'INF020', 129.900);


-- Inserindo vendas de exemplo
INSERT INTO public.venda (ven_codigo, ven_data, ven_hora) VALUES
(1, '2025-04-10', '10:15:00-03'),
(2, '2025-04-11', '14:30:00-03'),
(3, '2025-04-11', '16:45:00-03'),
(4, '2025-04-12', '09:00:00-03'),
(5, '2025-04-12', '11:20:00-03'),
(6, '2025-04-12', '17:55:00-03'),
(7, '2025-04-13', '13:40:00-03'),
(8, '2025-04-13', '15:10:00-03'),
(9, '2025-04-13', '18:25:00-03'),
(10, '2025-04-13', '20:00:00-03');

-- Inserindo itens de venda
INSERT INTO public.itens_venda (
    pro_codigo, ven_codigo, ven_quatidade, ven_preco_unitario, ven_preco_total
) VALUES
(11, 1, 2.000, 39.900, 79.800),  -- Mouse Óptico USB
(12, 1, 1.000, 229.900, 229.900),  -- Teclado Mecânico RGB
(13, 2, 1.000, 749.900, 749.900),  -- Monitor LED 24"
(15, 2, 3.000, 49.900, 149.700),  -- Pen Drive 64GB
(14, 3, 1.000, 299.900, 299.900),  -- HD Externo 1TB
(16, 3, 1.000, 159.900, 159.900),  -- Webcam
(18, 4, 1.000, 2999.900, 2999.900),  -- Notebook
(11, 5, 5.000, 39.900, 199.500),  -- Mouse
(17, 5, 1.000, 199.900, 199.900),  -- Headset
(19, 6, 2.000, 179.900, 359.800);  -- Roteador


-- Inserindo registros de entrada
INSERT INTO public.entrada (ent_codigo, ent_data, ent_hora) VALUES
(1, '2025-04-10', '08:15:00-03'),
(2, '2025-04-10', '10:00:00-03'),
(3, '2025-04-11', '09:45:00-03'),
(4, '2025-04-11', '14:30:00-03'),
(5, '2025-04-12', '08:00:00-03'),
(6, '2025-04-12', '13:10:00-03'),
(7, '2025-04-13', '11:45:00-03'),
(8, '2025-04-13', '16:20:00-03'),
(9, '2025-04-14', '09:30:00-03'),
(10, '2025-04-14', '15:00:00-03');


-- Inserindo itens de entrada
INSERT INTO public.itens_entrada (
    pro_codigo, ent_codigo, for_codigo, pro_preco_venda, pro_preco_compra, 
    pro_icms, pro_preco_ent_c_icms, ent_quatidade, ent_preco_total
) VALUES
(11, 1, 1, 39.900, 19.900, 18.00, 23.500, 50.000, 1195.000),  -- Mouse Óptico USB
(12, 2, 2, 229.900, 149.900, 18.00, 130.000, 30.000, 4350.000),  -- Teclado Mecânico RGB
(13, 3, 3, 749.900, 499.900, 18.00, 425.000, 20.000, 14980.000),  -- Monitor LED 24"
(15, 4, 4, 49.900, 35.000, 18.00, 40.000, 100.000, 4990.000),  -- Pen Drive 64GB
(14, 5, 5, 299.900, 250.000, 18.00, 210.000, 50.000, 14995.000),  -- HD Externo 1TB
(16, 6, 6, 159.900, 120.000, 18.00, 101.000, 40.000, 6396.000),  -- Webcam
(18, 7, 7, 2999.900, 2700.000, 18.00, 2280.000, 10.000, 29999.000),  -- Notebook
(11, 8, 1, 39.900, 19.900, 18.00, 23.500, 70.000, 2793.000),  -- Mouse Óptico USB
(17, 9, 9, 199.900, 160.000, 18.00, 135.000, 30.000, 5997.000),  -- Headset
(19, 10, 10, 179.900, 150.000, 18.00, 127.000, 50.000, 8995.000);  -- Roteador




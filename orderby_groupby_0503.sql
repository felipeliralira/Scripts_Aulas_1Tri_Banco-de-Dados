create database sucos_vendas;
use sucos_vendas;

select * from tabela_de_produtos
where sabor = 'manga' or not (tamanho = '470 ml');

select * from tabela_de_produtos
where sabor in ('Manga', 'Laranja');

select * from tabela_de_clientes
where cidade in ('Rio de Janeiro', 'São Paulo')
and idade >= 20;

# Uso do distinct
select embalagem, tamanho from tabela_de_produtos;

select distinct embalagem, tamanho from tabela_de_produtos;

select distinct embalagem, tamanho, sabor, preco_de_lista from tabela_de_produtos where sabor = 'Laranja';
select * from tabela_de_produtos limit 2;

#Todos bairro da cidade do Rio de janeiro
select distinct bairro, estado, cidade from tabela_de_clientes where cidade = 'Rio de Janeiro';
# Obtenha as 10 primeiras vendas do dia 01/01/2017
select * from notas_fiscais where data_venda = '2017-01-01' limit 5,10;

select * from tabela_de_produtos;
select * from tabela_de_produtos order by preco_de_lista, sabor, embalagem;
select * from tabela_de_produtos order by preco_de_lista desc;

-- Qual ou quais foram as maiores vendas
-- do produto "Linha Refrescante - 1 Litro - Morango/Limão"
-- em QUANTIDADE e PRECO?

select * from tabela_de_produtos where nome_do_produto = "Linha Refrescante - 1 Litro - Morango/Limão";
select * from itens_notas_fiscais where codigo_do_produto = '1101035' order by quantidade desc, preco desc limit 10;

# Agrupando os resultados (group by)

select estado, sum(limite_de_credito) as preco_total from tabela_de_clientes group by estado;
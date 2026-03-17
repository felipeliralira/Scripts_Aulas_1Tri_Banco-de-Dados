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

#Todos bairro da cidade do Rio de janeiro
select distinct bairro, estado, cidade from tabela_de_clientes where cidade = 'Rio de Janeiro';
# Obtenha as 10 primeiras vendas do dia 01/01/2017
select * from notas_fiscais where data_venda = '2017-01-01' limit 5,10;

select embalagem, max(preco_de_lista) as preco_total from tabela_de_produtos group by embalagem;
select embalagem, count(*) as contador from tabela_de_produtos group by embalagem;
# count(*) retorna o valor total daquele campo

select max(quantidade) from itens_notas_fiscais where CODIGO_DO_PRODUTO = '1101035';
select count(*) from itens_notas_fiscais where codigo_do_produto = '1101035' and quantidade = 99;
select * from tabela_de_produtos limit 2;

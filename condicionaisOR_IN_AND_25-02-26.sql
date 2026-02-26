create database sucos_vendas;
use sucos_vendas;

select * from tabela_de_produtos
where sabor = 'manga' or not (tamanho = '470 ml');

select * from tabela_de_produtos
where sabor in ('Manga', 'Laranja');

select * from tabela_de_clientes
where cidade in ('Rio de Janeiro', 'São Paulo')
and idade >= 20;
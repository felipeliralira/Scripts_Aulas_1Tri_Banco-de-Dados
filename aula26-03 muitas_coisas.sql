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

/*Classificar o valor dos produtos*/
select nome_do_produto, preco_de_lista,
case
	when preco_de_lista >=14 then "produto caro"
    when preco_de_lista >=7 and preco_de_lista < 14 then "Produto em conta"
    else "Produto Barato"
end as status_preco from tabela_de_produtos
order by preco_de_lista;

/*Veja o ano de nascimento dos clientes e classifique-os como: Nascidos antes de 1990 são velhos, nascidos entre
1990 e 1995 são jovens e nascidos depois de 1995 são crianças.
Listem os nomes dos clientes e a classificação*/

select * from tabela_de_clientes;
select nome, data_de_nascimento,
case when year(DATA_DE_NASCIMENTO) < 1990
	when data_de_nascimento <1989 then "Velhos"
    when data_de_nascimento >=1990 and 1995 then "Adultos"
    else "Crianças"
end as classificacao from tabela_de_clientes
order by classificacao;


#Juntando Tabelas e Consultas
select * from tabela_de_vendedores;
select * from notas_fiscais;

select * from tabela_de_vendedores as TV
inner join notas_fiscais as NF on TV.matricula = NF.matricula;

# Quantas notas fiscais cada vendedor emitiu?
select TV.matricula, TV.nome, count(*) as TOTAL_NF 
from tabela_de_vendedores as TV
inner join notas_fiscais as NF
on TV.matricula = NF.matricula
group by TV.matricula, TV.nome;

/*Obtenha o faturamento anual da empresa, levando 
em consideração que o valor financeiro das vendas 
é obtido pela multiplicação da quantidade pelo preço*/

select year(data_venda) as ano, (INF.quantidade * INF.preco) from notas_fiscais as NF
inner join itens_notas_fiscais as INF 
on NF.numero = INF.numero;




select * from tabela_de_clientes;
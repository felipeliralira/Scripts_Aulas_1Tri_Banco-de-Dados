# Escrever o enunciado
/* O volume_de_compra (tabela de clientes) e a quantidade máxima (L) que um cliente pode comprar no mês.
A quantidade (itens_notas_fiscais) é o campo que representa a quantidade do produto comprado.
A partir da comparação do volume de compras e da quantdade é possível dizer se as vendas do mês foram válidas
ou inválidas.*/

use sucos_vendas;

#Seleção das colunas de interesse
select * from tabela_de_clientes;
select * from itens_notas_fiscais;

select * from notas_fiscais as NF
inner join itens_notas_fiscais as INF
on NF.NUMERO = INF.NUMERO;

#Seleção das colunas de interesse
select NF.CPF, NF.DATA_VENDA, INF.QUANTIDADE from notas_fiscais as NF
inner join itens_notas_fiscais as INF
on NF.NUMERO = INF.NUMERO;

#A PORCENTAGEM SERVE PARA SELECIONAR APENAS O ANO E MÊS
#%y - APENAS 15, E SEM OS 2 PRIMEIROS DIGITOS E %M RETORNA O MÊS POR ESCRITO.
#%Y - O ANO COM OS 4 DÍGITOS e %m RETORNA O NÚMERO DO MÊS.

#Manipular a data (ano e mês)

select NF.CPF, TC.NOME,
MAX(TC.VOLUME_DE_COMPRA) AS VOLUME_COMPRA,
date_format(NF.data_venda, "%Y - %m") AS data_venda,
SUM(INF.quantidade) AS QUANTIDADE
from notas_fiscais as NF
inner join itens_notas_fiscais as INF
on NF.numero = INF.numero
INNER JOIN tabela_de_clientes as TC
on TC.CPF = NF.CPF
group by NF.CPF, DATA_VENDA;

#Obter o volume de compra da tabela de clientes

select x.cpf, x.nome, x.data_venda, x.quantidade, x.volume_compra, x.quantidade - x.volume_compra as diferenca,
case
when (x.quantidade - x.volume_compra) < 0
    then "Venda válida."
    else "Venda inválida."
end as status_venda
from (
select NF.CPF, TC.NOME,
MAX(TC.VOLUME_DE_COMPRA) AS VOLUME_COMPRA,
date_format(NF.data_venda, "%Y - %m") AS data_venda,
SUM(INF.quantidade) AS QUANTIDADE
from notas_fiscais as NF
inner join itens_notas_fiscais as INF
on NF.numero = INF.numero
INNER JOIN tabela_de_clientes as TC
on TC.CPF = NF.CPF
group by NF.CPF, date_format(NF.data_venda, "%Y - %m")
) x;
#Volume_compra = Quantidade máxima que pode comprar. Quantidade = quantidade que comprou.
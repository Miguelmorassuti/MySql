use cadastro;
desc gafanhotos;
select * from gafanhotos;

#EX 01 - LISTANDO O NOME DE TODAS AS MULHERES QUE POSSUEM REGISTROS NA TABELA GAFANHOTOS
select nome from gafanhotos where sexo ='f';

#EX 02 - LISTA DE TODOS OS DADOS DAQUELES QUE NASCERAM ENTRE 01/JAN/2000 E 31/DEZ/2015
select * from gafanhotos 
where nascimento <=  '2015-12-31'  and nascimento >= '2000-01-01'
order by nome;

#EX 03 - LISTA COM O NOME DE TODOS OS HOMENS QUE TRABLHAM COMO PROGRAMADORES
select nome, profissao from gafanhotos where profissao = 'programador' and sexo = 'm';

#EX 04 - LISTA COM O NOME DE TODAS AS MULHERES BRASILEIRAS E QUE POSSUEM NOME QUE SE INICIA COM A LETRA J
select * from gafanhotos where sexo = 'f' and nacionalidade = 'Brasil' and nome like 'j%';

#EX 05 - LISTA COM O NOME E NACIONALIDADE DE TODOS OS HOMENS QUE TEM SILVA NO NOME, NAO NASCERAM NO BRASIL E TEM MENOS DE 100KG
select nome, nacionalidade from gafanhotos where sexo = 'm' and nacionalidade != 'Brasil' and peso <100 and nome like '%Silva';

#EX 06 - QUAL A MAIOR ALTURA ENTRE GAFANHOTOS QUE MORAM NO BRASIL
select max(altura) from gafanhotos where nacionalidade = 'Brasil';

#EX 07 - QUAL A MEDIA DE PESO DOS GAFANHOTOS CADASTRADOS
select avg(peso) from gafanhotos;

#EX 08 - QUAL É MENOR PESO ENTRA AS MULHERES QUE NÃO NASCERAM NO BRASIL E NASCERAM ENTRE 01/01/1990 ATE 31/12/2000
select min(peso) from gafanhotos where sexo = 'f' and nacionalidade !='Brasil' and nascimento between '1990/01/01' and '2000/12/31';

#EX 09 - QUANTAS MULHEREM TEM MAIS DE 1.90
select count(*) from gafanhotos where sexo ='f' and altura > 1.90;  

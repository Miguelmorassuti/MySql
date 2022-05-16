			#EXERCICIOS - SELECT - AGRUPAMENTOS

#EX 01 - LISTA COM AS PROFISSÕES DOS GAFANHOTOS E SEUS RESPECTATIVOS QUANTITATIVOS 
select profissao, count(profissao) from gafanhotos
group by profissao; 

#EX 02 - QUANTOS HOMENS E QUANTAS MULHERES NASCERAM APÓS 01/01/2005
select sexo, count(*) from gafanhotos where nascimento > '2005-01-01'
group by sexo;

#EX 03 - LISTA COM AS PESSOAS QUE NASCERAM FORA DO BRASIL, MOSTRANDO O PAÍS DE ORIGEM E O TOTAL DE PESSOAS NASCIDAS LÁ.
#(SO INTERESSA PAÍSES COM MAIS DE 3 PESSOAS MORANDO LÁ 
select nacionalidade, count(*) from gafanhotos where nacionalidade != 'Brasil'
group by nacionalidade
having count(nacionalidade) >3
order by count(*)asc;

#EX 04 - UMA LISTA AGRUPADA PELA ALTURA DOS GAFANHOTOS, MOSTRANDO QUANTAS PESSOAS PESAM MAIS DE 100KG E QUE ESTÃO ACIMA DA MÉDIA DE ALTURA
select altura, count(*) from gafanhotos where peso>100
group by altura
having altura > (select avg(altura) from gafanhotos);



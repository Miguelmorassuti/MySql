			#SELECT
use cadastro;

select * from cursos; 		#SELECIONA TODOS OS CURSOS E ORGANIZA ATRAVES DA CHAVE PRÍMARIA (ID)

select * from cursos		#SELECIONA TODOS OS REGISTROS
order by nome;				#ORGANIZA OS REGISTROS EM ORDEM ALFABETICA UTILIZANDO A COLUNA NOME COMO PARAMETRO
#order by nome desc;        #ORGANIZA OS REGISTROS EM ORDEM ALFABETICA AO INVERSO UTILIZANDO A COLUNA NOME COMO PARAMETRO

select nome, carga, ano from cursos 	#SELECIONA APENAS AS COLUNAS SELECIONADAS
order by ano, nome;		#desc INVERTE A SELEÇÃO# 	COLOCA EM ORDEM DO MAIS ANTIGO PARA O MAIS NOVO UTILIZANDO A COLUNA ANO COMO PARAMETRO
						#EM CASO DE MAIS DE UM CURSO NO MESMO ANO OS REGISTROS SÃO COLOCADOS EM ORDEM ALFABETICA
                        
select * from cursos
where ano = '2014'		#SELECIONA OS REGISTROS DA TABELA ONDE A COLUNA ANO É 2014
order by nome;		

select * from cursos
where ano >= '2018'		#SELECIONA OS REGISTROS DA TABELA ONDE A COLUNA ANO É <= 2018 #pode se usar >,<, !=
order by ano,nome;	

select nome, ano from cursos
where ano between 2015 and 2017	#SELECIONA OS REGISTROS ONDE O ANO ESTA ENTRE 2015 E 2017
order by ano desc, nome asc;	#ORGANIZA 1º EM ORDEM DECRESCENTE O ANO E DEPOIS EM ORDEM ALFABETICA SE CASO HOUVER MAIS CURSOS NO ANO

select nome, descricao, ano from cursos 
where ano in (2014, 2016)	#SELECIONA OS REGISTROS ONDE O ANO É 2014 OU 2016
order by ano;

select * from cursos
where carga> 35 and totaulas < 30; #SELECIONA OS REGISTROS ONDE A COLUNA CARGA É >35 E A COLUNA totaulas é menor do que 30
								   #TEM o OR também que pode ser utilizado


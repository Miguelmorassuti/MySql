				#SELECT PT2

SELECT * FROM cursos		#like = parecido
where nome like 'P%';		#seleciona os registros onde a coluna nome COMEÇA com a letra P 
#where nome like '%a';      #seleciona os registros onde a coluna nome TERMINA com a letra A
#where nome like '%a%'; 	#seleciona os registros onde a coluna nome POSSUI a letra A em qualquer posição
#where nome not like '%a%'; #seleciona os registros onde a coluna nome NÃO POSSUI a letra A em qualquer posição
#where nome not like 'ph%p'; #seleciona os registros onde a coluna nome COMEÇA com PH e TERMINA em P
#where nome not like 'ph%p_'; #seleciona os registros onde a coluna nome COMEÇA com PH e TERMINA em P e exige que exista mais um caractere dps do P

select * from gafanhotos
where nome like '%silva'; #seleciona os registros onde a coluna nome tem Silva e algo escrito primeiro (para n selecionar SILVANA)

select distinct nacionalidade from gafanhotos	#seleciona a nacionalidade dos registros sem deixar que alguma nacionalidade se repita
order by nome;									#seleciona apenas colunas com dados distintos

select count(*) from gafanhotos; 	#conta todos  os registros da tabela selecionada

select count(*) from gafanhotos where sexo ='f'; #conta todos os registros onde a coluna sexo esta preenchida com F 

select max(carga) from cursos;	#Seleciona o maior valor digitado na coluna carga
select min(carga) from cursos;	#Seleciona o menor valor digitado na coluna carga

select sum(carga) from cursos where ano = '2020'; #seleciona a soma de toda coluna carga da tabela cursos desde que a coluna
												  #ano do registro esteja preenchida com o ano de '2020'
                                                  
select avg(totaulas) from cursos;	#Seleciona a media da coluna totaulas da tabela cursos
											
                                            

 


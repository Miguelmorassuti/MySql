		#SELECT PT 3 - AGRUPAMENTOS

desc cursos;

select carga from cursos
group by carga;								#group by = agrupar por (oposto de distiguir)

select carga, count(nome) from cursos		#agrupa as cargas e mostra a quantidade registros inseridos no agrupamento
group by carga;								#é possivel utilizar os comandos ja apreendidos (max, min...)

select totaulas, nome from cursos where totaulas>30
group by totaulas;

select ano, count(*) from cursos			 #seleciona o ano e a conta a quantidade total de registros
group by ano								 #agrupa por ano 
having count(ano) >=5		#having = tendo  #apenas quem tem o coubt ano >5
order by count(*) desc; 

select carga, count(*) from cursos 			#seleciona a carga faz a contagem de todos os registros
where ano >2015								#onde o ano é superior a 2015
group by carga								#agrupa por carga
having carga > (select avg(carga) from cursos);	#agrupamento acontece (se a carga for maior a media de todos os cursos)
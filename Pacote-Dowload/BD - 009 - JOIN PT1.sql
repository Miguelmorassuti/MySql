			#JUNÇÕES (SELECIONANDO UM ATRIBUTO DE UMA TABELA COM UM ATRIBUTO DE OUTRA TABELA)
            
            # inner join (pode escrever apenas join) ele seleciona apenas os registros que tem a chave estrangeira como diferente de null
select gafanhotos.nome, gafanhotos.cursopreferido, cursos.nome, cursos.ano		#selecionando dados que quero buscar
from gafanhotos join cursos														#juntando as duas tabelas
on cursos.idcurso = gafanhotos.cursopreferido	#onde o valor do cursos.idcurso possui o mesmo valor do que o gafanhoto.cursopreferido 
order by gafanhotos.nome;

			#outer join serve para selecionar todos os registros ate mesmo os que não possuam dados na chave estrangeira
select gafanhotos.nome, gafanhotos.cursopreferido, cursos.nome, cursos.ano		
from gafanhotos left outer join cursos		#left outer join se o parametro é a tabela da esquerda #right outer join se o parametro é a 
on cursos.idcurso = gafanhotos.cursopreferido	#tabela da direita
order by gafanhotos.nome;
		#CHAVES ESTRANGEIRAS

use cadastro;
desc gafanhotos;
alter table gafanhotos add cursopreferido int;

alter table gafanhotos 
add foreign key(cursopreferido)			#add chave estranheira em curso prefeirdo
references cursos(idcurso);				#fazendo referencia a tabela cursos e sua primary key (idcurso)

select*from gafanhotos; 
select*from cursos; 

update gafanhotos set cursopreferido = '8' where id = '1'; #atualize tabela gafanhotos e defina curso preferido como 8 onde o id é 1

delete from cursos where idcurso = '8';		#nao da para apagar colunas que possuem referencia com outra tabela (foreign key)


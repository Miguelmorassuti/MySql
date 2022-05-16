		#MANIPULANDO REGISTROS

select*from cursos;

alter table cursos
add column id int first;
alter table cursos
add column nome varchar(20) after id; 

insert into cursos values
('1', 'PYTHON', 'CURSO DE PYTHON', '40', '2016'),
('2', 'JAVA', 'CURSO DE JAVA', '70', '2021'),
('3', 'c', 'C PARA INICIANTES', '50', '2008'),
('4', 'COBOL', 'COBOL PARA JOVENS', '260', '1992');

select *from cursos;

set sql_safe_updates =0;		
update cursos								#Mudando um atributo de um registro
set nome = 'languageC'						#Pode mudar mais de um atributo usando esse metodo (se forem de mesma linha), colocar virgula!
where id = '3'
limit 1;				#OPCIONAL O USO DO LIMIT, ELE SERVE PARA LIMITAR A QUANTIDADE DE REGISTROS QUE SERÃO ALTERADAS PELO COMANDO


			#APAGANDO REGISTRO(LINHA)
delete from cursos
where id = '3';				#PARA APAGAR VARIOS DE UMA VEZ, TIRA A OPÇÃO "SAFE UPDATES" DAS CONFIGURAÇÕES DO MYSQL

			#APAGANDO TODOS OS REGISTRO DE UMA VEZ
truncate cursos;
select*from cursos;




				#PARA ALTERAR O TIPO PRIMITIVO E CONSTRAINTS DOS DADOS USE:

alter table pessoas
modify column nome varchar (35) not null;		#alterando constraind da coluna que passa a ser "varchar (35) not null"
desc pessoas;

				#PARA ALTERAR O NOME DA COLUNA USE:
alter table pessoas
change column profissao prof varchar(20);		#vc tem que colocar o antigo nome e o novo e dps inserir todas as constraint novamente
		
				#PARA ALTERAR O NOME DE TODA TABELA USE:
alter table pessoas
rename to clientes;	


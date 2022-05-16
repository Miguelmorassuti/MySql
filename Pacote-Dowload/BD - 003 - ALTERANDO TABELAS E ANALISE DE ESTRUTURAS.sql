desc pessoas;                               #desc ou describe serve para demostar a estrutura da tabela (no caso tabela "pessoas")

alter table pessoas                         #função para aletrar tabela 
#add column profissao varchar(15);           #add coluna "profissao" na tabela (add como ultimo atributo)
add column profissao varchar(15) after nome;  	#PARA add o novo atributo depois de outro use: "after" NOME DO DADO ANTERIOR
#add column codigo int first;	#PARA add o novo atributo na primeira posição use: "first" no final da declaração

select*from pessoas;

				#Para apagar uma coluna faça isso a baixo
#alter table pessoas
#drop column profissao;
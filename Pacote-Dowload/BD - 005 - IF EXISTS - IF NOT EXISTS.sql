#CRIANDO NOVA TABELA (COM ASPECTO DIFERENTE, O IF NOT EXIST)

create table if not exists cursos (  #SO CRIA A TABELA SE NÃO EXISTIR NENHUMA OUTRA TABELA DE MESMO NOME
descricao text,
carga int unsigned,                  #UNSIGNED SERVE PARA INDICAR QUE OS DADOS DESSA COLUNA SÃO EXCLUSIVAMENTE POSITIVOS 
ano year DEFAULT "2022"
)default charset=utf8mb4; 

drop table if exists cursos;  		#SO APAGA SE EXISTIR
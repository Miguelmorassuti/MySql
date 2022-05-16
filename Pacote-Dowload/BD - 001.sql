create database CADASTROS
default character set utf8mb4
default collate utf8mb4_general_ci;

create table `pessoas` (                              #A CRASE SERVE PARA RESERVAR QUE O NOME DAS TABELAS NAO SEJA DADA PARA OUTRAS FUNÇÕES
`id` int not null auto_increment,  #NOT NULL É P/ TORNAR O PREENCHIMENTO DO ITEM EM OBRIGATORIO, AUTO INCREMENT É P/ CRIAR UM Nº P/ CADA CADASTRADO
`nome` varchar(30) not nuLl,
`nascimento` date,
`sexo` enum("M","F"),     
`peso` decimal(5,2),                                  #O 5 DEFINE O TOTAL DE N°s CADASTRADOS, O 2 DEFINE O TOTAL DE N°s DPS DA VIRGULA
`altura` decimal(3,2),
`nacionalidade` varchar(20) default "BRASIL",          #DEFAULT "BRASIL" SERVE PARA PREENCHER COMO BRASIL CASO USUARIO N PREENCHE ESSE DADO
primary key(id)                                        #CHAVE PRIMARIA, ESSE DADO CADA USUARIO DEVE POSSUIR UM EXCLUSIVO
)default charset = utf8mb4                             #ESSA LINHA VAI PADRONIZAR TODA ENTRADA DE DADOS PARA QUE ACEITE PONTUAÇÃO
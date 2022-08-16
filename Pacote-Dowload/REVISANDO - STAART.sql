create database STAART;		/*creating database*/
use STAART;

create table users(
id_user int auto_increment primary key,
nome varchar(35) not null,
username varchar(35) not null unique,
user_password varchar(35) not null,
created_at date not null
)default charset utf8mb4;

create table categories(
id_category int auto_increment primary key,
nome varchar(35) not null unique
);

/*INSERINDO DADOS*/
insert into categories(nome) values('SERIES');
insert into categories(nome) values('FILMES');
insert into categories(nome) values('DESNHOS');
insert into categories(nome) values('JOGOS AO VIVO');
insert into categories(nome) values('TERROR');
insert into categories(nome) values('COMÉDIA');
insert into categories(nome) values('COMÉDIA ROMANTICA');

/*INSERINDO DADOS*/
insert into users values
(default, 'Miguel', 'Miguelzin', '20032010', current_date()), 
(default, 'Jhulia', 'Jhu', '4321', current_date());

/*ATUALIZANDO DADO DA TABELA*/
update categories set nome = 'DESENHOS' where id_category =3;
update categories set nome = 'FUTEBOL' where id_category = 4;

/*UTILIZANDO O DELETE PARA REMOVER ALGUM ELEMENTO DA TABLE*/
delete from categories where id_category =4;

/*UTILIZANDO ALTER TABLE PARA MUDAR A ESTRUTURA DA TABLE*/
alter table users add constraint nome unique(nome);

/*OPERADORES*/
select*from categories where id_category in(3,5); #IN vai buscar os elementos passados no parâmetro
select*from categories where id_category between 2 and 5; #BETWEEN vai pegar todos elementos do intervalo entre 2 numeros
select*from categories where id_category != 1; #!= vai buscar tds os elementos diferentes do valor
select*from categories where id_category = 1; # = vai buscar tds os elementos que possuem o valor passado
select*from categories where id_category is not null; # IS NOT NULL vai buscar tds os campos onde o valor n é nulo
select*from categories where nome like 'COM%'; # LIKE vai buscar strings parecidas (n esquecer do %)
select*from categories where id_category > 1; # > vai buscar tds os valores maior do que o parametro ( < busca o menor)

/*CRIANDO UMA TABLE QUE RECEBE UMA CHAVE ESTRANGEIRA*/
create table profile(
id_profile int auto_increment primary key,
id_user_profile int,
bio varchar(300) default 'Minha Bio',
avatar_url varchar(200),
foreign key(id_user_profile) references users(id_user)
);

/*INSERINDO DADOS NA MINHA NOVA TABLE*/
insert into profile values
(default, 1, default, 'https://google.com.br/avatar');

/*CRIANDO UMA NOVA TABLE*/
create table conteudo(
id_conteudo int auto_increment primary key,
nome varchar(100),
id_category int,
duration time,
foreign key(id_category) references categories(id_category)
);

/*INSERINDO DADOS NA MINHA NOVA TABLE*/
insert into conteudo values
(default, 'PEPPA PIG', 3, '02:00'),
(default, 'SCOOBY-DO', '3', '01:47:00');

/*CRIANDO TABLE QUE LIGA TABELA DE N PARA N*/
create table users_conteudo(
id int auto_increment primary key,
id_users int,
id_conteudo int,
time_stopped time,
note int,
foreign key(id_users) references users(id_user),
foreign key(id_conteudo) references conteudo(id_conteudo)
);

/*INSERINDO DADOS NA MINHA NOVA TABLE*/
insert into users_conteudo values
(default, 2, 1, '01:10', 10),
(default, 1, 2, '00:51', 9);

/* INNER JOIN FAZ A INTERSEÇÃO DE DUAS TABELAS */
select * from users_conteudo
inner join users
on users_conteudo.id_users = users.id_user;

/* LEFT JOIN RETORNA TODOS OS REGISTROS DA TABELA DA ESQUERDA (TABLE 1) E OS REGISTROS CORRESPONDENTES DA DIREITA (TABLE 2) */
select* from users
left join users_conteudo
on users.id_user = users_conteudo.id_users;

/* LEFT JOIN SEM PEGAR A INTERSEÇÃO, RETORNA APENAS O QUE DIFERE DO CONJUNTO DA TABLE 1, (BUSCA ONDE O ID DA TABLE 2 É NULL)  */
select* from users
left join users_conteudo
on users.id_user = users_conteudo.id_users
where users_conteudo.id_users is null;

/*MySql não tem suporte a full outer join (junta todos os dados das tabelas*/


		-- FUNÇÕES IMPORTANTES!! --
-- COUNT - SERVE PARA CONTAR AS LINHAS DE REGISTRO
select count(*) from users;

-- MAX - IRA PEGAR O MAIOR VALOR INSERINDO EM UMA COLUNA DA TABLE
select max(note) from users_conteudo;

-- MIN - IRA PEGAR O MENOR VALOR INSERINDO EM UMA COLUNA DA TABLE
select min(note) from users_conteudo;

-- AVG - IRA TRAZER A MEDIA DE UMA COLUNA
select round(avg(note),2) from users_conteudo;

-- SUM - IRA FAZER A SOMA DE TODOS OS CAMPOS DE UMA COLUNA
select sum(note) from users_conteudo;

-- ORDER BY - IRA COLOCAR EM ORDEM CRESCENTE
select * from conteudo order by id_conteudo desc; -- desc no final deixa decrescente!








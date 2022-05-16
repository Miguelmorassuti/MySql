create database armazem;
use armazem;

								#CRIAÇÃO DAS TABELAS - EX 02
create table almoxerifado (
codalmoxerifado int auto_increment,
Nome varchar(30) not null,
Tel varchar(14) not null,
Tel2 varchar(14),
primary key(codalmoxerifado)
)default charset utf8mb4;

create table estoque(
idestoque int auto_increment,
Grupo varchar(25) not null,
Datacadastro date not null,
qtd int not null,
primary key(idestoque)
)default charset utf8mb4;

create table produtos(
idproduto int auto_increment,
nome varchar(25) not null,
valoruni float(4,2) not null,
primary key(idproduto)
)default charset utf8mb4;



								#INSERINDO DADOS - EX 03
INSERT INTO almoxerifado values
(DEFAULT, 'Matriz', '3433-1519', '3433-1520'),
(DEFAULT, 'Filial 01', '3433-1216', default),
(DEFAULT, 'Filial 02', '3433-1720', default);
select *from almoxerifado;

insert into estoque values
(DEFAULT, 'Limpeza', '2022-01-31', '50'),
(DEFAULT, 'Escritorio', '2022-02-15', '5000'),
(DEFAULT, 'Escritorio', '2021-04-21', '100'),
(DEFAULT, 'Limpeza', '2019-09-05', '20'),
(DEFAULT, 'Limpeza', '2022-02-25', '3'),
(DEFAULT, 'Escritorio', '2021-03-13', '500'),
(DEFAULT, 'Escritorio', '2021-08-17', '100'),
(DEFAULT, 'Escritorio', '2020-09-15', '30');
select * from estoque;

desc produtos;
insert into produtos values
(DEFAULT, 'Detergente', '2.50'),
(DEFAULT, 'PapelA4', '0.50'),
(DEFAULT, 'Lapis', '2.00'),
(DEFAULT, 'Sabao Liquido', '10.13');
select*from produtos;

							#EX 04 - LISTANDO PRODUTOS E QUANTIDADE DE ESTOQUE DA MATRIZ
alter table estoque
add column codproduto int;
 
 alter table estoque
 add foreign key (codproduto)
 references produtos(idproduto);
 
 UPDATE `armazem`.`estoque` SET `codproduto` = '1' WHERE (`idestoque` = '1');
UPDATE `armazem`.`estoque` SET `codproduto` = '2' WHERE (`idestoque` = '2');
UPDATE `armazem`.`estoque` SET `codproduto` = '3' WHERE (`idestoque` = '3');
UPDATE `armazem`.`estoque` SET `codproduto` = '1' WHERE (`idestoque` = '4');
UPDATE `armazem`.`estoque` SET `codproduto` = '4' WHERE (`idestoque` = '5');
UPDATE `armazem`.`estoque` SET `codproduto` = '2' WHERE (`idestoque` = '6');
UPDATE `armazem`.`estoque` SET `codproduto` = '2' WHERE (`idestoque` = '7');
UPDATE `armazem`.`estoque` SET `codproduto` = '3' WHERE (`idestoque` = '8');
 
alter table estoque
add column codalmox int;

alter table estoque 
add foreign key (codalmox)
references almoxerifado(codalmoxerifado);

UPDATE `armazem`.`estoque` SET `codalmox` = '1' WHERE (`idestoque` = '1');
UPDATE `armazem`.`estoque` SET `codalmox` = '1' WHERE (`idestoque` = '2');
UPDATE `armazem`.`estoque` SET `codalmox` = '1' WHERE (`idestoque` = '3');
UPDATE `armazem`.`estoque` SET `codalmox` = '3' WHERE (`idestoque` = '7');
UPDATE `armazem`.`estoque` SET `codalmox` = '3' WHERE (`idestoque` = '8');
UPDATE `armazem`.`estoque` SET `codalmox` = '2' WHERE (`idestoque` = '6');
UPDATE `armazem`.`estoque` SET `codalmox` = '2' WHERE (`idestoque` = '5');
UPDATE `armazem`.`estoque` SET `codalmox` = '2' WHERE (`idestoque` = '4');

select produtos.nome, estoque.qtd
from produtos join estoque
on produtos.idproduto = estoque.codproduto and estoque.codalmox=1;

			#EX 05 - LISTE O NOME DO ALMOXARIFADO, PRODUTO E O VALOR UNITARIO DOS PRODUTOS CUJO ESTOQUE ESTEJA ENTRE 30 E 1000 
select almoxerifado.nome, produtos.nome, produtos.valoruni from almoxerifado 
join estoque
on almoxerifado.codalmoxerifado = estoque.codalmox
join produtos
on  estoque.codproduto = produtos.idproduto and estoque.qtd between '30' and '1000' ;

		#EX 06 
select produtos.nome, estoque.qtd, round(estoque.qtd*produtos.valoruni) from produtos 
join estoque
on produtos.idproduto = estoque.codproduto;

		#EX 07 Elabore um DQL para exibir todos os produtos e seus grupos, cadastrados a mais de 180 dias
        
        
select produtos.nome, estoque.grupo from produtos 
join estoque
on produtos.idproduto = estoque.codproduto and 180<(datediff('2022-04-19', estoque.datacadastro)) ;

	#EX 08 Escreva um DML que altere a data de cadastro de todos os produtos do grupo denominado Limpeza para hoje

update estoque 
set datacadastro = '2022-04-19'
where grupo = 'Limpeza';

select * from estoque;

	#EX 09 Elabore um DML que apague todos os registros referentes à produtos do Almoxarifado Filial 01
delete from estoque where codalmox = '2'; 


        




							

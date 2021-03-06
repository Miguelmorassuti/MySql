#Vitor Marques - RA: 615846 
#Wesley Vianna de Freitas Florian RA - 617024 
#Miguel Guimarães Morassuti RA - 621927 
#José Nobre RA: 430439

create database DADOS;
use dados;

CREATE TABLE Empregado (
codEmp int not null auto_increment,
nome varchar(80) not null,
rg varchar(15),
salario DECIMAL(9,2) not null,
gerente char(1) not null,
CONSTRAINT PRIMARY KEY (codEmp)
) ENGINE InnoDB;

CREATE TABLE Dependente (
codEmp int not null,
codDep int not null,
nome varchar (80) not null,
rg int,
sexo char(1) not null,
data_nasc date not null,
grau_parantesco varchar(30) not null,
CONSTRAINT FOREIGN KEY 
(codEmp) REFERENCES empregado(codEmp)
) ENGINE InnoDB;

create table Departamento (
codDepto int not null,
Descricao varchar(40) not null,
CONSTRAINT PRIMARY KEY (CodDepto)
)ENGINE INNODB;


alter table empregado add column codDpto int after salario;
alter table Empregado add constraint fk_codDpto foreign key (codDpto) references Departamento (codDepto);


CREATE TABLE Projeto (
codProj varchar(20) not null,
nome varchar(20) not null,
codDepto int not null,
CONSTRAINT PK_CodProj PRIMARY KEY(codProj),
CONSTRAINT FK_CodDepto FOREIGN KEY
(CodDepto) REFERENCES departamento (codDepto)
) ENGINE InnoDB;

CREATE TABLE Projeto_Empregado (
codProj varchar(20) not null,
codEmp int not null,
horas int not null,
CONSTRAINT FK_CodProj FOREIGN KEY (codProj) 
REFERENCES Projeto (codProj),
CONSTRAINT FK_CodEmp FOREIGN KEY (codEmp)
REFERENCES Empregado (codEmp)
) ENGINE InnoDB;

insert into Departamento values
(10, 'Pesquisa'),
(20, 'Administração'),
(30, 'Finanças');

insert into Empregado values
(default, 'Francisco Santos', 146263269, '1000', '10', 'S'),
(default, 'Marcos Silva', 256325638, '500', '20', 'N'),
(default, 'José Souza', 256398563, '3000', '20', 'S'),
(default, 'Maria Silva', 569856423, '2000', '30', 'N'),
(default, 'Claudete Pereira', 125469856, '800', '30', 'N'),
(default, 'Sonia Oliveira', 568941263, '700', '30', 'S'),
(default, 'Vinicius Gaspar', 541256986, '1800', '10', 'N'),
(default, 'Luiz Carlos Ladeira', 256845965, '1500', '20', 'N');

insert into Dependente values
(1, 1, 'Pedro', 146263269, 'M', '1983-03-25', 'Filho'),
(1, 2, 'Silmara', 256325638, 'F', '1962-08-16', 'Esposa'),
(2, 1, 'Marcelo', 256398563, 'M', '1981-03-14', 'Filho'),
(4, 1, 'Mariana', 569856423, 'F', '1983-11-15', 'Filha'),
(4, 2, 'Fernanda', 856985412, 'F', '1965-03-18', 'Esposa'),
(6, 1, 'Rafaela', NULL, 'F', '2000-12-16', 'Filha'),
(8, 1, 'Jessica', NULL, 'F', '1992-03-22', 'Filha'),
(8, 2, 'Lucas', NULL, 'M', '1992-03-22', 'Filho');

insert into Projeto values
('P100', 'Projeto A', 20),
('P200', 'Projeto B', 30),
('P300', 'Projeto C', 10),
('P400', 'Projeto D', 30),
('P500', 'Projeto E', 10),
('P600', 'Projeto F', 20);

insert into Projeto_Empregado values
('P100', 1, 100),
('P100', 7, 80),
('P200', 2, 60),
('P200', 8, 60),
('P300', 5, 80),
('P300', 6, 80),
('P400', 4, 60),
('P400', 5, 80),
('P400', 6, 60),
('P500', 1, 240),
('P600', 3, 120),
('P600', 7, 120);

select*from projeto_empregado;
select*from projeto;
select*from departamento;
select*from dependente;
select*from empregado;


# 1 - Faça o comando SQL que mostre somente os empregados que trabalham em algum projeto.
select * from empregado
where codEmp in
	(select codEmp
	from projeto_empregado);	

# 2 - Faça o comando SQL que mostre o nome do departamento, a média de salários do departamento e a média de salários de toda a empresa.

select descricao, (select avg(salario) from empregado where departamento.codDepto = empregado.codDpto) as Media_Departamental,
	(select avg(salario) from empregado) as Media_geral
from departamento; 

# 3 - Faça o comando SQL que mostre o código e o nome do projeto, a quantidade de empregados no projeto, o total de horas do projeto.
select codProj, nome, 
	(select count(CodEmp) from projeto_empregado where projeto.codProj =
    projeto_empregado.codProj group by codProj) as Qtd_emp,
    (select sum(horas) from projeto_empregado where projeto.codProj =
    projeto_empregado.codProj group by codProj) as horas_totais
from projeto;


# 4 - Faça o comando SQL que mostre o código e o nome do projeto, a soma dos salarios dos empregados que trabalham no projeto e o nome do gerente do projeto.
# 2 subsqueries - uma para soma e outra para o nome do gerente

#PEDIR AJUDA PARA O PROF NA SALA
Select codProj, nome,
	(select sum(salario) from empregado where projeto_empregado.codEmp =
    empregado.codEmp group by codEmp) as SomaDosSalarios,
    (select nome from empregado where gerente like "%Sim%") as nomeGerente
from projeto;



# 5 - Faça o comando SQL que mostre os 3 projetos com horas gastas maior que a média.

SELECT nome, media, Posicao from(   
	select nome,
		(select avg(horas) from projeto_empregado where projeto_empregado.codProj = projeto.codProj) as media,
		RANK() OVER (ORDER BY (select avg(horas) from projeto_empregado where projeto_empregado.codProj = projeto.codProj)desc) as Posicao
	from projeto
) Dados
where Posicao <= 3;


# 6 - Faça o comando SQL que mostre o nome dos empregados que têm o maior salário.
#OS NOMES DE QUEM POSSUI SALÁRIO MAIOR DO QUE A MEDIA
SELECT nome from empregado
where salario>
	(select avg(salario) 
    from empregado);


# 7 - Faça o comando SQL que mostre o nome dos empregados que não têm dependentes.
select nome from empregado
 where codEmp not in
	(select codEmp
    from dependente);



create database DADOS;
use dados;

CREATE TABLE Empregado (
codEmp int not null,
nome varchar(80) not null,
rg int not null,
salario DECIMAL(9,2) not null,
codDepto int not null,
gerente boolean not null,
CONSTRAINT PK_Empregado PRIMARY KEY (codEmp)
) ENGINE InnoDB;

CREATE TABLE Dependente (
codEmp int not null,
codDep int not null,
nome varchar (80) not null,
rg int,
sexo char(1) not null,
data_nasc date not null,
grau_parantesco varchar(30) not null,
CONSTRAINT PK_CodDep PRIMARY KEY (codDep),
CONSTRAINT FK_Dependente FOREIGN KEY 
(codEmp) REFERENCES empregado(codEmp)
) ENGINE InnoDB;

create table Departamento (
codDepto int not null,
Descricao varchar(50) not null,
CONSTRAINT PK_CodDepto PRIMARY KEY (CodDepto)
)ENGINE INNODB;

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

alter table Empregado add constraint fk_codDpto foreign key (codDepto) references Departamento (codDepto);


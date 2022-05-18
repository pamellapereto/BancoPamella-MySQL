/**
	Agenda de Contatos
    @author Pamella Pereto
*/

-- CTRL + Enter
-- Verificar banco de dados 
show databases;
-- Criar um novo banco da dados
create database teste;
create database agendapamella;
-- Excluir um banco de dados
drop database teste;
-- Selecionar um banco de dados
use agendapamella;

-- Criando uma tabela
-- int ➞ tipo de dado - números inteiros
-- decimal (exemplo: 10,2) ➞ tipo de dado - números não inteiros
-- (10,2) ➞ 10 dígitos com 2 casas decimais
-- primary key ➞ transforma o campo em chave primária
-- auto_increment ➞ numeração automática
-- varchar(255) ➞ tipo de dado - string (com variação)
-- char(255) ➞ tipo de dado - string (sem variação)
-- (255) ➞ máximo de caracteres
-- not null ➞ obrigatório o preenchimento

create table contatos (
 id int primary key auto_increment,
 nome varchar(255) not null,
 fone varchar(255) not null,
 email varchar(255)
);

-- Verificar tabelas do banco
show tables;

-- Descrever a tabela
describe contatos;

-- Adicionando uma coluna (campo) à tabela
alter table contatos add column obs varchar(255);
alter table contatos add column fone2 varchar(255);

-- Modificar uma propriedade da tabela
alter table contatos modify column cel varchar(255) not null;

-- Adicionando uma coluna (campo) à tabela após outra coluna
alter table contatos modify column fone2 varchar(255) after fone;
alter table contatos add column cel varchar(255) after fone2;

-- Excluir uma coluna (campo) da tabela
alter table contatos drop column obs;

-- Excluir a tabela
drop table contatos;


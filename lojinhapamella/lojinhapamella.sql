/**
	Lojinha
    @author Pamella Pereto
*/

-- CTRL + Enter
-- Verificar banco de dados 
show databases;
-- Criar um novo banco da dados
create database lojinhapamella;

-- Selecionar um banco de dados
use lojinhapamella;

-- Criando uma tabela
-- int ➞ tipo de dado - números inteiros
-- decimal (10,2) ➞ tipo de dado - números não inteiros
-- (10,2) ➞ 10 dígitos com 2 casas decimais
-- primary key ➞ transforma o campo em chave primária
-- auto_increment ➞ numeração automática
-- varchar(255) ➞ tipo de dado - string (com variação)
-- char(255) ➞ tipo de dado - string (sem variação)
-- (255) ➞ máximo de caracteres
-- not null ➞ obrigatório o preenchimento

create table produtos (
 id int primary key auto_increment,
 nomeProd varchar(255) not null,
 quantidade int not null,
 preco varchar(255) not null
);

-- Verificar tabelas do banco
show tables;

-- Descrever a tabela
describe produtos;

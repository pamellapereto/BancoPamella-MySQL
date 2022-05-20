/**
	Lojinha Pamella - CRUD
    @author Pamella Pereto
    @version 1.0
*/

-- CTRL + Enter
-- Verificar banco de dados 
show databases;
-- Criar um novo banco da dados
create database lojinhapamellaCRUD;

-- Selecionar um banco de dados
use lojinhapamellaCRUD;

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
 codigo int primary key auto_increment,
 produto varchar(255) not null,
 quantidade int not null,
 valor decimal(10,2)
);

-- Verificar tabelas do banco
show tables;

-- Descrever a tabela
describe produtos;

/***** CRUD *****/

-- CRUD CREATE
-- Inserir um registro na tabela
-- Tipo varchar ou char usar 'aspas simples'
-- Ao cadastrar número decimal, utilizar ponto
insert into produtos (produto, quantidade, valor)
values ('Cropped preto', 3, 39.90);

insert into produtos (produto, quantidade, valor)
values ('Saia rosa', 5, 54.90);

insert into produtos (produto, quantidade, valor)
values ('Blusa branca', 9, 44.90);

insert into produtos (produto, quantidade, valor)
values ('Calça jeans', 7, 84.90);

insert into produtos (produto, quantidade, valor)
values ('Vestido verde', 10, 119.90);

insert into produtos (produto, quantidade, valor)
values ('Macacão azul', 12, 139.90);

-- CRUD READ
-- Seleção de todos os registros da tabela
select * from produtos;

-- Criando apelidos para os campos e ordenando itens por ordem alfabética
select codigo as Código, produto as Produto, quantidade as Estoque, valor as Preço from produtos order by produto;

-- Seleção de um registro (produto) específico
select * from produtos where codigo=3;
select * from produtos where produto='Vestido verde';
select * from produtos where produto like 'c%';

-- CRUD UPDATE
update produtos set valor = 109.90 where codigo=2;

-- CRUD DELETE
delete from produtos where codigo=6;
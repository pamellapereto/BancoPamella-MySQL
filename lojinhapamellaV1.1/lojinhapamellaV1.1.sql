/*
	Lojinha Pamella
    @author Pamella Pereto
    @version 1.1
*/

show databases;

use lojinhapamellaCorrigida;

create table usuarios (
	idusu int primary key auto_increment,
    usuario varchar(255) not null,
    login varchar(255) not null unique,
    senha varchar(255) not null,
    perfil varchar(255) not null
);
describe usuarios;

insert into usuarios (usuario, login, senha, perfil)
values ('administrador','admin',md5('admin'),'admin');

insert into usuarios (usuario,login,senha,perfil)
values ('Pamella','pamella',md5('123456'),'user');

select * from usuarios;

select * from usuarios where login='admin' and senha=md5('admin');

drop table produtos; 

create table produtos (
	codigo int primary key auto_increment,
    barcode varchar(255),
	produto varchar(255) not null,
    descricao varchar(255) not null,
    fabricante varchar(255) not null,
    datacad timestamp default current_timestamp,
    dataval date not null,
    estoque int not null,
    estoquemin int not null,
    unidade varchar(255) not null,
    localizacao varchar(255),
    custo decimal (10,2) not null,
    lucro decimal (10,2),
    venda decimal (10,2)
);

-- ATIVIDADE 2 EM 25.05: Alterar o campo barcode adicionando UNIQUE
alter table produtos modify column barcode varchar(255) unique;

describe produtos;

-- ATIVIDADE 1 EM 25.05: Criar 10 registros na tabela de produtos
insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values ('1234567890','saia','rosa','Renner',21220525,3,5,'UN','Setor Roupas',54.90,55,109.90);

insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values ('1111111111','blusa','verde','Renner',21220525,20,5,'UN','Setor Roupas',59.90,60,119.90);

insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values ('2222222222','vestido','amarelo','Marisa',20220519,14,9,'UN','Setor Roupas',39.90,85,124.90);

insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values ('3333333333','cropped','azul','Marisa',20220518,19,13,'UN','Setor Roupas',99.90,99.59,199.49);

insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values ('4444444444','calça','branca','Shein',20220517,15,8,'UN','Setor Roupas',33.90,40.59,74.49);

insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values ('5555555555','chemise','listrado','Shein',21220525,4,10,'UN','Setor Roupas',49.90,65,114.90);

insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values ('6666666666','shorts','jeans','Forever 21',21220525,50,30,'UN','Setor Roupas',33.33,51.57,84.90);

insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values ('7777777777','bermuda','jeans','Forever 21',21220525,33,24,'UN','Setor Roupas',19.90,25,44.90);

insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values ('8888888888','casaco','marrom','C&A',21220525,22,16,'UN','Setor Roupas',24.90,25,49.90);

insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values ('9999999999','macacão','rosa','C&A',21220525,18,17,'UN','Setor Roupas',19,35.49,54.49);


select * from produtos;

-- Inventário de estoque (patrimônio)
-- sum() ➙ função de soma no banco de dados
select sum(estoque * custo) as Total from produtos;

-- Relatório de reposição de estoque 1
select * from produtos where estoque < estoquemin;

-- Relatório de reposição de estoque 2
-- date_format() ➙ função usada para formatar a data
-- %d/%m/%Y dd/mm/aaaa | %d/%m/%y dd/mm/aa
select codigo,produto,
date_format(dataval, '%d/%m/%Y') as data_validade,
estoque, estoquemin as estoque_mínimo
from produtos where estoque < estoquemin;

-- Relatório de validade de produtos 1
select codigo,produto,
date_format(dataval, '%d/%m/%Y') as data_validade
from produtos;

-- Relatório de validade de produtos 2
-- datediff() ➙ calcular a diferença em dias
-- curdate() ➙ obtém a data atual
select codigo,produto,
date_format(dataval, '%d/%m/%Y') as data_validade,
datediff(dataval, curdate()) as dias_restantes
from produtos;


create table clientes (
idcli int primary key auto_increment,
nome varchar (255) not null,
fone varchar (255) not null,
cpf varchar(255) unique,
email varchar (255),
marketing varchar (255) not null,
cep varchar (255),
endereco varchar (255),
numero varchar (255),
complemento varchar (255),
bairro varchar (255), 
cidade varchar (255),
uf char (2)
);


-- ATIVIDADE 3 EM 25.05: Adicionar o campo nascimento na tabela clientes
alter table clientes add column nascimento date after cpf;

describe clientes;

-- CRUD CREATE
-- ATIVIDADE 4 EM 25.05: Inserir registros na tabela clientes
insert into clientes (nome, fone, cpf, nascimento, email, marketing)
values ('Pamella Pereto', '1196455-6220', '383.036.508-07', 19970714, 'pamellapereto@gmail.com', 'sim');

insert into clientes (nome, fone, cpf, nascimento, email, marketing)
values ('Henrique Neto', '1196182-4236', '377.314.998-04', 19911004, 'henriquens4@gmail.com', 'sim');

insert into clientes (nome, fone, email, marketing)
values ('Pedro Pereira', '2194292-7163', 'pedropereira@gmail.com', 'sim');

insert into clientes (nome, fone, marketing)
values ('Roberto Macedo', '2191237-3765', 'não');

insert into clientes (nome, fone, marketing, cep, endereco, numero, complemento, bairro, cidade, uf)
values ('Rosangela Aparecida', '1194123-7766', 'não', '03728-000', 'Rua São José do Campestre', '390', 'Casa 2', 'Jardim Danfer', 'São Paulo', 'SP');

insert into clientes (nome, fone, marketing, cep, endereco, numero, bairro, cidade, uf)
values ('Ana Dutra', '1193695-2312', 'não', '03324-100', 'Rua Miguel Leão', '150', 'Vila Silvia', 'São Paulo', 'SP');

select * from clientes;

-- CRUD UPDATE
-- ATIVIDADE 4 EM 25.05: Alterar o telefone de um cliente
update clientes set fone = '1197231-5819' where idcli=6;

-- CRUD DELETE
-- ATIVIDADE 4 EM 25.05: Alterar o telefone de um cliente
delete from clientes where idcli=3;

-- ATIVIDADE 5 EM 25.05: Relatório personalizado de clientes 1 (focando em contato)
select nome as Nome, fone as Contato, email as Email
from clientes;

-- ATIVIDADE 5 EM 25.05: Relatório personalizado de clientes 2 (focando em aniversário)
select nome as Nome,
date_format(nascimento, '%d/%m/%Y') as Nascimento
from clientes;

-- ATIVIDADE 5 EM 25.05: Relatório personalizado de clientes 3 (focando em e-mail marketing)
select nome as Nome,
email as Email from clientes where marketing = 'sim';


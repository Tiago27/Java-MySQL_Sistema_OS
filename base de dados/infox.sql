
create database dbinfox;

use dbinfox;

create table tbusuarios(
iduser int primary key,
usuario varchar(50) not null,
fone varchar(15), 
login varchar(15) not null unique,
senha varchar(15) not null
);

-- Insere dados nas tabelas
insert into tbusuarios (iduser, usuario, fone, login, senha)
values
(1, 'José de Assis', '9999-9999', 'joseassis', '123456'),
(2, 'Administrador', '9999-9999', 'administrador', '123456'),
(3, 'Bill Gates', '9999-9999', 'bill', '123456');

-- mostra os dados na tabela
select * from tbusuarios;

-- atualiza os dados da tabela
update tbusuarios 
set fone='8888-8888' 
where iduser=2;

-- deleta uma registro da tabela(deleta uma linha da tabela)
delete from tbusuarios where iduser=3;

create table tbclientes(
idcliente int primary key auto_increment,
nomecliente varchar(50) not null,
endereco varchar(100),
fonecliente varchar(50) not null,
emailcliente varchar(50)
);

select * from tbclientes;

insert into tbclientes(nomecliente, endereco, fonecliente, emailcliente)
value('Creuza', 'Creuzopolis', '4123-4234', 'creuzere@email.com');

update tbclientes
set emailcliente='creuzera@email.com'
where idcliente = 1;

use dbinfox;

create table tbos(
os int primary key auto_increment,
data_os timestamp default current_timestamp, -- isere dada e hora automaticamente
defeito varchar(150) not null,
servico varchar(150),
tecnico varchar(39),
valor decimal(10,2),
idcliente int not null,
foreign key(idcliente) references tbclientes(idcliente)
);

describe tbos;

insert into tbos
(defeito, servico, tecnico, valor, idcliente)
value
('não lifa', 'Sim', 'Genivaldo', 133.43, '1');

alter table tbos
modify column equipamento varchar(150) not null after os;

	
select * from tbos;

update tbos
set equipamento='Notebok', servico='trocar a fonte'
where os=1;

update tbos
set defeito = 'não liga'
where os=1;


-- traz informações de duas tabaleas

select 
O.os, equipamento, defeito, servico, valor,
C.nomecliente, fonecliente 
from tbos as O inner join tbclientes as C
on (O.idcliente = C.idcliente); 
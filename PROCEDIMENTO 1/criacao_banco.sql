create table pessoa (
	idPessoa integer not null primary key,
    nome varchar (255) not null,
    logradouro varchar (255) not null,
    cidade varchar (255) not null,
    estado char (2) not null,
    telefone varchar (11) not null,
    email varchar (255) not null
);

create table pessoaFisica (
	idPessoa integer not null primary key,
    cpf varchar(11) not null,
    constraint fk_pessoaFisica_pessoa foreign key (idPessoa) references pessoa (idPessoa)
);

create table pessoaJuridica (
	idPessoa integer not null primary key,
    cnpj varchar(14) not null,
    constraint fk_pessoaJuridica_pessoa foreign key (idPessoa) references pessoa (idPessoa)
);

create table usuario (
	idUsuario integer not null primary key,
    login varchar (50) not null,
    senha varchar (50) not null
);

create table produto (
	idProduto integer not null primary key,
    nome varchar (255) not null,
    quantidade integer not null,
    precoVenda numeric
);

create table movimento (
	idMovimento integer not null primary key,
    idUsuario integer not null,
    idPessoa integer not null,
    idProduto integer not null,
    quantidade integer not null,
    tipoMovimento char (1) not null,
    valorUnitario float not null,
	constraint fk_movimento_usuario foreign key (idUsuario) references usuario (idUsuario),	
    constraint fk_movimento_pessoa foreign key (idPessoa) references pessoa (idPessoa),
    constraint fk_movimento_produto foreign key (idProduto) references produto (idProduto)
);

create table sequenciaPessoa (
	id int auto_increment primary key
);

create index pessoaFisica_fkindex1 on pessoaFisica (idPessoa);
create index pessoaJuridica_fkindex2 on pessoaJuridica (idPessoa);

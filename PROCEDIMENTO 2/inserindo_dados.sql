-- INSERINDO USUARIO
insert into usuario
	(idUsuario, login, senha)
values
	(1, 'op1', 'op1'),
    (2, 'op2', 'op2')
;
-- INSERINDO PRODUTO
insert into produto
	(idProduto, nome, quantidade, precoVenda)
values
	(1, 'Banana', 100, 5.00),
    (2, 'Laranja', 500, 2.00),
    (3, 'Manga', 800, 4.00)
;
-- INSERINDO PESSOAS FISICAS E JURIDICAS
insert into pessoa 
	(idPessoa, nome, logradouro, cidade, estado, telefone, email)
values
	(7, 'Joao', 'Rua 12, casa 3', 'Riacho do Sul', 'PA', '1111-1111', 'joao@riacho.com'),
	(1, "Ferdinand Vaughan","Malesuada Rd.","Divinópolis","RS","1382-1754","at.sem@aol.com"),
    (2, "Jermaine Faulkner","7971 Nulla Street","Lima","SC","4210-9413","ut.molestie@outlook.net"),
	(3, "Avram Banks","3066 Mi Rd.","Ciudad Santa Catarina","PR","1423-2371","nunc@protonmail.ca"),
    (4, "Allen Flowers","5075 Malesuada Road","Uman","GO","3771-8832","fringilla.purus@yahoo.couk"),
	(5, "India Spencer","4332 Eget St.","Governador Valadares","RN","5253-5530","nisi.mauris@yahoo.ca"),
    (6, "Tanek Roy","3862 Ut, Road","Christchurch","RJ","3242-6301","eget@hotmail.edu"),
	(8, "Deacon Pickett","7634 Curabitur Ave","Alto del Carmen","RS","7511-7288","donec.egestas@protonmail.com"),
    (9, "Meredith Gaines","P.O. Box 867, 5786 Elit. Ave","Melton","SC","6904-7307","orci@yahoo.org"),
	(10, "Damian Sweet","Ap #657-9669 Ut, St.","Nizhny","PR","5981-5724","ac@hotmail.net"),
    (11, "Latifah Conway","Ap #628-8354 Auctor Av.","Sokoto","GO","1224-6424","consectetuer.adipiscing@icloud.com"),
	(12, "Astra Serrano","Ap #210-4769 Vivamus Rd.","Lambayeque","RN","9537-8153","tincidunt.vehicula.risus@google.couk"),
    (15, 'JJC', 'Rua 11, Centro', 'Riacho do Norte', 'PA', '1212-1212', 'jjc@riacho.com')
;
insert into pessoaFisica
	(idPessoa, cpf)
value
	(7, '11111111111'),
	(1, "00000000000"),
	(3, "99999999999"),
	(5, "77777777777"),
	(8, "66666666666"),
	(10, "55555555555"),
	(12, "44444444444")
;
insert into pessoaJuridica
	(idPessoa, cnpj)
value
	(15, '22222222222222'),
	(2, "22222222222222"),
	(4, "44444444444444"),
	(6, "66666666666666"),
	(9, "88888888888888"),
	(11, "99999999999999")
;
-- INSERIR MOVIMENTACAO DE ENTRADA/SAIDA
insert into movimento 
	(idMovimento, idUsuario, idPessoa, 
    idProduto, quantidade, tipoMovimento, 
    valorUnitario)
value
	(1, 1, 7, 1, 20, 'S', 4.00),
	(4, 1, 7, 2, 15, 'S', 2.00),
	(5, 2, 7, 2, 10, 'S', 3.00),
	(7, 1, 15, 2, 15, 'E', 5.00),
	(8, 1, 15, 3, 20, 'E', 4.00)
;


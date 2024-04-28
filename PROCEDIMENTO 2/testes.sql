-- DADOS P FISICAS
select
	pessoa.idPessoa,
    pessoa.nome,
	pessoa.logradouro,
	pessoa.cidade,
	pessoa.estado,
	pessoa.telefone,
	pessoa.email,
    pessoaFisica.cpf
from
	pessoa
join
	pessoaFisica on pessoa.idPessoa = pessoaFisica.idPessoa
;
-- DADOS P JURIDICAS
select
	pessoa.idPessoa,
    pessoa.nome,
    pessoa.logradouro,
    pessoa.cidade,
    pessoa.estado,
    pessoa.telefone,
    pessoa.email,
    pessoaJuridica.cnpj
from 
    pessoa
join 
    pessoaJuridica ON pessoa.idPessoa = pessoaJuridica.idPessoa
;
-- MOVIMENTACAO DE ENTRADAS
select
	movimento.idMovimento,
    produto.nome as produto,
    pessoa.nome as fornecedor,
    movimento.quantidade,
    movimento.valorUnitario,
    (movimento.quantidade * movimento.valorUnitario) as valorTotal
from
	movimento
join
	produto on movimento.idProduto = produto.idProduto
join
	pessoa on movimento.idPessoa = pessoa.idPessoa
where
	movimento.tipoMovimento = 'E'
;
-- MOVIMENTACAO DE SAIDAS
select
	movimento.idMovimento,
    produto.nome as produto,
    pessoa.nome as fornecedor,
    movimento.quantidade,
    movimento.valorUnitario,
    (movimento.quantidade * movimento.valorUnitario) as valorTotal
from
	movimento
join
	produto on movimento.idProduto = produto.idProduto
join
	pessoa on movimento.idPessoa = pessoa.idPessoa
where
	movimento.tipoMovimento = 'S'
;
-- TOTAL DE ENTRADAS
select
	produto.nome as produto,
    sum(movimento.quantidade * movimento.valorUnitario) as valorTotalEntradas
from
	movimento
join
	produto on movimento.idProduto = produto.idProduto
where
	movimento.tipoMovimento = 'E'
group by
	produto.nome
;
-- TOTAL DE SAIDAS
select
	produto.nome as produto,
    sum(movimento.quantidade * movimento.valorUnitario) as valorTotalSaidas
from
	movimento
join
	produto on movimento.idProduto = produto.idProduto
where
	movimento.tipoMovimento = 'S'
group by
	produto.nome
;
-- OPERADOR SEM MOVIMENTACAO DE ENTRADA
select
	usuario.idUsuario,
    usuario.login
from
	usuario
left join
	movimento on usuario.idUsuario = movimento.idUsuario and movimento.tipoMovimento = 'E'
where
	movimento.idMovimento is null
;
-- TOTAL ENTRADA POR OPERADOR
select 
    usuario.idUsuario,
    usuario.login,
    sum(movimento.quantidade * movimento.valorUnitario) as valorTotalEntrada
from 
    usuario
join 
    movimento on usuario.idUsuario = movimento.idUsuario and movimento.tipoMovimento = 'E'
group by 
    usuario.idUsuario, usuario.login
;    
-- TOTAL SAIDA POR OPERADOR
select 
    usuario.idUsuario,
    usuario.login,
    sum(movimento.quantidade * movimento.valorUnitario) as valorTotalSaida
from 
    usuario
join 
    movimento ON usuario.idUsuario = movimento.idUsuario and movimento.tipoMovimento = 'S'
group by
    usuario.idUsuario, usuario.login
;
-- MEDIA VENDA POR PRODUTO
select 
    produto.idProduto,
    produto.nome,
    sum(movimento.quantidade * movimento.valorUnitario) / sum(movimento.quantidade) as valorMedioVenda
from 
    produto
join 
    movimento ON produto.idProduto = movimento.idProduto
group by 
    produto.idProduto, produto.nome
;
use sakila;

-- Primeiro
select ator_id, count(ator_id) as 'Quantidade de filmes', primeiro_nome, ultimo_nome from filme_ator join ator using (ator_id) where ator_id between 50 and 150 group by ator_id;

-- Segundo
select ator_id, count(ator_id) as 'Qtdade filmes', primeiro_nome, ultimo_nome from filme_ator join ator using (ator_id) group by ator_id having count(ator_id) > 20;

-- Terceiro
CREATE VIEW atores_mais_20_filmes AS
SELECT ator_id, count(atatores_mais_20_filmesor_id) as 'Quantidade de filmes', primeiro_nome, ultimo_nome from filme_ator join ator using (ator_id) group by ator_id having count(ator_id) > 20;

-- Quarto
select pais from pais order by pais asc;

-- Quinto
select concat(primeiro_nome, ' ', ultimo_nome) as 'Nome completo' from cliente order by primeiro_nome asc;

-- Sexto
select titulo, descricao from filme where titulo like '%AT%' 
union 
select titulo, descricao from filme where descricao like '%N';

-- Sétimo
delimiter 
create trigger depois_inserir_pais after insert on pais for each row begin insert into auditoria_pais (pais_id, pais, criado_em) values (New.pais_id, new.pais, now());
end;
delimiter;

/* Oitavo
Left join: Junta/Retorna todos os dados da tabela mencionada à esquerda e os existentes na tabela da direita;
Right join: Junta/Retorna todos os dados da tabela mencionada à direita e os existentes na tabela da esquerda;
Inner join: Junta/Retorna os dados em comum das tabelas;
*/

-- Nono
select titulo, descricao, ano_de_lancamento, duracao_da_locacao, categoria_id, nome, categoria.ultima_atualizacao from filme 
join filme_categoria using(filme_id) join categoria using(categoria_id) 
where titulo like '%up%' and duracao_da_locacao >= 5;

-- Décimo
SELECT titulo, descricao, ano_de_lancamento, duracao_da_locacao, 
(SELECT nome FROM categoria WHERE categoria.categoria_id = 
(SELECT filme_categoria.categoria_id FROM filme_categoria WHERE filme_categoria.filme_id = filme.filme_id)) as 'Nome categoria',
(SELECT categoria_id FROM filme_categoria WHERE filme_categoria.filme_id = filme.filme_id) as 'Id categoria'
FROM filme WHERE titulo LIKE '%up%' AND duracao_da_locacao >= 5;

-- Décimo primeiro
select data_de_aluguel, inventario_id, cliente_id, funcionario_id from aluguel where data_de_devolucao is null;
use sakila;

select * from filme;

SELECT titulo from filme;

select * from filme where duracao_do_filme < 60;

select * from cliente where ativo = 0;

select * from cliente join endereco using(endereco_id);

select * from cliente join endereco using(endereco_id) join cidade using (cidade_id) join pais using (pais_id) having pais = 'Brazil';

select * from filme join filme_ator using(filme_id) join ator using (ator_id) order by filme_id asc;

select * from filme join filme_ator using(filme_id) join ator using (ator_id) order by ator_id asc;

select * from filme join filme_ator using(filme_id) join ator using (ator_id) having ator_id = 1;

SELECT COUNT(filme_id) AS total_filmes FROM filme;

select avg(duracao_do_filme) as duracao_media from filme;

SELECT categoria_id, COUNT(filme_id) AS total_filmes FROM filme_categoria GROUP BY categoria_id;

SELECT fc.categoria_id, AVG(f.duracao_do_filme) AS duracao_media_filme
FROM filme_categoria fc
JOIN filme f ON fc.filme_id = f.filme_id
GROUP BY fc.categoria_id;

SELECT categoria_id, COUNT(filme_id) AS total_filmes FROM filme_categoria GROUP BY categoria_id having total_filmes < 57;


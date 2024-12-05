use sakila;
describe cliente;

select primeiro_nome, ultimo_nome, email from sakila.cliente order by primeiro_nome;

select primeiro_nome, ultimo_nome, email from sakila.cliente order by primeiro_nome desc;

select primeiro_nome, ultimo_nome, email from sakila.cliente limit 10;

select primeiro_nome, ultimo_nome, email from sakila.cliente order by primeiro_nome limit 10, 10; /* pula os 10 primeiros e exibe os 10 próximos.*/

describe sakila.filme;
select titulo from sakila.filme where titulo like 'agent';
select titulo from sakila.filme where titulo like '%agent%';

select titulo from sakila.filme where titulo like 'lola agent';
select titulo from sakila.filme where titulo = 'lola agent';

select titulo from sakila.filme where titulo like 'a%';

select * from sakila.filme where titulo like 'a%';

select filme_id, titulo, duracao_do_filme from sakila.filme where filme_id > 100;

select filme_id, titulo, duracao_do_filme from filme where duracao_do_filme between 100 and 130 order by duracao_do_filme, titulo; -- ordena primeiro por duracao e depois por titulo --

select filme_id, titulo, duracao_do_filme from filme where duracao_do_filme <> 130 order by duracao_do_filme desc, titulo asc; -- ordena primeiro por duracao e depois por titulo --

select titulo from filme where titulo > 'C' order by titulo;

select titulo from filme where titulo > 'java' order by titulo;

select titulo from filme where titulo > 'C' and titulo < 'd' order by titulo;

select filme_id, titulo, duracao_do_filme from sakila.filme where filme_id = 101 and duracao_do_filme = 180;

select * from sakila.cliente where primeiro_nome like 'c%' and ultimo_nome like 's%';
select * from sakila.cliente where primeiro_nome like 'c%' or ultimo_nome like 's%';
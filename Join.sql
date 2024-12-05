use sakila;
select * from cidade;
select * from pais;

select * from cidade join pais on cidade.pais_id = pais.pais_id;
select * from cidade left join pais on cidade.pais_id = pais.pais_id;
select * from cidade right join pais on cidade.pais_id = pais.pais_id;

insert into pais values(null, 'South Sudan', current_timestamp());

select * from cidade right join pais using(pais_id);
select * from cidade inner join pais using(pais_id);

select primeiro_nome, ultimo_nome, sum(valor) from cliente 
join pagamento on cliente.cliente_id = pagamento.cliente_id 
where ultimo_nome like 'a%' group by cliente.cliente_id 
having sum(valor) < 100 order by sum(valor) desc;

select primeiro_nome, ultimo_nome, sum(valor) from cliente c
join pagamento p on c.cliente_id = p.cliente_id 
where ultimo_nome like 'a%' group by c.cliente_id 
having sum(valor) < 100 order by sum(valor) desc;


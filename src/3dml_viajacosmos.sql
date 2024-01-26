--Consulta 1: Nome de todos os acompanhantes que um titular já teve
SELECT t.nome AS Nome_Titular, a.nome AS Nome_Acompanhante
FROM titular t
JOIN acompanhante a ON t.cpf = a.titular;

--Consulta 2: Quantos clientes cada agente teve entre 2018 e 2020
SELECT ag.cpf, ag.nome, COUNT(DISTINCT r.titular) AS Qtd_Clientes
FROM agente_viagem ag
JOIN reserva r ON ag.cpf = r.agente_viagem
JOIN viagem v ON r.viagem = v.id
WHERE EXTRACT(YEAR FROM v.data_hora) BETWEEN 2018 AND 2020
GROUP BY ag.cpf, ag.nome;

--Consulta 3: Quantas reservas possuem status 'Cancelado' entre 2018 e 2020
SELECT COUNT(*) AS Qtd_Reservas_Canceladas 
FROM reserva r
JOIN viagem v ON r.viagem = v.id
WHERE r.status = 'Cancelado'
AND EXTRACT(YEAR FROM v.data_hora) BETWEEN 2018 AND 2020;

--Consulta 4: Quantas estadias foram do tipo hotel, resort e pousada em 2018
SELECT e.tipo_estadia, COUNT(*) AS Qtd_Estadias
FROM estadia e
JOIN reserva r ON e.cnpj = r.estadia
JOIN viagem v ON r.viagem = v.id
WHERE EXTRACT(YEAR FROM v.data_hora) = 2018
GROUP BY e.tipo_estadia;

--Consulta 5: Nome dos planetas que possuem todas as espécies que tem em WASP-12b 
SELECT DISTINCT h1.planeta
FROM habitacao h1
WHERE NOT EXISTS (
    SELECT h2.especie
    FROM habitacao h2
    WHERE h2.planeta = 'WASP-12b'
    AND NOT EXISTS (
        SELECT h3.especie
        FROM habitacao h3
        WHERE h3.planeta = h1.planeta
        AND h3.especie = h2.especie
    )
);
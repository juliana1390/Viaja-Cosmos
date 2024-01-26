INSERT INTO nave (num_serie, fabricante, carga_maxima, capacidade_tanque, num_lugares)
VALUES
    ('NS001', 'FabA', 1000, 500, 50),
    ('NS002', 'FabB', 1500, 700, 10),
    ('NS003', 'FabC', 800, 400, 30),
    ('NS004', 'FabA', 1200, 600, 20),
    ('NS005', 'FabD', 900, 450, 60);


INSERT INTO planeta (nome, localizacao)
VALUES
    ('WASP-12b', 'Const Cygnus'),
    ('Marte', 'Sist Solar'),
    ('Proxima Centauri b', 'Prox Centauri'),
    ('Plutao', 'Sist Solar'),
	('Kepler-452b', 'Const Cygnus'),
    ('Kepler-186', 'Const Cygnus');

INSERT INTO informacoes_gerais (planeta, informacao)
VALUES
    ('WASP-12b', 'INF1'),
    ('WASP-12b', 'INF2'),
    ('Marte', 'INF3'),
    ('Marte', 'INF1'),
    ('Proxima Centauri b', 'INF5'),
    ('Plutao', 'INF4'),
    ('Plutao', 'INF5'),
    ('Kepler-452b', 'INF5'),
	('Kepler-186', 'INF3'),
    ('Kepler-186', 'INF2');

INSERT INTO especie (nome_cientifico, dieta)
VALUES
    ('EspecieA', 'Herbívora'),
    ('EspecieB', 'Carnívora'),
    ('EspecieC', 'Omnívora'),
    ('EspecieD', 'Herbívora'),
    ('EspecieE', 'Carnívora');

INSERT INTO habitacao (planeta, especie)
VALUES
    ('WASP-12b', 'EspecieA'),
	('WASP-12b', 'EspecieE'),
    ('Marte', 'EspecieA'),
    ('Marte', 'EspecieB'),
    ('Proxima Centauri b', 'EspecieC'),
    ('Plutao', 'EspecieA'),
	('Plutao', 'EspecieE'),
	('Kepler-452b', 'EspecieA'),
	('Kepler-452b', 'EspecieE'),
	('Kepler-186', 'EspecieE'),
    ('Kepler-186', 'EspecieD');

INSERT INTO viagem (id, planeta, data_hora, vagas, local_partida, permanencia, tipo_viagem, nave)
VALUES
    (1, 'Marte', TO_DATE('01/01/2018', 'DD/MM/YYYY'), 40, 'Estação Espacial Alpha', '7 dias', 'ECONOMICO', 'NS001'),
    (2, 'WASP-12b', TO_DATE('15/03/2018', 'DD/MM/YYYY'), 20, 'Estação Espacial Beta', '10 dias', 'PERSONALIZADO', 'NS002'),
    (3, 'Proxima Centauri b', TO_DATE('20/06/2019', 'DD/MM/YYYY'), 30, 'Estação Espacial Gamma', '14 dias', 'ECONOMICO', 'NS003'),
    (4, 'Plutao', TO_DATE('05/09/2019', 'DD/MM/YYYY'), 15, 'Estação Espacial Delta', '5 dias', 'PERSONALIZADO', 'NS004'),
    (5, 'Kepler-452b', TO_DATE('11/11/2018', 'DD/MM/YYYY'), 50, 'Estação Espacial Epsilon', '21 dias', 'ECONOMICO', 'NS005'),
    (6, 'Kepler-186', TO_DATE('25/12/2020', 'DD/MM/YYYY'), 25, 'Estação Espacial Zeta', '30 dias', 'PERSONALIZADO', 'NS001'),
    (7, 'Marte', TO_DATE('01/01/2019', 'DD/MM/YYYY'), 35, 'Estação Espacial Alpha', '7 dias', 'ECONOMICO', 'NS002'),
    (8, 'WASP-12b', TO_DATE('17/03/2018', 'DD/MM/YYYY'), 20, 'Estação Espacial Beta', '10 dias', 'PERSONALIZADO', 'NS003');

INSERT INTO requisitos (viagem, requisito)
VALUES
    (1, 'Passaporte Galáctico'),
    (1, 'Vacina X'),
    (2, 'Seguro Viagem'),
    (3, 'Vacina Y'),
    (3, 'Passaporte Galáctico'),
    (4, 'Passaporte Galáctico'),
    (5, 'Vacina X'),
    (6, 'Seguro Viagem');

INSERT INTO estadia (cnpj, nome, cep, numero, complemento, contato, tipo_quarto, preco_diaria, estrelas, tipo_estadia, planeta)
VALUES
    ('12.345.678/0001-90', 'Resort Galáctico', '12345-678', 100, 'Bloco A', '123456789', 'Luxo', 500, '5', 'RESORT', 'Marte'),
    ('98.765.432/0001-10', 'Hotel Estelar', '98765-432', 200, 'Bloco B', '987654321', 'Standard', 300, '4', 'HOTEL', 'Plutao'),
    ('11.223.344/0001-55', 'Pousada Cósmica', '11223-344', 300, 'Bloco C', '112233445', 'Família', 250, '3', 'POUSADA', 'WASP-12b'),
    ('22.334.455/0001-99', 'Hotel Via Láctea', '22334-455', 500, 'Bloco E', '223344556', 'Standard', 350, '4', 'HOTEL', 'Kepler-452b'),
    ('66.778.899/0001-33', 'Pousada Estrelar', '66778-899', 600, 'Bloco F', '667788990', 'Família', 200, '3', 'POUSADA', 'Proxima Centauri b'),
    ('33.445.566/0001-77', 'Hotel Lunar', '33445-566', 700, 'Bloco G', '334455667', 'Standard', 400, '4', 'HOTEL', 'Marte'),
    ('77.889.900/0001-44', 'Resort Solar', '77889-900', 800, 'Bloco H', '778899001', 'Luxo', 700, '5', 'RESORT', 'WASP-12b');

INSERT INTO oferecimentos_estadia (estadia, nome_oferecimento)
VALUES
    ('12.345.678/0001-90', 'Spa'),
    ('12.345.678/0001-90', 'Café da Manhã'),
    ('98.765.432/0001-10', 'Tour Virtual'),
    ('11.223.344/0001-55', 'Café da Manhã '),
    ('11.223.344/0001-55', 'Academia'),
    ('22.334.455/0001-99', 'SPA'),
    ('66.778.899/0001-33', 'Café da manhã'),
    ('33.445.566/0001-77', 'Tour Virtual');

INSERT INTO titular (cpf, rg, nome, data_nascimento, cep, numero, complemento, contato_pessoal, contato_emergencial)
VALUES
    ('123.456.789-00', 'MG-1.234.567', 'João Silva', TO_DATE('01/01/1980', 'DD/MM/YYYY'), '31200-000', '101', 'Apto 1', '31987654321', '3133334444'),
    ('987.654.321-00', 'SP-9.876.543', 'Maria Santos', TO_DATE('15/03/1985', 'DD/MM/YYYY'), '04567-000', '202', 'Apto 2', '11987654321', '1133334444'),
    ('111.222.333-44', 'RJ-2.345.678', 'Ana Pereira', TO_DATE('20/06/1990', 'DD/MM/YYYY'), '22040-001', '303', 'Apto 3', '21987654321', '2133334444'),
    ('555.666.777-88', 'RS-5.678.901', 'Carlos Rocha', TO_DATE('05/09/1975', 'DD/MM/YYYY'), '90035-000', '404', 'Apto 4', '51987654321', '5133334444'),
    ('888.999.000-11', 'BA-8.901.234', 'Lúcia Lima', TO_DATE('11/11/1988', 'DD/MM/YYYY'), '40150-000', '505', 'Apto 5', '71987654321', '7133334444');

INSERT INTO vistos_titular (titular, tipo_visto)
VALUES
    ('123.456.789-00', 'VA'),
    ('987.654.321-00', 'VB'),
    ('111.222.333-44', 'VA'),
    ('555.666.777-88', 'VC'),
    ('888.999.000-11', 'VB'),
    ('123.456.789-00', 'VB'),
    ('555.666.777-88', 'VA'),
    ('987.654.321-00', 'VC');

INSERT INTO vacinas_titular (titular, nome_vacina)
VALUES
    ('123.456.789-00', 'VI.X'),
    ('987.654.321-00', 'VI.Y'),
    ('111.222.333-44', 'VI.Z'),
    ('555.666.777-88', 'VI.Y'),
    ('888.999.000-11', 'VI.Y'),
    ('111.222.333-44', 'VI.X'),
    ('888.999.000-11', 'VI.X'),
    ('987.654.321-00', 'VI.Z');

INSERT INTO acompanhante (cpf, rg, nome, data_nascimento, cep, numero, complemento, contato_pessoal, contato_emergencial, titular)
VALUES
    ('556.767.888-99', 'MG5678901', 'Lucas Silva', TO_DATE('15/07/2003', 'DD/MM/YYYY'), '31200-001', '111', 'Apto 11', '31987654331', '3133334455', '123.456.789-00'),
    ('377.888.999-00', 'MA7890123', 'Clara Santos', TO_DATE('22/09/1996', 'DD/MM/YYYY'), '04567-003', '212', 'Apto 12', '11987654332', '1133334454', '123.456.789-00'),
    ('999.060.111-22', 'RJ9012345', 'Gabriel Pereira', TO_DATE('04/12/1999', 'DD/MM/YYYY'), '22040-004', '313', 'Apto 13', '21987654333', '2133334453', '987.654.321-00'),
    ('000.181.222-33', 'RS0123456', 'Carla Rocha', TO_DATE('18/02/2001', 'DD/MM/YYYY'), '90035-002', '414', 'Apto 14', '51987654334', '5133334452', '111.222.333-44'),
    ('111.222.303-44', 'BA1234567', 'Rafael Lima', TO_DATE('29/05/1998', 'DD/MM/YYYY'), '40150-003', '515', 'Apto 15', '71987654335', '7133334451', '111.222.333-44'),
    ('222.339.448-55', 'MG2345678', 'Bianca Silva', TO_DATE('10/08/2004', 'DD/MM/YYYY'), '31200-002', '116', 'Apto 16', '31987654336', '3133334450', '111.222.333-44'),
    ('363.444.550-66', 'SP3456789', 'Diego Santos', TO_DATE('17/11/1997', 'DD/MM/YYYY'), '04567-004', '217', 'Apto 17', '11987654337', '1133334449', '555.666.777-88'),
    ('444.557.669-77', 'RJ4567890', 'Isabela Pereira', TO_DATE('25/01/2000', 'DD/MM/YYYY'), '22040-005', '318', 'Apto 18', '21987654338', '2133334448', '555.666.777-88');

INSERT INTO vistos_acompanhante (acompanhante, tipo_visto)
VALUES
    ('556.767.888-99', 'VA'),
    ('377.888.999-00', 'VB'),
    ('999.060.111-22', 'VA'),
    ('000.181.222-33', 'VC'),
    ('111.222.303-44', 'VB'),
    ('222.339.448-55', 'VA'),
    ('363.444.550-66', 'VC'),
    ('444.557.669-77', 'VB');

INSERT INTO vacinas_acompanhante (acompanhante, nome_vacina)
VALUES
    ('556.767.888-99', 'VI.X'),
    ('377.888.999-00', 'VI.Y'),
    ('999.060.111-22', 'VI.Z'),
    ('000.181.222-33', 'VI.X'),
    ('111.222.303-44', 'VI.Y'),
    ('222.339.448-55', 'VI.Z'),
    ('363.444.550-66', 'VI.X'),
    ('444.557.669-77', 'VI.Y');

INSERT INTO tipo_pessoa (cpf, tipo_pessoa)
VALUES
    ('123.456.789-00', 'Titular'),
    ('987.654.321-00', 'Titular'),
    ('111.222.333-44', 'Titular'),
    ('555.666.777-88', 'Titular'),
    ('888.999.000-11', 'Titular'),
  	('556.767.888-99', 'Acompanhante'),
    ('377.888.999-00', 'Acompanhante'),
    ('999.060.111-22', 'Acompanhante'),
    ('000.181.222-33', 'Acompanhante'),
    ('111.222.303-44', 'Acompanhante'),
    ('222.339.448-55', 'Acompanhante'),
    ('363.444.550-66', 'Acompanhante'),
    ('444.557.669-77', 'Acompanhante');

INSERT INTO agente_viagem (cpf, nome, contato, comissao)
VALUES
    ('101.202.303-44', 'Agente A', '1100123456', '10%'),
    ('202.303.404-55', 'Agente B', '2200234567', '12%'),
    ('303.404.505-66', 'Agente C', '3300345678', '19%'),
    ('404.505.606-77', 'Agente D', '4400456789', '8%'),
    ('505.606.707-88', 'Agente E', '5500567890', '10%');

INSERT INTO guia (cpf, nome, contato, preco_hora)
VALUES
    ('606.707.808-99', 'Guia A', '660067890', 200),
    ('707.808.909-00', 'Guia B', '770078901', 250),
    ('808.909.101-11', 'Guia C', '880089012', 300),
    ('909.101.202-22', 'Guia D', '990010123', 350),
    ('010.202.303-33', 'Guia E', '100012234', 400);

INSERT INTO certificacoes_guia (guia, certificado)
VALUES
    ('606.707.808-99', 'Certificação Intergaláctica'),
    ('707.808.909-00', 'Certificação Planetária'),
    ('808.909.101-11', 'Certificação Estelar'),
    ('909.101.202-22', 'Certificação de Exploração'),
    ('010.202.303-33', 'Certificação Avançada de Guia');

INSERT INTO passeio (id, guia, data_hora_partida, nome, duracao, vagas, preco_total)
VALUES
    (1, '606.707.808-99', TO_DATE('15/01/2018', 'DD/MM/YYYY'), 'Passeio A', '4 horas', 20, 1000),
    (2, '707.808.909-00', TO_DATE('20/02/2018', 'DD/MM/YYYY'), 'Passeio B', '6 horas', 15, 1500),
    (3, '808.909.101-11', TO_DATE('25/03/2019', 'DD/MM/YYYY'), 'Passeio C', '8 horas', 10, 2000),
    (4, '909.101.202-22', TO_DATE('30/04/2019', 'DD/MM/YYYY'), 'Passeio D', '2 horas', 25, 500),
    (5, '010.202.303-33', TO_DATE('05/05/2020', 'DD/MM/YYYY'), 'Passeio E', '10 horas', 30, 3000),
	(6, '909.101.202-22', TO_DATE('02/04/2020', 'DD/MM/YYYY'), 'Passeio D', '2 horas', 25, 500);

INSERT INTO reserva (viagem, titular, agente_viagem, preco_total, status, online, avaliacao, estadia, passeio)
VALUES
    (1, '123.456.789-00', '101.202.303-44', 10000, 'Confirmado', 'S', 8, '12.345.678/0001-90', 1),
    (2, '987.654.321-00', '101.202.303-44', 15000, 'Cancelado', 'N', 6, '98.765.432/0001-10', 5),
    (3, '111.222.333-44', '202.303.404-55', 8000, 'Cancelado', 'S', 10, '11.223.344/0001-55', 5),
    (4, '555.666.777-88', '303.404.505-66', 12000, 'Confirmado', 'S', 7,'33.445.566/0001-77' , 2),
    (5, '888.999.000-11', '404.505.606-77', 9000, 'Cancelado', 'N', 0, '22.334.455/0001-99', 3),
    (6, '123.456.789-00', '505.606.707-88', 11000, 'Confirmado', 'S', 8, '66.778.899/0001-33', 4),
    (7, '987.654.321-00', '404.505.606-77', 14000, 'Confirmado', 'S', 9, '33.445.566/0001-77', 1),
    (8, '111.222.333-44', '404.505.606-77', 7500, 'Cancelado', 'N', 10, '77.889.900/0001-44', 2);

INSERT INTO forma_pagamento (viagem_reserva, titular_reserva, tipo_pagamento)
VALUES
    (1, '123.456.789-00', 'CC'),
    (1, '123.456.789-00', 'TB'),
    (4, '555.666.777-88', 'CC'),
    (4, '555.666.777-88', 'D'),
    (6, '123.456.789-00', 'CC'),
    (7, '987.654.321-00', 'D'),
    (6, '123.456.789-00', 'TB');

INSERT INTO transporte_planetario (numero_serie, fabricante, qtd_lugares, cnpj_empresa_responsavel, preco_hora, tipo_tracao, profundidade_maxima, altitude_maxima)
VALUES
    ('TP001', 'TransporteA', 20, '11.222.333/0001-11', 500, 'Elétrico', '50m', '2000m'),
    ('TP002', 'TransporteB', 15, '22.333.444/0001-22', 700, 'Híbrido', '30m', '1500m'),
    ('TP003', 'TransporteC', 25, '33.444.555/0001-33', 650, 'Solar', '100m', '3000m'),
    ('TP004', 'TransporteD', 10, '44.555.666/0001-44', 550, 'Elétrico', '20m', '1000m'),
    ('TP005', 'TransporteE', 30, '55.666.777/0001-55', 800, 'Híbrido', '80m', '2500m');

INSERT INTO categorias_transporte (transporte, categoria)
VALUES
    ('TP001', 'TERRESTRE'),
	('TP001', 'AQUATICO'),
    ('TP002', 'AQUATICO'),
    ('TP003', 'AEREO'),
	('TP003', 'TERRESTRE'),
    ('TP004', 'TERRESTRE'),
    ('TP005', 'AQUATICO');

INSERT INTO aluguel (transporte, viagem)
VALUES
    ('TP001', 1),
    ('TP002', 2),
    ('TP001', 3),
    ('TP004', 4),
    ('TP005', 5);

INSERT INTO equipamentos (viagem, equipamento)
VALUES
    (1, 'Equipamento A'),
    (2, 'Equipamento B'),
    (3, 'Equipamento C'),
    (4, 'Equipamento D'),
    (5, 'Equipamento E');
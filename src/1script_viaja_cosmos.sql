create table nave(
	num_serie varchar(18) not null,
	fabricante varchar(10),
	carga_maxima numeric,
	capacidade_tanque numeric ,
	num_lugares numeric,
	
	constraint pk_nave primary key(num_serie)
);

create table planeta(
	nome varchar(40) not null,
	localizacao varchar(40) ,

	constraint pk_planeta primary key(nome)
);

create table informacoes_gerais(
	planeta varchar(40) not null,
	informacao varchar(100) not null,

	constraint pk_informacao_g primary key(planeta, informacao),
	constraint fk_planeta_ig foreign key(planeta) references planeta(nome) on delete cascade on update cascade
);

create table especie(
	nome_cientifico varchar(40) not null,
	dieta varchar(20),

	constraint pk_especie primary key(nome_cientifico)
);

create table habitacao(
	planeta varchar(40) not null,
	especie varchar(40) not null,

	constraint pk_habitacao primary key(planeta, especie),
	constraint fk_planeta_h foreign key(planeta) references planeta(nome) on delete cascade on update cascade,
	constraint fk_especie_h foreign key(especie) references especie(nome_cientifico) on delete cascade on update cascade
);

create table viagem(
	id integer not null,
	planeta varchar(40)not null,
	data_hora date not null,
	vagas numeric,
	local_partida varchar(40),
	permanencia varchar(8),
	tipo_viagem varchar(20) not null,
	nave varchar(40)not null,

	constraint pk_viagem primary key(id),
	constraint unq_viagem unique (planeta, data_hora),
	constraint fk_planeta_v foreign key (planeta) references planeta(nome) on delete cascade on update cascade,
	constraint fk_nave_v foreign key (nave) references nave(num_serie) on delete cascade on update cascade,
	constraint ck_tipo_v check(upper(tipo_viagem) in ('PERSONALIZADO','ECONOMICO'))
);

create table requisitos(
	viagem integer not null,
	requisito varchar(40) not null,

	constraint pk_requisitos primary key(viagem, requisito),
	constraint fk_viagem_r foreign key(viagem) references viagem(id) on delete cascade on update cascade
);

create table estadia(
	cnpj varchar(20) not null,
	nome varchar(40),
	cep varchar(10),
	numero integer,
	complemento varchar(50),
	contato varchar(20),
	tipo_quarto varchar(20),
	preco_diaria numeric,
	estrelas integer,
	tipo_estadia varchar(10) not null,
	planeta varchar(40) not null,

	constraint pk_estadia primary key(cnpj),
	constraint fk_planeta_e foreign key(planeta) references planeta(nome) on delete cascade on update cascade,
	constraint ck_tipo_estadia_es check(upper(tipo_estadia) in ('HOTEL', 'RESORT' , 'POUSADA')),
	constraint ck_estrelas_es check(estrelas>=0 and estrelas<=5)

);

create table oferecimentos_estadia(
	estadia varchar(20) not null,
	nome_oferecimento varchar(40) not null,

	constraint pk_oferecimentos primary key(estadia, nome_oferecimento),
	constraint fk_estadia_oe foreign key(estadia) references estadia(cnpj) on delete cascade on update cascade
);

create table titular(
	cpf varchar(14) not null,
	rg varchar(20) not null,
	nome varchar(50),
	data_nascimento date,
	cep varchar(10),
	numero varchar(10),
	complemento varchar(60),
	contato_pessoal varchar(20),
	contato_emergencial varchar(20),

	constraint pk_titular primary key(cpf),
	constraint unq_titular unique(rg)
);

create table vistos_titular(
	titular varchar(14) not null,
	tipo_visto varchar(40) not null,

	constraint pk_vistos_titular primary key(titular, tipo_visto),
	constraint fk_titular_vst foreign key(titular) references titular(cpf) on delete cascade on update cascade
);

create table vacinas_titular(
	titular varchar(14) not null,
	nome_vacina varchar(40) not null,

	constraint pk_vacinas_titular primary key(titular, nome_vacina),
	constraint fk_titular_vc foreign key(titular) references titular(cpf) on delete cascade
);

create table acompanhante(
	cpf varchar(14) not null,
	rg varchar(11) not null,
	nome varchar(50),
	data_nascimento date,
	cep varchar(10),
	numero varchar(10),
	complemento varchar(60),
	contato_pessoal varchar(20),
	contato_emergencial varchar(20),
	titular char(14) not null,

	constraint pk_acompanhante primary key(cpf),
	constraint fk_titular_ac foreign key(titular) references titular(cpf) on delete cascade on update cascade,
	constraint unq_rg_ac unique(rg)
);

create table vistos_acompanhante(
	acompanhante varchar(14) not null,
	tipo_visto varchar(40) not null,

	constraint pk_vistos_acompanhante primary key(acompanhante, tipo_visto),
	constraint fk_acompanhante_va foreign key(acompanhante) references acompanhante(cpf) on delete cascade on update cascade
);

create table vacinas_acompanhante(
	acompanhante varchar(14) not null,
	nome_vacina varchar(40) not null,

	constraint pk_vacinas_acompanhante primary key(acompanhante, nome_vacina),
	constraint fk_acompanhante_vat foreign key(acompanhante) references acompanhante(cpf) on delete cascade on update cascade
);

create table tipo_pessoa(
	cpf varchar(14) not null,
	tipo_pessoa varchar(20) not null,

	constraint pk_tipo_pessoa primary key(cpf, tipo_pessoa)
);

create table agente_viagem(
	cpf varchar(14) not null,
	nome varchar(50),
	contato varchar(20),
	comissao varchar(10),

	constraint pk_agente_viagem primary key(cpf)
);

create table guia(
	cpf varchar(14) not null,
	nome varchar(40),
	contato varchar(20),
	preco_hora numeric,

	constraint pk_guia primary key(cpf)
);

create table certificacoes_guia(
	guia varchar(14) not null,
	certificado varchar(60) not null,

	constraint pk_certificacoes_guia primary key(guia,certificado),
	constraint fk_guia_cg foreign key(guia) references guia(cpf) on delete cascade on update cascade
);

create table passeio(
	id integer not null,
	guia varchar(14) not null,
	data_hora_partida date not null,
	nome varchar(40),
	duracao varchar(20),
	vagas integer,
	preco_total numeric,

	constraint pk_passeio primary key(id),
	constraint unq_passeio unique(guia,data_hora_partida),
	constraint fk_guia_ps foreign key(guia) references guia(cpf) on delete cascade on update cascade
);

create table reserva(
	viagem integer not null,
	titular varchar(14) not null,
	agente_viagem varchar(14) not null,
	preco_total numeric,
	status varchar(20),
	online char(1),
	avaliacao integer,
	estadia varchar(20),
	passeio integer,

	constraint pk_reserva primary key(viagem, titular),
	constraint fk_viagem_rs foreign key(viagem) references viagem(id) on delete cascade on update cascade,
	constraint fk_titular_rs foreign key(titular) references titular(cpf) on delete cascade on update cascade,
	constraint fk_agente_rs foreign key(agente_viagem) references agente_viagem(cpf) on delete cascade on update cascade,
	constraint fk_estadia_rs foreign key(estadia) references estadia(cnpj) on delete cascade on update cascade,
	constraint fk_passeio_rs foreign key(passeio) references passeio(id) on delete cascade on update cascade,
	constraint ck_online check(upper(online) in ('S','N')),
	constraint ck_avaliacao check(avaliacao >= 0 AND avaliacao <= 10)
);

create table forma_pagamento(
	viagem_reserva int not null,
	titular_reserva varchar(14) not null,
	tipo_pagamento varchar(20) not null,

	constraint pk_forma_pagamento primary key(viagem_reserva, titular_reserva,tipo_pagamento),
	constraint fk_viagem_titular_fp foreign key(viagem_reserva,titular_reserva) references reserva(viagem,titular) on delete cascade on update cascade
);

create table transporte_planetario(
	numero_serie varchar(40) not null,
	fabricante varchar(40),
	qtd_lugares integer,
	cnpj_empresa_responsavel varchar(18),
	preco_hora numeric,
	tipo_tracao varchar(15),
	profundidade_maxima varchar(15),
	altitude_maxima varchar(15),

	constraint pk_transpote_planetario primary key(numero_serie)
);

create table categorias_transporte(
	transporte varchar(40) not null,
	categoria varchar(10) not null,

	constraint pk_categorias primary key(transporte, categoria),
	constraint fk_categorias_ct foreign key(transporte) references transporte_planetario(numero_serie),
	constraint ck_categorias_ct check(upper(categoria) in ('TERRESTRE', 'AQUATICO', 'AEREO'))
);

create table aluguel(
	transporte varchar(40) not null,
	viagem int not null,

	constraint pk_aluguel primary key(transporte, viagem),
	constraint fk_transporte_al foreign key(transporte) references transporte_planetario(numero_serie) on delete cascade on update cascade,
	constraint fk_viagem_al foreign key(viagem) references passeio(id) on delete cascade on update cascade
);

create table equipamentos(
	viagem int not null,
	equipamento varchar(50) not null,

	constraint pk_equipamentos primary key(viagem, equipamento),
	constraint fk_viagem_eq foreign key(viagem) references passeio(id) on delete cascade on update cascade
);
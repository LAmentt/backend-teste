--
-- PostgreSQL database dump
--

\restrict AbgeBkRMFaAd2l1WadFuHKWJk0BvPmFj8lRqBuFYYJfVljXQjlkSXiFNcTsN5AZ

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-04-10 17:36:49 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 16560)
-- Name: carro; Type: TABLE; Schema: public; Owner: lorenzo
--

CREATE TABLE public.carro (
    id bigint NOT NULL,
    tp_motor character varying(8) NOT NULL,
    qt_porta integer NOT NULL,
    preco numeric(12,2) NOT NULL,
    loja_id bigint NOT NULL,
    modelo character varying(255) NOT NULL,
    cor character varying(255) NOT NULL,
    placa character varying(7) NOT NULL,
    quant_estoque integer NOT NULL,
    marca character varying(255) NOT NULL
);


ALTER TABLE public.carro OWNER TO lorenzo;

--
-- TOC entry 221 (class 1259 OID 16591)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: lorenzo
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hibernate_sequence OWNER TO lorenzo;

--
-- TOC entry 220 (class 1259 OID 16577)
-- Name: loja_carros; Type: TABLE; Schema: public; Owner: lorenzo
--

CREATE TABLE public.loja_carros (
    id bigint NOT NULL,
    cnpj character varying(255) NOT NULL,
    nome character varying(255) NOT NULL
);


ALTER TABLE public.loja_carros OWNER TO lorenzo;

--
-- TOC entry 222 (class 1259 OID 16597)
-- Name: listempresa; Type: VIEW; Schema: public; Owner: lorenzo
--

CREATE VIEW public.listempresa AS
 SELECT c.id,
    c.preco,
    c.modelo AS ano,
    c.quant_estoque AS quantidade,
    c.marca,
    c.loja_id AS lojas,
    lc.nome AS empresa
   FROM (public.loja_carros lc
     JOIN public.carro c ON ((lc.id = c.loja_id)))
  WHERE (lc.id = 2)
  ORDER BY lc.nome, c.preco DESC;


ALTER VIEW public.listempresa OWNER TO lorenzo;

--
-- TOC entry 223 (class 1259 OID 16601)
-- Name: listempresa2; Type: VIEW; Schema: public; Owner: lorenzo
--

CREATE VIEW public.listempresa2 AS
 SELECT c.id,
    c.preco,
    c.modelo AS ano,
    c.quant_estoque AS quantidade,
    c.marca,
    c.loja_id AS lojas,
    lc.nome AS empresa
   FROM (public.loja_carros lc
     JOIN public.carro c ON ((lc.id = c.loja_id)))
  WHERE (lc.id = 1)
  ORDER BY lc.nome, c.preco DESC;


ALTER VIEW public.listempresa2 OWNER TO lorenzo;

--
-- TOC entry 224 (class 1259 OID 16605)
-- Name: listempresa3; Type: VIEW; Schema: public; Owner: lorenzo
--

CREATE VIEW public.listempresa3 AS
 SELECT c.id,
    c.preco,
    c.modelo AS ano,
    c.quant_estoque AS quantidade,
    c.marca,
    c.loja_id AS lojas,
    lc.nome AS empresa
   FROM (public.loja_carros lc
     JOIN public.carro c ON ((lc.id = c.loja_id)))
  WHERE (lc.id = 3)
  ORDER BY lc.nome, c.preco DESC;


ALTER VIEW public.listempresa3 OWNER TO lorenzo;

--
-- TOC entry 4501 (class 0 OID 16560)
-- Dependencies: 219
-- Data for Name: carro; Type: TABLE DATA; Schema: public; Owner: lorenzo
--

COPY public.carro (id, tp_motor, qt_porta, preco, loja_id, modelo, cor, placa, quant_estoque, marca) FROM stdin;
1	Gasolina	2	1550000.00	2	2024	Cinza	MAN0001	1	Porsche
2	Gasolina	2	3800000.00	2	2023	Vermelho	FER0002	1	Ferrari
3	Gasolina	2	4500000.00	2	2022	Amarelo	LAM0003	1	Lamboghini
4	Gasolina	4	6200000.00	2	2024	Preto	RRY0004	1	Rolls-Royce
5	Gasolina	2	2900000.00	2	2023	Laranja	MCL0005	2	McLaren
6	Gasolina	2	2200000.00	2	2021	Prata	AST0006	1	Aston Martin
7	Gasolina	2	2600000.00	2	2022	Azul	BEN0007	1	Bentley
8	Gasolina	2	2000000.00	2	2024	Branco	MAS0008	1	Maserati
9	Eletrico	4	950000.00	2	2024	Preto	TSL0010	2	Tesla
10	Gasolina	2	15000000.00	2	2021	Azul-Marinho	BUG0011	1	Bugatti
11	Diesel	4	680000.00	1	2023	Preto	BMW0101	3	BMW
12	Gasolina	4	395000.00	1	2022	Prata	MER0102	5	Mercedes-Benz
13	Diesel	4	530000.00	1	2021	Cinza	AUD0103	2	Audi
14	Diesel	4	720000.00	1	2024	Verde	LAN0104	2	Land Rover
15	Hibrido	4	560000.00	1	2023	Branco	VOL0105	4	Volvo
16	Gasolina	4	460000.00	1	2022	Preto	JEE0106	3	Jeep
17	Diesel	4	425000.00	1	2024	Branco	TOY0107	4	Toyota
18	Hibrido	4	370000.00	1	2023	Azul	LEX0108	2	Lexus
19	Gasolina	4	510000.00	1	2021	Vermelho	JAG0109	1	Jaguar
20	Gasolina	4	330000.00	1	2024	Branco	BMW0112	6	BMW
21	Gasolina	4	365000.00	1	2022	Azul-Marinho	AUD0113	3	Audi
22	Gasolina	4	470000.00	1	2023	Cinza	MER0114	2	Mercedes-Benz
23	Hibrido	4	410000.00	1	2022	Prata	VOL0115	4	Volvo
24	Gasolina	4	550000.00	1	2024	Dourado	MAC0116	2	Porsche
25	Gasolina	4	430000.00	1	2021	Vinho	EVO0117	3	Land Rover
26	Gasolina	4	98000.00	3	2024	Prata	VWN0301	10	Volkswagen
27	Gasolina	4	108000.00	3	2023	Branco	GM0302	12	Chevrolet
28	Gasolina	4	92000.00	3	2022	Cinza	HYU0303	15	Hyundai
29	Gasolina	4	99000.00	3	2023	Vinho	FIA0304	8	Fiat
30	Hibrido	4	175000.00	3	2024	Branco	TOY0305	5	Toyota
31	Gasolina	4	118000.00	3	2022	Azul	PEU0306	7	Peugeot
32	Gasolina	4	75000.00	3	2021	Branco	REN0307	20	Renault
33	Gasolina	4	115000.00	3	2023	Prata	NIS0308	6	Nissan
34	Gasolina	4	88000.00	3	2022	Roxo	CIT0309	10	Citroen
35	Gasolina	2	125000.00	3	2024	Branco	FIA0310	10	Fiat
36	Gasolina	4	148000.00	3	2023	Cinza	VWN0311	4	Volkswagen
37	Gasolina	4	142000.00	3	2022	Vermelho	GM0312	5	Chevrolet
38	Gasolina	4	165000.00	3	2024	Prata	HON0313	3	Honda
39	Gasolina	4	158000.00	3	2023	Azul	HYU0314	6	Hyundai
40	Gasolina	4	69000.00	3	2021	Preto	FIA0315	18	Fiat
\.


--
-- TOC entry 4502 (class 0 OID 16577)
-- Dependencies: 220
-- Data for Name: loja_carros; Type: TABLE DATA; Schema: public; Owner: lorenzo
--

COPY public.loja_carros (id, cnpj, nome) FROM stdin;
1	123456	Concessionária Floripa
2	54.257.517/0001-90	Mansory
3	11.965.552/0001-50	Concessionária Natal
\.


--
-- TOC entry 4509 (class 0 OID 0)
-- Dependencies: 221
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: lorenzo
--

SELECT pg_catalog.setval('public.hibernate_sequence', 1, true);


--
-- TOC entry 4343 (class 2606 OID 16576)
-- Name: carro carro_pkey; Type: CONSTRAINT; Schema: public; Owner: lorenzo
--

ALTER TABLE ONLY public.carro
    ADD CONSTRAINT carro_pkey PRIMARY KEY (id);


--
-- TOC entry 4347 (class 2606 OID 16586)
-- Name: loja_carros loja_carros_pkey; Type: CONSTRAINT; Schema: public; Owner: lorenzo
--

ALTER TABLE ONLY public.loja_carros
    ADD CONSTRAINT loja_carros_pkey PRIMARY KEY (id);


--
-- TOC entry 4345 (class 2606 OID 16588)
-- Name: carro uk_5uv3fisdwp2pmj1357rivswea; Type: CONSTRAINT; Schema: public; Owner: lorenzo
--

ALTER TABLE ONLY public.carro
    ADD CONSTRAINT uk_5uv3fisdwp2pmj1357rivswea UNIQUE (placa);


--
-- TOC entry 4349 (class 2606 OID 16590)
-- Name: loja_carros uk_svmbo2xkf35s2uf2v43c8fdbr; Type: CONSTRAINT; Schema: public; Owner: lorenzo
--

ALTER TABLE ONLY public.loja_carros
    ADD CONSTRAINT uk_svmbo2xkf35s2uf2v43c8fdbr UNIQUE (cnpj);


--
-- TOC entry 4350 (class 2606 OID 16592)
-- Name: carro fkaq3fypunad8ylwpr06j4ohrbh; Type: FK CONSTRAINT; Schema: public; Owner: lorenzo
--

ALTER TABLE ONLY public.carro
    ADD CONSTRAINT fkaq3fypunad8ylwpr06j4ohrbh FOREIGN KEY (loja_id) REFERENCES public.loja_carros(id);


-- Completed on 2026-04-10 17:36:49 -03

--
-- PostgreSQL database dump complete
--

\unrestrict AbgeBkRMFaAd2l1WadFuHKWJk0BvPmFj8lRqBuFYYJfVljXQjlkSXiFNcTsN5AZ


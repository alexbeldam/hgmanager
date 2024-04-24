--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2024-04-24 18:54:13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 852 (class 1247 OID 17126)
-- Name: tipo_token; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tipo_token AS ENUM (
    'CADASTRO',
    'EMAIL',
    'SENHA'
);


ALTER TYPE public.tipo_token OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 17145)
-- Name: campus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.campus (
    id integer NOT NULL,
    nome character varying(50),
    cep character varying(9) NOT NULL,
    numero integer
);


ALTER TABLE public.campus OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17144)
-- Name: campus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.campus ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.campus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 17164)
-- Name: recurso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recurso (
    id integer NOT NULL,
    descricao character varying(50),
    marca character varying(50)
);


ALTER TABLE public.recurso OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17163)
-- Name: recurso_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.recurso ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.recurso_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 17153)
-- Name: sala; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sala (
    id integer NOT NULL,
    id_campus integer NOT NULL,
    predio integer,
    numero integer,
    capacidade integer,
    equipamentos character varying(200)
);


ALTER TABLE public.sala OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17152)
-- Name: sala_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.sala ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.sala_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 17134)
-- Name: token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.token (
    id integer NOT NULL,
    id_usuario integer NOT NULL,
    tipo public.tipo_token,
    criacao timestamp without time zone,
    codigo character varying(6)
);


ALTER TABLE public.token OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17133)
-- Name: token_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.token ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 17118)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id integer NOT NULL,
    cpf character varying(15),
    email character varying(50),
    nome character varying(50),
    senha character varying(50)
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17117)
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.usuario ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 4875 (class 0 OID 17145)
-- Dependencies: 220
-- Data for Name: campus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.campus (id, nome, cep, numero) FROM stdin;
\.


--
-- TOC entry 4879 (class 0 OID 17164)
-- Dependencies: 224
-- Data for Name: recurso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recurso (id, descricao, marca) FROM stdin;
\.


--
-- TOC entry 4877 (class 0 OID 17153)
-- Dependencies: 222
-- Data for Name: sala; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sala (id, id_campus, predio, numero, capacidade, equipamentos) FROM stdin;
\.


--
-- TOC entry 4873 (class 0 OID 17134)
-- Dependencies: 218
-- Data for Name: token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.token (id, id_usuario, tipo, criacao, codigo) FROM stdin;
\.


--
-- TOC entry 4871 (class 0 OID 17118)
-- Dependencies: 216
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (id, cpf, email, nome, senha) FROM stdin;
\.


--
-- TOC entry 4885 (class 0 OID 0)
-- Dependencies: 219
-- Name: campus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.campus_id_seq', 1, false);


--
-- TOC entry 4886 (class 0 OID 0)
-- Dependencies: 223
-- Name: recurso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recurso_id_seq', 1, false);


--
-- TOC entry 4887 (class 0 OID 0)
-- Dependencies: 221
-- Name: sala_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sala_id_seq', 1, false);


--
-- TOC entry 4888 (class 0 OID 0)
-- Dependencies: 217
-- Name: token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.token_id_seq', 1, false);


--
-- TOC entry 4889 (class 0 OID 0)
-- Dependencies: 215
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_seq', 1, true);


--
-- TOC entry 4718 (class 2606 OID 17149)
-- Name: campus campus_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campus
    ADD CONSTRAINT campus_pk PRIMARY KEY (id);


--
-- TOC entry 4724 (class 2606 OID 17168)
-- Name: recurso recurso_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recurso
    ADD CONSTRAINT recurso_pk PRIMARY KEY (id);


--
-- TOC entry 4722 (class 2606 OID 17157)
-- Name: sala sala_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sala
    ADD CONSTRAINT sala_pk PRIMARY KEY (id, id_campus);


--
-- TOC entry 4716 (class 2606 OID 17138)
-- Name: token token_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token
    ADD CONSTRAINT token_pk PRIMARY KEY (id, id_usuario);


--
-- TOC entry 4720 (class 2606 OID 17151)
-- Name: campus uq_campus; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campus
    ADD CONSTRAINT uq_campus UNIQUE (cep);


--
-- TOC entry 4712 (class 2606 OID 17122)
-- Name: usuario usuario_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pk PRIMARY KEY (id);


--
-- TOC entry 4714 (class 2606 OID 17124)
-- Name: usuario usuario_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_uq UNIQUE (cpf, email);


--
-- TOC entry 4726 (class 2606 OID 17158)
-- Name: sala sala_campus_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sala
    ADD CONSTRAINT sala_campus_fk FOREIGN KEY (id_campus) REFERENCES public.campus(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4725 (class 2606 OID 17139)
-- Name: token token_usuario_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token
    ADD CONSTRAINT token_usuario_fk FOREIGN KEY (id_usuario) REFERENCES public.usuario(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2024-04-24 18:54:13

--
-- PostgreSQL database dump complete
--


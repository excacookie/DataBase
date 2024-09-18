--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

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
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: manufacturer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.manufacturer (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    address character varying(300),
    "phone number" character varying(15),
    "URL" character varying(200)
);


ALTER TABLE public.manufacturer OWNER TO postgres;

--
-- Name: manufacturer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.manufacturer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.manufacturer_id_seq OWNER TO postgres;

--
-- Name: manufacturer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.manufacturer_id_seq OWNED BY public.manufacturer.id;


--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    year smallint,
    price double precision,
    genre character(2) NOT NULL,
    manufacturer integer NOT NULL,
    stock integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: product genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."product genre" (
    id character(2) NOT NULL,
    description character varying(100) NOT NULL
);


ALTER TABLE public."product genre" OWNER TO postgres;

--
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_id_seq OWNER TO postgres;

--
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- Name: purchase; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchase (
    "user" character varying(100) NOT NULL,
    product integer NOT NULL,
    date date
);


ALTER TABLE public.purchase OWNER TO postgres;

--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    "e-mail" character varying(100) NOT NULL,
    card character(16) NOT NULL,
    "first name" character varying(20),
    "last name" character varying(25),
    adress character varying(100)
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: manufacturer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manufacturer ALTER COLUMN id SET DEFAULT nextval('public.manufacturer_id_seq'::regclass);


--
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- Data for Name: manufacturer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.manufacturer (id, name, address, "phone number", "URL") FROM stdin;
1	samsung	south corea	09368463	www.samsung.com
2	xiaomi	china	03148233	www.xiaomi.com
3	corsair	USA	01464709	www.corsair.com
4	intel	USA	555-239	www.intel.com
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, name, year, price, genre, manufacturer, stock) FROM stdin;
1	samsung galaxi 1	2025	100.4	ph	1	10
2	samart home	2022	300.99	IT	2	5
3	headset gaming	2023	50.99	hs	3	100
4	pentium	2027	49.99	CP	4	40
\.


--
-- Data for Name: product genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."product genre" (id, description) FROM stdin;
ph	phone
IT	internet of thing
hs	headset
CP	CPU
\.


--
-- Data for Name: purchase; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchase ("user", product, date) FROM stdin;
lari.burger@mcdonald.com	1	2024-12-31
lari.burger@mcdonald.com	2	2024-12-31
jhon.doe@unknown.hr	1	2024-09-10
jhon.doe@unknown.hr	3	2024-10-21
gabriel.angel@heaven.hr	2	2022-01-01
gabriel.angel@heaven.hr	3	2023-03-06
gabriel.angel@heaven.hr	4	2023-03-06
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" ("e-mail", card, "first name", "last name", adress) FROM stdin;
lari.burger@mcdonald.com	6374950384735485	lari	burger	12 street mcdonald
jhon.doe@unknown.hr	6374950384735485	jhon	doe	666 street unknown
gabriel.angel@heaven.hr	6374950384735485	gabriel	angel	1 street heaven
\.


--
-- Name: manufacturer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.manufacturer_id_seq', 4, true);


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 4, true);


--
-- Name: manufacturer manufacturer_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manufacturer
    ADD CONSTRAINT manufacturer_name_key UNIQUE (name);


--
-- Name: manufacturer manufacturer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manufacturer
    ADD CONSTRAINT manufacturer_pkey PRIMARY KEY (id);


--
-- Name: product genre product genre_description_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."product genre"
    ADD CONSTRAINT "product genre_description_key" UNIQUE (description);


--
-- Name: product genre product genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."product genre"
    ADD CONSTRAINT "product genre_pkey" PRIMARY KEY (id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: purchase purchase_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT purchase_pkey PRIMARY KEY ("user", product);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY ("e-mail");


--
-- Name: product product_genre_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_genre_fkey FOREIGN KEY (genre) REFERENCES public."product genre"(id);


--
-- Name: product product_manufacturer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_manufacturer_fkey FOREIGN KEY (manufacturer) REFERENCES public.manufacturer(id);


--
-- Name: purchase purchase_product_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT purchase_product_fkey FOREIGN KEY (product) REFERENCES public.product(id);


--
-- Name: purchase purchase_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT purchase_user_fkey FOREIGN KEY ("user") REFERENCES public."user"("e-mail");


--
-- PostgreSQL database dump complete
--


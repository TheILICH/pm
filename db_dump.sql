--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Ubuntu 16.4-1.pgdg22.04+2)
-- Dumped by pg_dump version 17.0 (Ubuntu 17.0-1.pgdg22.04+1)

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

--
-- Name: order_status_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.order_status_type AS ENUM (
    'pending',
    'accepted',
    'ready',
    'out',
    'delivered',
    'confirmed',
    'canceled'
);


ALTER TYPE public.order_status_type OWNER TO postgres;

--
-- Name: user_role_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.user_role_type AS ENUM (
    'admin',
    'customer'
);


ALTER TYPE public.user_role_type OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    order_id bigint,
    product_id bigint,
    quantity bigint,
    price bigint
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_items_id_seq OWNER TO postgres;

--
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_items_id_seq OWNED BY public.order_items.id;


--
-- Name: order_statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_statuses (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    name text,
    description text
);


ALTER TABLE public.order_statuses OWNER TO postgres;

--
-- Name: order_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_statuses_id_seq OWNER TO postgres;

--
-- Name: order_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_statuses_id_seq OWNED BY public.order_statuses.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    user_id bigint,
    order_status character varying(100) NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    name text,
    quantity bigint,
    description text,
    price bigint
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    name text,
    email text,
    password text,
    role character varying(100) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: order_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items ALTER COLUMN id SET DEFAULT nextval('public.order_items_id_seq'::regclass);


--
-- Name: order_statuses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_statuses ALTER COLUMN id SET DEFAULT nextval('public.order_statuses_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (id, created_at, updated_at, deleted_at, order_id, product_id, quantity, price) FROM stdin;
7	2024-05-02 01:15:47.890982+05	2024-05-02 02:46:46.59565+05	\N	9	4	1	0
11	2024-05-02 02:46:46.597246+05	2024-05-02 02:46:46.597246+05	\N	9	13	5	0
6	2024-05-02 01:15:47.888426+05	2024-05-02 02:46:46.593673+05	\N	9	\N	1	0
45	2024-05-07 01:10:12.722323+05	2024-05-07 01:10:12.722323+05	2024-05-07 01:40:43.213091+05	12	5	1	0
46	2024-05-07 01:10:12.724795+05	2024-05-07 01:10:12.724795+05	2024-05-07 01:41:58.012038+05	12	4	1	0
47	2024-05-07 01:27:44.976426+05	2024-05-07 01:27:44.976426+05	2024-05-07 01:43:12.159811+05	12	10	1	0
48	2024-05-07 01:27:44.979107+05	2024-05-07 01:27:44.979107+05	2024-05-07 01:44:28.501233+05	12	4	1	0
49	2024-05-07 01:27:44.980273+05	2024-05-07 01:27:44.980273+05	2024-05-07 01:44:28.501233+05	12	13	5	0
50	2024-09-16 13:11:31.885073+05	2024-09-16 13:11:31.885073+05	\N	13	4	2	0
51	2024-09-16 13:13:10.129918+05	2024-09-16 13:13:10.129918+05	\N	13	4	2	0
52	2024-09-16 13:13:38.292452+05	2024-09-16 13:13:38.292452+05	\N	13	10	2	0
53	2024-09-16 13:13:45.448086+05	2024-09-16 13:13:45.448086+05	\N	13	10	1	0
\.


--
-- Data for Name: order_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_statuses (id, created_at, updated_at, deleted_at, name, description) FROM stdin;
1	2024-04-27 12:49:59.993615+05	2024-04-27 12:49:59.993615+05	\N	Pending Review	You have made an order
2	2024-04-27 17:51:45.134+05	2024-04-27 17:51:45.802+05	\N	Accepted	Your order is being prepared.
3	2024-04-27 17:51:47.955+05	2024-04-27 17:51:46.96+05	\N	Ready for Delivery	Your order is ready and waiting for the courier.
4	2024-04-27 17:51:50.308+05	2024-04-27 17:51:51.159+05	\N	Out for Delivery	Your order is on the way.
5	2024-04-27 17:51:54.072+05	2024-04-27 17:51:52.524+05	\N	Delivered	Your order has been delivered.
6	2024-04-27 17:51:56.045+05	2024-04-27 17:51:54.94+05	\N	Confirmed	You have confirmed the delivery.
7	2024-04-27 17:51:57.946+05	2024-04-27 17:51:56.9+05	\N	Cancelled	You canceled the order or reported a problem.
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, created_at, updated_at, deleted_at, user_id, order_status) FROM stdin;
9	2024-05-02 01:15:47.884825+05	2024-05-02 01:15:47.884825+05	\N	10	pending
12	2024-05-07 01:10:12.719398+05	2024-05-07 01:34:12.477617+05	2024-05-07 01:44:28.502382+05	9	accepted
13	2024-09-16 13:11:31.845236+05	2024-09-16 13:16:15.09433+05	\N	18	accepted
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, created_at, updated_at, deleted_at, name, quantity, description, price) FROM stdin;
14	2024-05-07 00:57:27.083722+05	2024-05-07 00:57:27.083722+05	\N	Сэндвич 1112	20	Сэндвич с курицей	0
5	2024-04-26 15:35:10.848272+05	2024-05-07 01:40:43.214546+05	\N	Самса с мясом	11	Обычная самса с мясом	\N
13	\N	2024-05-07 01:44:28.500708+05	\N	Товар	5	Для проверки добавления	\N
4	2024-04-26 15:16:05.771161+05	2024-09-16 13:13:10.129675+05	\N	Самса с курицей	0	Обычная самса с курицей	\N
10	2024-04-26 16:39:42.360237+05	2024-09-16 13:13:45.447839+05	\N	Почааааааааааааааа	5	Сыр завернутный в тесто. Очень вкусно!	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, created_at, updated_at, deleted_at, name, email, password, role) FROM stdin;
9	2024-04-09 18:50:54.452717+05	2024-04-09 19:45:02.857113+05	\N	Admin	admin@gmail.com	$2a$10$y8LCaKWxdlsK2eTaCW2tge9BXzb2Sc5Z2xek/P9XxSRemzGo0q9Im	admin
14	2024-04-30 17:10:20.007615+05	2024-04-30 17:10:20.007615+05	\N	baha	baha@gmail.com	$2a$10$sjd1P.mHoFmqzcWBpGFYLu3XrGdWRYks8QDfR8YF2puqRWKA1RJwW	customer
10	2024-04-25 14:48:21.830203+05	2024-05-03 18:45:21.350408+05	\N	ShyntasLegend	shyntas@gmail.com	$2a$10$URxXXZ6FttU5jL4TqG8ftOUbtV7rU0JI7Y07le7bTQ6Ce9jiDWVze	customer
16	2024-09-15 19:42:01.488337+05	2024-09-15 19:42:01.488337+05	\N	iliyas	iliyas@gmail.com	$2a$10$Us1dpq/DVvgx1TtmACV/A.wE6Mu898onURYMv3Rrcy5DSqBWhESOm	customer
17	2024-09-15 19:46:42.204471+05	2024-09-15 19:46:42.204471+05	\N	check	check@gmail.com	$2a$10$VMbOko.vPtgcnOKNn6EYG.ZPIngtiYV481/WK5wLYsIJ4FM/ZleOm	customer
18	2024-09-16 13:06:37.30441+05	2024-09-16 13:06:37.30441+05	\N	Yelina	Yelina@gmail.com	$2a$10$qWa0MX8sish05jOkyrgR7uI8lUm8to1BLo.oA2Evj.bUIW4ucr49m	customer
19	2024-10-07 02:15:41.441974+05	2024-10-07 02:15:41.441974+05	\N	iliyas	iliyasbek2003@gmail.com	$2a$10$GpYvi5e6UlxLh70sRyjXk.s5sWDcRRGWmumiU0upwSYW72Iyi99uy	customer
20	2024-10-07 02:21:21.801017+05	2024-10-07 02:21:21.801017+05	\N	one	one@gmail.com	$2a$10$hU0umMZhGIti0Lsp2xt1oOIUQazOKbRvyp1qjpZemZue2hkW7TS1q	customer
21	2024-10-07 02:49:56.545884+05	2024-10-07 02:49:56.545884+05	\N	two	two@gmail.com	$2a$10$ZTzDLPL0hkssldW9LVLPuehPy5i/kJpao9gNsiUGqIqyI2ZFm/.c2	customer
\.


--
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_items_id_seq', 53, true);


--
-- Name: order_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_statuses_id_seq', 1, false);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 13, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 14, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 21, true);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: order_statuses order_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_statuses
    ADD CONSTRAINT order_statuses_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: products uni_products_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT uni_products_name UNIQUE (name);


--
-- Name: users uni_users_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uni_users_email UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: idx_order_items_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_order_items_deleted_at ON public.order_items USING btree (deleted_at);


--
-- Name: idx_order_items_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_order_items_order_id ON public.order_items USING btree (order_id);


--
-- Name: idx_order_statuses_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_order_statuses_deleted_at ON public.order_statuses USING btree (deleted_at);


--
-- Name: idx_orders_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_orders_deleted_at ON public.orders USING btree (deleted_at);


--
-- Name: idx_products_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_products_deleted_at ON public.products USING btree (deleted_at);


--
-- Name: idx_users_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_deleted_at ON public.users USING btree (deleted_at);


--
-- Name: order_items fk_order_items_order; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_order_items_order FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: order_items fk_order_items_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_order_items_product FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: order_items fk_orders_order_items; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_orders_order_items FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: orders fk_orders_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_orders_user FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--


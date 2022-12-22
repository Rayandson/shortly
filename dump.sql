--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    token text NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    "shortUrl" text NOT NULL,
    url text NOT NULL,
    "visitCount" integer NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(60) NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 'dbd9e209-f032-4a35-883d-d271d1f4edb7', 1, '2022-12-22 16:54:26.090921');
INSERT INTO public.sessions VALUES (2, 'd42619b2-a975-401d-96e3-f01e564eac52', 2, '2022-12-22 16:55:25.62666');
INSERT INTO public.sessions VALUES (3, 'b79a3f1a-f021-4268-a36a-e1961c239fc9', 3, '2022-12-22 16:55:33.96579');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (9, 'WziMDlNw', 'https://www.figma.com/file/DWg9233KR2GS6RLvfZRwyd/Shortly?node-id=0%3A1&t=maRLA3mF9zCmrgjY-0', 0, 3, '2022-12-22 16:57:06.350458');
INSERT INTO public.urls VALUES (2, 'U0gSzk6_', 'https://www.figma.com/file/DWg9233KR2GS6RLvfZRwyd/Shortly?node-id=0%3A1&t=maRLA3mF9zCmrgjY-0', 1, 1, '2022-12-22 16:56:29.872087');
INSERT INTO public.urls VALUES (3, 'knuy3lAJ', 'https://www.figma.com/file/DWg9233KR2GS6RLvfZRwyd/Shortly?node-id=0%3A1&t=maRLA3mF9zCmrgjY-0', 4, 2, '2022-12-22 16:56:47.755692');
INSERT INTO public.urls VALUES (4, 'WVHy9YcX', 'https://www.figma.com/file/DWg9233KR2GS6RLvfZRwyd/Shortly?node-id=0%3A1&t=maRLA3mF9zCmrgjY-0', 2, 2, '2022-12-22 16:56:48.407684');
INSERT INTO public.urls VALUES (5, 'KSXo44tY', 'https://www.figma.com/file/DWg9233KR2GS6RLvfZRwyd/Shortly?node-id=0%3A1&t=maRLA3mF9zCmrgjY-0', 2, 2, '2022-12-22 16:56:49.617848');
INSERT INTO public.urls VALUES (6, 'VUB-f-6H', 'https://www.figma.com/file/DWg9233KR2GS6RLvfZRwyd/Shortly?node-id=0%3A1&t=maRLA3mF9zCmrgjY-0', 3, 3, '2022-12-22 16:57:01.916675');
INSERT INTO public.urls VALUES (7, 'E-GA2VSH', 'https://www.figma.com/file/DWg9233KR2GS6RLvfZRwyd/Shortly?node-id=0%3A1&t=maRLA3mF9zCmrgjY-0', 1, 3, '2022-12-22 16:57:03.457584');
INSERT INTO public.urls VALUES (8, 'UTK_xraq', 'https://www.figma.com/file/DWg9233KR2GS6RLvfZRwyd/Shortly?node-id=0%3A1&t=maRLA3mF9zCmrgjY-0', 1, 3, '2022-12-22 16:57:04.830052');
INSERT INTO public.urls VALUES (1, 'b8TDstwm', 'https://www.figma.com/file/DWg9233KR2GS6RLvfZRwyd/Shortly?node-id=0%3A1&t=maRLA3mF9zCmrgjY-0', 4, 1, '2022-12-22 16:56:26.20478');
INSERT INTO public.urls VALUES (10, '-lBFg3vQ', 'https://www.figma.com/file/DWg9233KR2GS6RLvfZRwyd/Shortly?node-id=0%3A1&t=maRLA3mF9zCmrgjY-0', 0, 1, '2022-12-22 17:05:15.825939');
INSERT INTO public.urls VALUES (11, 'xSBCKikf', 'https://www.figma.com/file/DWg9233KR2GS6RLvfZRwyd/Shortly?node-id=0%3A1&t=maRLA3mF9zCmrgjY-0', 0, 1, '2022-12-22 17:05:18.265188');
INSERT INTO public.urls VALUES (12, 'D76_VoGf', 'https://www.figma.com/file/DWg9233KR2GS6RLvfZRwyd/Shortly?node-id=0%3A1&t=maRLA3mF9zCmrgjY-0', 0, 1, '2022-12-22 17:05:19.362671');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Rayandson', 'rayandson_silva@hotmail.com', '$2b$10$yge1CNW8Re5N0UXe/kJuzO/mIx.gS9uX/q4fnLPRKtEtGqKQxSsnO', '2022-12-22 16:53:51.415242');
INSERT INTO public.users VALUES (2, 'Isaac', 'isaac_silva@hotmail.com', '$2b$10$3wsnVwlf06DRhSwzuOyXdOvCh6WB4cF3dfBamdVn/MWZW.3eO994q', '2022-12-22 16:54:03.493247');
INSERT INTO public.users VALUES (3, 'Sandra', 'sandra_silva@hotmail.com', '$2b$10$JPpyDlr9m53qHBuMjIEZReh03PGO05Ujitx2FRYnmrvsIyIE9YN.y', '2022-12-22 16:54:12.376317');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 3, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 12, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: urls urls_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--


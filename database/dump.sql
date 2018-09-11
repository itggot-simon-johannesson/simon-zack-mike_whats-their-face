--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP INDEX IF EXISTS public.user_mail_uindex;
DROP INDEX IF EXISTS public.user_id_uindex;
DROP INDEX IF EXISTS public.user_group_id_uindex;
DROP INDEX IF EXISTS public.person_list_id_uindex;
DROP INDEX IF EXISTS public.person_id_uindex;
DROP INDEX IF EXISTS public."person-list_id_uindex";
DROP INDEX IF EXISTS public."person-list_group_id_uindex";
DROP INDEX IF EXISTS public.group_id_uindex;
DROP INDEX IF EXISTS public.game_id_uindex;
ALTER TABLE IF EXISTS ONLY public.user_group DROP CONSTRAINT IF EXISTS user_group_pkey;
ALTER TABLE IF EXISTS ONLY public.person DROP CONSTRAINT IF EXISTS person_pkey;
ALTER TABLE IF EXISTS ONLY public.person_list DROP CONSTRAINT IF EXISTS person_list_pkey;
ALTER TABLE IF EXISTS ONLY public.list DROP CONSTRAINT IF EXISTS "person-list_pkey";
ALTER TABLE IF EXISTS ONLY public.list_group DROP CONSTRAINT IF EXISTS "person-list_group_pkey";
ALTER TABLE IF EXISTS ONLY public."group" DROP CONSTRAINT IF EXISTS group_pkey;
ALTER TABLE IF EXISTS ONLY public.game DROP CONSTRAINT IF EXISTS game_pkey;
ALTER TABLE IF EXISTS ONLY public."user" DROP CONSTRAINT IF EXISTS "User_pkey";
ALTER TABLE IF EXISTS public.user_group ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public."user" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.person_list ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.person ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.list_group ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.list ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public."group" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.game ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.user_group_id_seq;
DROP TABLE IF EXISTS public.user_group;
DROP SEQUENCE IF EXISTS public.person_list_id_seq;
DROP TABLE IF EXISTS public.person_list;
DROP SEQUENCE IF EXISTS public.person_id_seq;
DROP SEQUENCE IF EXISTS public."person-list_id_seq";
DROP SEQUENCE IF EXISTS public."person-list_group_id_seq";
DROP TABLE IF EXISTS public.person;
DROP TABLE IF EXISTS public.list_group;
DROP TABLE IF EXISTS public.list;
DROP SEQUENCE IF EXISTS public.group_id_seq;
DROP TABLE IF EXISTS public."group";
DROP SEQUENCE IF EXISTS public.game_id_seq;
DROP TABLE IF EXISTS public.game;
DROP SEQUENCE IF EXISTS public."User_id_seq";
DROP TABLE IF EXISTS public."user";
DROP SCHEMA IF EXISTS public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: simonspace
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO simonspace;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: simonspace
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: user; Type: TABLE; Schema: public; Owner: test_user
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    mail character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public."user" OWNER TO test_user;

--
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: test_user
--

CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."User_id_seq" OWNER TO test_user;

--
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test_user
--

ALTER SEQUENCE public."User_id_seq" OWNED BY public."user".id;


--
-- Name: game; Type: TABLE; Schema: public; Owner: test_user
--

CREATE TABLE public.game (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    user_id integer NOT NULL,
    highscore integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.game OWNER TO test_user;

--
-- Name: game_id_seq; Type: SEQUENCE; Schema: public; Owner: test_user
--

CREATE SEQUENCE public.game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_id_seq OWNER TO test_user;

--
-- Name: game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test_user
--

ALTER SEQUENCE public.game_id_seq OWNED BY public.game.id;


--
-- Name: group; Type: TABLE; Schema: public; Owner: test_user
--

CREATE TABLE public."group" (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public."group" OWNER TO test_user;

--
-- Name: group_id_seq; Type: SEQUENCE; Schema: public; Owner: test_user
--

CREATE SEQUENCE public.group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_id_seq OWNER TO test_user;

--
-- Name: group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test_user
--

ALTER SEQUENCE public.group_id_seq OWNED BY public."group".id;


--
-- Name: list; Type: TABLE; Schema: public; Owner: test_user
--

CREATE TABLE public.list (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    user_id integer NOT NULL,
    shared boolean DEFAULT false NOT NULL
);


ALTER TABLE public.list OWNER TO test_user;

--
-- Name: list_group; Type: TABLE; Schema: public; Owner: test_user
--

CREATE TABLE public.list_group (
    id integer NOT NULL,
    "person-list_id" integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.list_group OWNER TO test_user;

--
-- Name: person; Type: TABLE; Schema: public; Owner: test_user
--

CREATE TABLE public.person (
    id integer NOT NULL,
    fisrtname character varying(255) NOT NULL,
    lastname character varying(255),
    photo character varying(255) NOT NULL
);


ALTER TABLE public.person OWNER TO test_user;

--
-- Name: person-list_group_id_seq; Type: SEQUENCE; Schema: public; Owner: test_user
--

CREATE SEQUENCE public."person-list_group_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."person-list_group_id_seq" OWNER TO test_user;

--
-- Name: person-list_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test_user
--

ALTER SEQUENCE public."person-list_group_id_seq" OWNED BY public.list_group.id;


--
-- Name: person-list_id_seq; Type: SEQUENCE; Schema: public; Owner: test_user
--

CREATE SEQUENCE public."person-list_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."person-list_id_seq" OWNER TO test_user;

--
-- Name: person-list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test_user
--

ALTER SEQUENCE public."person-list_id_seq" OWNED BY public.list.id;


--
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: test_user
--

CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_id_seq OWNER TO test_user;

--
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test_user
--

ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;


--
-- Name: person_list; Type: TABLE; Schema: public; Owner: test_user
--

CREATE TABLE public.person_list (
    id integer NOT NULL,
    person_id integer NOT NULL,
    list_id integer NOT NULL
);


ALTER TABLE public.person_list OWNER TO test_user;

--
-- Name: person_list_id_seq; Type: SEQUENCE; Schema: public; Owner: test_user
--

CREATE SEQUENCE public.person_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_list_id_seq OWNER TO test_user;

--
-- Name: person_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test_user
--

ALTER SEQUENCE public.person_list_id_seq OWNED BY public.person_list.id;


--
-- Name: user_group; Type: TABLE; Schema: public; Owner: test_user
--

CREATE TABLE public.user_group (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.user_group OWNER TO test_user;

--
-- Name: user_group_id_seq; Type: SEQUENCE; Schema: public; Owner: test_user
--

CREATE SEQUENCE public.user_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_group_id_seq OWNER TO test_user;

--
-- Name: user_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test_user
--

ALTER SEQUENCE public.user_group_id_seq OWNED BY public.user_group.id;


--
-- Name: game id; Type: DEFAULT; Schema: public; Owner: test_user
--

ALTER TABLE ONLY public.game ALTER COLUMN id SET DEFAULT nextval('public.game_id_seq'::regclass);


--
-- Name: group id; Type: DEFAULT; Schema: public; Owner: test_user
--

ALTER TABLE ONLY public."group" ALTER COLUMN id SET DEFAULT nextval('public.group_id_seq'::regclass);


--
-- Name: list id; Type: DEFAULT; Schema: public; Owner: test_user
--

ALTER TABLE ONLY public.list ALTER COLUMN id SET DEFAULT nextval('public."person-list_id_seq"'::regclass);


--
-- Name: list_group id; Type: DEFAULT; Schema: public; Owner: test_user
--

ALTER TABLE ONLY public.list_group ALTER COLUMN id SET DEFAULT nextval('public."person-list_group_id_seq"'::regclass);


--
-- Name: person id; Type: DEFAULT; Schema: public; Owner: test_user
--

ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);


--
-- Name: person_list id; Type: DEFAULT; Schema: public; Owner: test_user
--

ALTER TABLE ONLY public.person_list ALTER COLUMN id SET DEFAULT nextval('public.person_list_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: test_user
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);


--
-- Name: user_group id; Type: DEFAULT; Schema: public; Owner: test_user
--

ALTER TABLE ONLY public.user_group ALTER COLUMN id SET DEFAULT nextval('public.user_group_id_seq'::regclass);


--
-- Data for Name: game; Type: TABLE DATA; Schema: public; Owner: test_user
--



--
-- Data for Name: group; Type: TABLE DATA; Schema: public; Owner: test_user
--



--
-- Data for Name: list; Type: TABLE DATA; Schema: public; Owner: test_user
--



--
-- Data for Name: list_group; Type: TABLE DATA; Schema: public; Owner: test_user
--



--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: test_user
--



--
-- Data for Name: person_list; Type: TABLE DATA; Schema: public; Owner: test_user
--



--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: test_user
--

INSERT INTO public."user" (id, mail, username, password) VALUES (1, 'mail@hej.ocm', 'hej', 'då');


--
-- Data for Name: user_group; Type: TABLE DATA; Schema: public; Owner: test_user
--



--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test_user
--

SELECT pg_catalog.setval('public."User_id_seq"', 1, true);


--
-- Name: game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test_user
--

SELECT pg_catalog.setval('public.game_id_seq', 1, false);


--
-- Name: group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test_user
--

SELECT pg_catalog.setval('public.group_id_seq', 1, false);


--
-- Name: person-list_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test_user
--

SELECT pg_catalog.setval('public."person-list_group_id_seq"', 1, false);


--
-- Name: person-list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test_user
--

SELECT pg_catalog.setval('public."person-list_id_seq"', 1, false);


--
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test_user
--

SELECT pg_catalog.setval('public.person_id_seq', 1, false);


--
-- Name: person_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test_user
--

SELECT pg_catalog.setval('public.person_list_id_seq', 1, false);


--
-- Name: user_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test_user
--

SELECT pg_catalog.setval('public.user_group_id_seq', 1, false);


--
-- Name: user User_pkey; Type: CONSTRAINT; Schema: public; Owner: test_user
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: game game_pkey; Type: CONSTRAINT; Schema: public; Owner: test_user
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_pkey PRIMARY KEY (id);


--
-- Name: group group_pkey; Type: CONSTRAINT; Schema: public; Owner: test_user
--

ALTER TABLE ONLY public."group"
    ADD CONSTRAINT group_pkey PRIMARY KEY (id);


--
-- Name: list_group person-list_group_pkey; Type: CONSTRAINT; Schema: public; Owner: test_user
--

ALTER TABLE ONLY public.list_group
    ADD CONSTRAINT "person-list_group_pkey" PRIMARY KEY (id);


--
-- Name: list person-list_pkey; Type: CONSTRAINT; Schema: public; Owner: test_user
--

ALTER TABLE ONLY public.list
    ADD CONSTRAINT "person-list_pkey" PRIMARY KEY (id);


--
-- Name: person_list person_list_pkey; Type: CONSTRAINT; Schema: public; Owner: test_user
--

ALTER TABLE ONLY public.person_list
    ADD CONSTRAINT person_list_pkey PRIMARY KEY (id);


--
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: test_user
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- Name: user_group user_group_pkey; Type: CONSTRAINT; Schema: public; Owner: test_user
--

ALTER TABLE ONLY public.user_group
    ADD CONSTRAINT user_group_pkey PRIMARY KEY (id);


--
-- Name: game_id_uindex; Type: INDEX; Schema: public; Owner: test_user
--

CREATE UNIQUE INDEX game_id_uindex ON public.game USING btree (id);


--
-- Name: group_id_uindex; Type: INDEX; Schema: public; Owner: test_user
--

CREATE UNIQUE INDEX group_id_uindex ON public."group" USING btree (id);


--
-- Name: person-list_group_id_uindex; Type: INDEX; Schema: public; Owner: test_user
--

CREATE UNIQUE INDEX "person-list_group_id_uindex" ON public.list_group USING btree (id);


--
-- Name: person-list_id_uindex; Type: INDEX; Schema: public; Owner: test_user
--

CREATE UNIQUE INDEX "person-list_id_uindex" ON public.list USING btree (id);


--
-- Name: person_id_uindex; Type: INDEX; Schema: public; Owner: test_user
--

CREATE UNIQUE INDEX person_id_uindex ON public.person USING btree (id);


--
-- Name: person_list_id_uindex; Type: INDEX; Schema: public; Owner: test_user
--

CREATE UNIQUE INDEX person_list_id_uindex ON public.person_list USING btree (id);


--
-- Name: user_group_id_uindex; Type: INDEX; Schema: public; Owner: test_user
--

CREATE UNIQUE INDEX user_group_id_uindex ON public.user_group USING btree (id);


--
-- Name: user_id_uindex; Type: INDEX; Schema: public; Owner: test_user
--

CREATE UNIQUE INDEX user_id_uindex ON public."user" USING btree (id);


--
-- Name: user_mail_uindex; Type: INDEX; Schema: public; Owner: test_user
--

CREATE UNIQUE INDEX user_mail_uindex ON public."user" USING btree (mail);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: simonspace
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


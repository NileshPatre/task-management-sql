--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

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
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(255),
    label character varying(255)
);


ALTER TABLE public.status OWNER TO postgres;

--
-- Name: tasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tasks (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    title character varying(255),
    description text,
    status_id uuid,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.tasks OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.status (id, name, label) FROM stdin;
99a432d8-9fb7-4943-89a0-9bcaf3f3bd07	pending	Pending
1debefde-0994-4501-b854-fcb1378e4ff5	in_progress	In Progress
7d80a029-4c93-45b4-9d49-4261cea8ef63	done	Done
\.


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tasks (id, title, description, status_id, created_at, updated_at) FROM stdin;
0345a11c-a093-456b-8324-0721fd930d10	t2	gg	99a432d8-9fb7-4943-89a0-9bcaf3f3bd07	2024-06-02 20:31:27.438386+05:30	2024-06-02 20:31:27.438386+05:30
5db2ea76-4114-4f19-8853-7131761f7109	tatsk2	sdsd	99a432d8-9fb7-4943-89a0-9bcaf3f3bd07	2024-06-02 21:05:13.561+05:30	2024-06-02 00:00:00+05:30
4194eb97-3b97-45af-93b3-385588fa9465	t11	rr	99a432d8-9fb7-4943-89a0-9bcaf3f3bd07	2024-06-02 20:31:17.995+05:30	2024-06-02 00:00:00+05:30
a54bb23b-3954-4908-b8fb-fd6aea8b4bb5	check date	ff	99a432d8-9fb7-4943-89a0-9bcaf3f3bd07	2024-06-02 21:13:24.950836+05:30	2024-06-02 21:13:30.98+05:30
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, username, password, created_at, updated_at) FROM stdin;
024c16b3-cf9f-4a13-a03a-78a1fdd04948	nilesh	$2b$10$0Fs85pVar1SfkkcjfUqiae104qFp8KNm/lVT9prjFkfOeuWirHshm	2024-06-02 16:03:30.521831+05:30	2024-06-02 16:03:30.521831+05:30
3c1a4fc5-9d52-4c7b-8b79-f989681840a2	nilesh2	$2b$10$fq8VP7Nz/VdoZsa573sR4eKAuVoNeyAEFjOkt3rjfK3pmEOJ6uqfq	2024-06-02 16:04:28.807084+05:30	2024-06-02 16:04:28.807084+05:30
70808e34-b26e-42f2-8ceb-9777b718092c	nilesh3	$2b$10$4Z6W5ada7Ri7fCbkgOUL/.aKJ.CuoDI32YO2Z3URYL.yfdsYoO57m	2024-06-02 17:37:27.797942+05:30	2024-06-02 17:37:27.797942+05:30
1b8ef0cd-e8b1-46ec-ab67-b1ed193eb69b	nilesh4	$2b$10$NNiXi7nhgmdnrrGYciSQCei27mLXqxjhhjKbotcP8h6/qAeDkMPmK	2024-06-02 17:39:40.207022+05:30	2024-06-02 17:39:40.207022+05:30
ba8a52a4-058d-4a72-9e3f-927a68e3781a	nilesh5	$2b$10$cJ3UX86vnRKnypHzFVA0qOp23Irm7/mcwDKOKVvQIgGkOUS2BhhoO	2024-06-02 17:40:00.120584+05:30	2024-06-02 17:40:00.120584+05:30
6b0b91aa-5e35-4555-b429-8e584040ed7f	nilesh66	$2b$10$gwPANeGkK.LeWGdV4IIZeeX0B/lYa.CIwee0lvCoZ1YzgZpkHYRoa	2024-06-02 17:41:15.142667+05:30	2024-06-02 17:41:15.142667+05:30
\.


--
-- Name: status status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);


--
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: tasks tasks_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.status(id);


--
-- PostgreSQL database dump complete
--


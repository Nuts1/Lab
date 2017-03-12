--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.5
-- Dumped by pg_dump version 9.5.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: android; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE android WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';


ALTER DATABASE android OWNER TO postgres;

\connect android

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE author (
    id_author integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE author OWNER TO postgres;

--
-- Name: author_id_author_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE author_id_author_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE author_id_author_seq OWNER TO postgres;

--
-- Name: author_id_author_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE author_id_author_seq OWNED BY author.id_author;


--
-- Name: book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE book (
    id_book integer NOT NULL,
    name character varying(50) NOT NULL,
    year integer NOT NULL,
    description text NOT NULL,
    icon character varying(50) NOT NULL,
    column_7 integer,
    id_author integer
);


ALTER TABLE book OWNER TO postgres;

--
-- Name: book_id_book_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE book_id_book_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE book_id_book_seq OWNER TO postgres;

--
-- Name: book_id_book_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE book_id_book_seq OWNED BY book.id_book;


--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE role (
    role_id integer NOT NULL,
    role character varying(20)
);


ALTER TABLE role OWNER TO postgres;

--
-- Name: role_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE role_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE role_role_id_seq OWNER TO postgres;

--
-- Name: role_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE role_role_id_seq OWNED BY role.role_id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "user" (
    id_user integer NOT NULL,
    password character varying(100) NOT NULL,
    email character varying(50) NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE "user" OWNER TO postgres;

--
-- Name: user_id_user_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_id_user_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_id_user_seq OWNER TO postgres;

--
-- Name: user_id_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_id_user_seq OWNED BY "user".id_user;


--
-- Name: id_author; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY author ALTER COLUMN id_author SET DEFAULT nextval('author_id_author_seq'::regclass);


--
-- Name: id_book; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY book ALTER COLUMN id_book SET DEFAULT nextval('book_id_book_seq'::regclass);


--
-- Name: role_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY role ALTER COLUMN role_id SET DEFAULT nextval('role_role_id_seq'::regclass);


--
-- Name: id_user; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "user" ALTER COLUMN id_user SET DEFAULT nextval('user_id_user_seq'::regclass);


--
-- Data for Name: author; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO author (id_author, name) VALUES (1, 'Bruce Eckel');


--
-- Name: author_id_author_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('author_id_author_seq', 1, false);


--
-- Data for Name: book; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (3, 'BOOK-  2', 1995, 'DESCRIPTION!!!!  2', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (5, 'BOOK-  4', 1995, 'DESCRIPTION!!!!  4', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (7, 'BOOK-  6', 1995, 'DESCRIPTION!!!!  6', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (8, 'BOOK-  7', 1995, 'DESCRIPTION!!!!  7', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (9, 'BOOK-  8', 1995, 'DESCRIPTION!!!!  8', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (11, 'BOOK- 10', 1995, 'DESCRIPTION!!!! 10', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (12, 'BOOK- 11', 1995, 'DESCRIPTION!!!! 11', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (13, 'BOOK- 12', 1995, 'DESCRIPTION!!!! 12', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (14, 'BOOK- 13', 1995, 'DESCRIPTION!!!! 13', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (15, 'BOOK- 14', 1995, 'DESCRIPTION!!!! 14', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (16, 'BOOK- 15', 1995, 'DESCRIPTION!!!! 15', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (17, 'BOOK- 16', 1995, 'DESCRIPTION!!!! 16', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (18, 'BOOK- 17', 1995, 'DESCRIPTION!!!! 17', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (19, 'BOOK- 18', 1995, 'DESCRIPTION!!!! 18', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (20, 'BOOK- 19', 1995, 'DESCRIPTION!!!! 19', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (21, 'BOOK- 20', 1995, 'DESCRIPTION!!!! 20', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (22, 'BOOK- 21', 1995, 'DESCRIPTION!!!! 21', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (23, 'BOOK- 22', 1995, 'DESCRIPTION!!!! 22', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (24, 'BOOK- 23', 1995, 'DESCRIPTION!!!! 23', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (25, 'BOOK- 24', 1995, 'DESCRIPTION!!!! 24', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (26, 'BOOK- 25', 1995, 'DESCRIPTION!!!! 25', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (27, 'BOOK- 26', 1995, 'DESCRIPTION!!!! 26', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (28, 'BOOK- 27', 1995, 'DESCRIPTION!!!! 27', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (29, 'BOOK- 28', 1995, 'DESCRIPTION!!!! 28', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (30, 'BOOK- 29', 1995, 'DESCRIPTION!!!! 29', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (31, 'BOOK- 30', 1995, 'DESCRIPTION!!!! 30', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (32, 'BOOK- 31', 1995, 'DESCRIPTION!!!! 31', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (33, 'BOOK- 32', 1995, 'DESCRIPTION!!!! 32', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (34, 'BOOK- 33', 1995, 'DESCRIPTION!!!! 33', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (35, 'BOOK- 34', 1995, 'DESCRIPTION!!!! 34', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (36, 'BOOK- 35', 1995, 'DESCRIPTION!!!! 35', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (37, 'BOOK- 36', 1995, 'DESCRIPTION!!!! 36', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (38, 'BOOK- 37', 1995, 'DESCRIPTION!!!! 37', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (39, 'BOOK- 38', 1995, 'DESCRIPTION!!!! 38', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (40, 'BOOK- 39', 1995, 'DESCRIPTION!!!! 39', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (41, 'BOOK- 40', 1995, 'DESCRIPTION!!!! 40', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (42, 'BOOK- 41', 1995, 'DESCRIPTION!!!! 41', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (43, 'BOOK- 42', 1995, 'DESCRIPTION!!!! 42', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (44, 'BOOK- 43', 1995, 'DESCRIPTION!!!! 43', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (45, 'BOOK- 44', 1995, 'DESCRIPTION!!!! 44', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (46, 'BOOK- 45', 1995, 'DESCRIPTION!!!! 45', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (47, 'BOOK- 46', 1995, 'DESCRIPTION!!!! 46', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (48, 'BOOK- 47', 1995, 'DESCRIPTION!!!! 47', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (49, 'BOOK- 48', 1995, 'DESCRIPTION!!!! 48', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (50, 'BOOK- 49', 1995, 'DESCRIPTION!!!! 49', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (51, 'BOOK- 50', 1995, 'DESCRIPTION!!!! 50', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (52, 'BOOK- 51', 1995, 'DESCRIPTION!!!! 51', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (53, 'BOOK- 52', 1995, 'DESCRIPTION!!!! 52', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (54, 'BOOK- 53', 1995, 'DESCRIPTION!!!! 53', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (55, 'BOOK- 54', 1995, 'DESCRIPTION!!!! 54', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (56, 'BOOK- 55', 1995, 'DESCRIPTION!!!! 55', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (57, 'BOOK- 56', 1995, 'DESCRIPTION!!!! 56', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (58, 'BOOK- 57', 1995, 'DESCRIPTION!!!! 57', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (59, 'BOOK- 58', 1995, 'DESCRIPTION!!!! 58', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (60, 'BOOK- 59', 1995, 'DESCRIPTION!!!! 59', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (61, 'BOOK- 60', 1995, 'DESCRIPTION!!!! 60', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (62, 'BOOK- 61', 1995, 'DESCRIPTION!!!! 61', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (63, 'BOOK- 62', 1995, 'DESCRIPTION!!!! 62', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (64, 'BOOK- 63', 1995, 'DESCRIPTION!!!! 63', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (65, 'BOOK- 64', 1995, 'DESCRIPTION!!!! 64', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (66, 'BOOK- 65', 1995, 'DESCRIPTION!!!! 65', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (67, 'BOOK- 66', 1995, 'DESCRIPTION!!!! 66', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (68, 'BOOK- 67', 1995, 'DESCRIPTION!!!! 67', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (69, 'BOOK- 68', 1995, 'DESCRIPTION!!!! 68', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (70, 'BOOK- 69', 1995, 'DESCRIPTION!!!! 69', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (71, 'BOOK- 70', 1995, 'DESCRIPTION!!!! 70', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (72, 'BOOK- 71', 1995, 'DESCRIPTION!!!! 71', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (73, 'BOOK- 72', 1995, 'DESCRIPTION!!!! 72', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (74, 'BOOK- 73', 1995, 'DESCRIPTION!!!! 73', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (75, 'BOOK- 74', 1995, 'DESCRIPTION!!!! 74', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (76, 'BOOK- 75', 1995, 'DESCRIPTION!!!! 75', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (77, 'BOOK- 76', 1995, 'DESCRIPTION!!!! 76', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (78, 'BOOK- 77', 1995, 'DESCRIPTION!!!! 77', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (79, 'BOOK- 78', 1995, 'DESCRIPTION!!!! 78', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (80, 'BOOK- 79', 1995, 'DESCRIPTION!!!! 79', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (81, 'BOOK- 80', 1995, 'DESCRIPTION!!!! 80', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (82, 'BOOK- 81', 1995, 'DESCRIPTION!!!! 81', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (83, 'BOOK- 82', 1995, 'DESCRIPTION!!!! 82', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (1, 'Java: A Beginner’s Guide (Sixth Edition)', 2016, 'As the name suggests, it’s a good book for someone with basic knowledge of programming wanting to learn java programming language. It’s written by “Herbert Schildt” and covers all the basic concepts of Core Java.', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (4, 'BOOK-  3', 1995, 'DESCRIPTION!!!!  3', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (84, 'BOOK- 83', 1995, 'DESCRIPTION!!!! 83', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (85, 'BOOK- 84', 1995, 'DESCRIPTION!!!! 84', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (86, 'BOOK- 85', 1995, 'DESCRIPTION!!!! 85', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (87, 'BOOK- 86', 1995, 'DESCRIPTION!!!! 86', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (88, 'BOOK- 87', 1995, 'DESCRIPTION!!!! 87', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (89, 'BOOK- 88', 1995, 'DESCRIPTION!!!! 88', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (90, 'BOOK- 89', 1995, 'DESCRIPTION!!!! 89', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (91, 'BOOK- 90', 1995, 'DESCRIPTION!!!! 90', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (92, 'BOOK- 91', 1995, 'DESCRIPTION!!!! 91', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (93, 'BOOK- 92', 1995, 'DESCRIPTION!!!! 92', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (94, 'BOOK- 93', 1995, 'DESCRIPTION!!!! 93', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (95, 'BOOK- 94', 1995, 'DESCRIPTION!!!! 94', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (96, 'BOOK- 95', 1995, 'DESCRIPTION!!!! 95', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (97, 'BOOK- 96', 1995, 'DESCRIPTION!!!! 96', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (98, 'BOOK- 97', 1995, 'DESCRIPTION!!!! 97', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (99, 'BOOK- 98', 1995, 'DESCRIPTION!!!! 98', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (100, 'BOOK- 99', 1995, 'DESCRIPTION!!!! 99', '/image/book.png', NULL, 1);
INSERT INTO book (id_book, name, year, description, icon, column_7, id_author) VALUES (101, 'BOOK- ##', 1995, 'DESCRIPTION!!!! ##', '/image/book.png', NULL, 1);


--
-- Name: book_id_book_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('book_id_book_seq', 101, true);


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO role (role_id, role) VALUES (1, 'ROLE_ADMIN');
INSERT INTO role (role_id, role) VALUES (2, 'ROLE_USER');


--
-- Name: role_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('role_role_id_seq', 1, false);


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "user" (id_user, password, email, first_name, last_name, role_id) VALUES (1, '$2a$11$kbrpfbTih2C7HW2oYt1Pj.sMPwE4NOwo3aw3kiPnwyQ0fTdU0qNtG', 'admin@mail.com', 'Aleksandr', 'Vavilin', 1);


--
-- Name: user_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_id_user_seq', 1, false);


--
-- Name: author_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_pkey PRIMARY KEY (id_author);


--
-- Name: book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id_book);


--
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (role_id);


--
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id_user);


--
-- Name: role_role_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX role_role_uindex ON role USING btree (role);


--
-- Name: book_author_id_author_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_author_id_author_fk FOREIGN KEY (id_author) REFERENCES author(id_author);


--
-- Name: user_role_role_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_role_role_id_fk FOREIGN KEY (role_id) REFERENCES role(role_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


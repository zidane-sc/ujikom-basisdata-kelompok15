toc.dat                                                                                             0000600 0004000 0002000 00000043735 14650415763 0014466 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP   "    !                |         
   kelompok15    13.8 (Debian 13.8-1.pgdg110+1)     16.3 (Ubuntu 16.3-1.pgdg22.04+1) >    	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         
           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                    0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                    1262    107372 
   kelompok15    DATABASE     u   CREATE DATABASE kelompok15 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE kelompok15;
                postgres    false                     2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false                    0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    4         �           1247    108058    OrderItemType    TYPE     P   CREATE TYPE public."OrderItemType" AS ENUM (
    'PRODUCT',
    'EXPEDITION'
);
 "   DROP TYPE public."OrderItemType";
       public          postgres    false    4         �           1247    108050    OrderStatus    TYPE     \   CREATE TYPE public."OrderStatus" AS ENUM (
    'VERIFICATION',
    'SENDING',
    'SENT'
);
     DROP TYPE public."OrderStatus";
       public          postgres    false    4         z           1247    108036    PaymentMethod    TYPE     E   CREATE TYPE public."PaymentMethod" AS ENUM (
    'BANK',
    'CC'
);
 "   DROP TYPE public."PaymentMethod";
       public          postgres    false    4         }           1247    108042    PaymentStatus    TYPE     W   CREATE TYPE public."PaymentStatus" AS ENUM (
    'UNPAID',
    'PAID',
    'CANCEL'
);
 "   DROP TYPE public."PaymentStatus";
       public          postgres    false    4         �           1247    108064    RoleType    TYPE     G   CREATE TYPE public."RoleType" AS ENUM (
    'ADMIN',
    'CUSTOMER'
);
    DROP TYPE public."RoleType";
       public          postgres    false    4         �            1259    108151    order_items    TABLE     6  CREATE TABLE public.order_items (
    id integer NOT NULL,
    type public."OrderItemType" NOT NULL,
    price numeric(10,0) NOT NULL,
    discount numeric(10,0) NOT NULL,
    total_price numeric(10,0) NOT NULL,
    quantity integer DEFAULT 1,
    order_id integer NOT NULL,
    product_id integer NOT NULL
);
    DROP TABLE public.order_items;
       public         heap    postgres    false    643    4         �            1259    108149    order_items_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.order_items_id_seq;
       public          postgres    false    211    4                    0    0    order_items_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.order_items_id_seq OWNED BY public.order_items.id;
          public          postgres    false    210         �            1259    108131    orders    TABLE     �  CREATE TABLE public.orders (
    id integer NOT NULL,
    order_date timestamp without time zone NOT NULL,
    order_expired timestamp without time zone NOT NULL,
    tracking_number character varying(250) DEFAULT NULL::character varying,
    payment_method public."PaymentMethod",
    payment_proof character varying(250) DEFAULT NULL::character varying,
    status public."PaymentStatus" NOT NULL,
    order_status public."OrderStatus" NOT NULL,
    user_id integer NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false    634    637    640    4         �            1259    108129    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          postgres    false    209    4                    0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          postgres    false    208         �            1259    108115    product_images    TABLE     �   CREATE TABLE public.product_images (
    id integer NOT NULL,
    image_title character varying(250) NOT NULL,
    image_path character varying(250) NOT NULL,
    product_id integer NOT NULL
);
 "   DROP TABLE public.product_images;
       public         heap    postgres    false    4         �            1259    108113    product_images_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.product_images_id_seq;
       public          postgres    false    207    4                    0    0    product_images_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.product_images_id_seq OWNED BY public.product_images.id;
          public          postgres    false    206         �            1259    108102    products    TABLE     �   CREATE TABLE public.products (
    id integer NOT NULL,
    title character varying(250) NOT NULL,
    slug character varying(250) NOT NULL,
    description text NOT NULL,
    price numeric(10,0) NOT NULL,
    discount numeric(10,0) NOT NULL
);
    DROP TABLE public.products;
       public         heap    postgres    false    4         �            1259    108100    products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public          postgres    false    4    205                    0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
          public          postgres    false    204         �            1259    108086    user_details    TABLE     �   CREATE TABLE public.user_details (
    id integer NOT NULL,
    address text NOT NULL,
    phone character varying(13) NOT NULL,
    postal_code character varying(5) NOT NULL,
    user_id integer NOT NULL
);
     DROP TABLE public.user_details;
       public         heap    postgres    false    4         �            1259    108084    user_details_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.user_details_id_seq;
       public          postgres    false    203    4                    0    0    user_details_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.user_details_id_seq OWNED BY public.user_details.id;
          public          postgres    false    202         �            1259    108071    users    TABLE       CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    email character varying(250) NOT NULL,
    username character varying(250) NOT NULL,
    password character varying(50) NOT NULL,
    role public."RoleType" NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false    646    4         �            1259    108069    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    4    201                    0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    200         ^           2604    108154    order_items id    DEFAULT     p   ALTER TABLE ONLY public.order_items ALTER COLUMN id SET DEFAULT nextval('public.order_items_id_seq'::regclass);
 =   ALTER TABLE public.order_items ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    211    211         [           2604    108134 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    209    209         Z           2604    108118    product_images id    DEFAULT     v   ALTER TABLE ONLY public.product_images ALTER COLUMN id SET DEFAULT nextval('public.product_images_id_seq'::regclass);
 @   ALTER TABLE public.product_images ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206    207         Y           2604    108105    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    205    205         X           2604    108089    user_details id    DEFAULT     r   ALTER TABLE ONLY public.user_details ALTER COLUMN id SET DEFAULT nextval('public.user_details_id_seq'::regclass);
 >   ALTER TABLE public.user_details ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    203    203         W           2604    108074    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    200    201    201                   0    108151    order_items 
   TABLE DATA           m   COPY public.order_items (id, type, price, discount, total_price, quantity, order_id, product_id) FROM stdin;
    public          postgres    false    211       3078.dat           0    108131    orders 
   TABLE DATA           �   COPY public.orders (id, order_date, order_expired, tracking_number, payment_method, payment_proof, status, order_status, user_id) FROM stdin;
    public          postgres    false    209       3076.dat           0    108115    product_images 
   TABLE DATA           Q   COPY public.product_images (id, image_title, image_path, product_id) FROM stdin;
    public          postgres    false    207       3074.dat            0    108102    products 
   TABLE DATA           Q   COPY public.products (id, title, slug, description, price, discount) FROM stdin;
    public          postgres    false    205       3072.dat �          0    108086    user_details 
   TABLE DATA           P   COPY public.user_details (id, address, phone, postal_code, user_id) FROM stdin;
    public          postgres    false    203       3070.dat �          0    108071    users 
   TABLE DATA           J   COPY public.users (id, name, email, username, password, role) FROM stdin;
    public          postgres    false    201       3068.dat            0    0    order_items_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.order_items_id_seq', 8, true);
          public          postgres    false    210                    0    0    orders_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.orders_id_seq', 6, true);
          public          postgres    false    208                    0    0    product_images_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.product_images_id_seq', 5, true);
          public          postgres    false    206                    0    0    products_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.products_id_seq', 6, true);
          public          postgres    false    204                    0    0    user_details_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.user_details_id_seq', 5, true);
          public          postgres    false    202                    0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 5, true);
          public          postgres    false    200         s           2606    108157    order_items order_items_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_items_pkey;
       public            postgres    false    211         o           2606    108141    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    209         q           2606    108143 !   orders orders_tracking_number_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_tracking_number_key UNIQUE (tracking_number);
 K   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_tracking_number_key;
       public            postgres    false    209         m           2606    108123 "   product_images product_images_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_images_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.product_images DROP CONSTRAINT product_images_pkey;
       public            postgres    false    207         i           2606    108110    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    205         k           2606    108112    products products_slug_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_slug_key UNIQUE (slug);
 D   ALTER TABLE ONLY public.products DROP CONSTRAINT products_slug_key;
       public            postgres    false    205         g           2606    108094    user_details user_details_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.user_details
    ADD CONSTRAINT user_details_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.user_details DROP CONSTRAINT user_details_pkey;
       public            postgres    false    203         a           2606    108081    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    201         c           2606    108079    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    201         e           2606    108083    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public            postgres    false    201         w           2606    108158 %   order_items order_items_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_items_order_id_fkey;
       public          postgres    false    2927    209    211         x           2606    108163 '   order_items order_items_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_items_product_id_fkey;
       public          postgres    false    211    205    2921         v           2606    108144    orders orders_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_user_id_fkey;
       public          postgres    false    2915    201    209         u           2606    108124 -   product_images product_images_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_images_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.product_images DROP CONSTRAINT product_images_product_id_fkey;
       public          postgres    false    2921    207    205         t           2606    108095 &   user_details user_details_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_details
    ADD CONSTRAINT user_details_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.user_details DROP CONSTRAINT user_details_user_id_fkey;
       public          postgres    false    203    2915    201                                           3078.dat                                                                                            0000600 0004000 0002000 00000000466 14650415763 0014274 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	PRODUCT	150000	20000	130000	1	1	1
2	PRODUCT	3000000	250000	2750000	1	2	2
3	PRODUCT	750000	100000	650000	1	3	3
4	PRODUCT	12000000	1500000	10500000	1	4	4
5	PRODUCT	5000000	500000	4500000	1	5	5
6	PRODUCT	150000	20000	130000	1	6	1
7	PRODUCT	3000000	250000	2750000	1	6	2
8	PRODUCT	750000	100000	650000	1	6	3
\.


                                                                                                                                                                                                          3076.dat                                                                                            0000600 0004000 0002000 00000001127 14650415763 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	2024-07-01 10:00:00	2024-07-07 10:00:00	TRACK123456	BANK	https://picsum.photos/200	PAID	VERIFICATION	2
2	2024-07-02 11:00:00	2024-07-08 11:00:00	TRACK789012	CC	https://picsum.photos/200	PAID	SENDING	2
3	2024-07-03 12:00:00	2024-07-09 12:00:00	\N	BANK	https://picsum.photos/200	UNPAID	VERIFICATION	3
4	2024-07-04 13:00:00	2024-07-10 13:00:00	TRACK345678	CC	https://picsum.photos/200	PAID	SENDING	4
5	2024-07-05 14:00:00	2024-07-11 14:00:00	TRACK901234	BANK	https://picsum.photos/200	PAID	SENT	5
6	2024-07-10 10:00:00	2024-07-15 10:00:00	TRACK567890	CC	https://picsum.photos/200	PAID	SENDING	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                         3074.dat                                                                                            0000600 0004000 0002000 00000000427 14650415763 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Bluetooth Speaker Front View	https://picsum.photos/200	1
2	Smartphone X Overview	https://picsum.photos/200	2
3	Wireless Headphones Side View	https://picsum.photos/200	3
4	Laptop Pro Close-Up	https://picsum.photos/200	4
5	4K Ultra HD TV Display	https://picsum.photos/200	5
\.


                                                                                                                                                                                                                                         3072.dat                                                                                            0000600 0004000 0002000 00000001164 14650415763 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Bluetooth Speaker	bluetooth-speaker	Portable Bluetooth speaker with high quality sound.	150000	20000
2	Smartphone X	smartphone-x	Latest model smartphone with 128GB storage and 8GB RAM.	3000000	250000
3	Wireless Headphones	wireless-headphones	Noise-cancelling wireless headphones with up to 20 hours battery life.	750000	100000
4	Laptop Pro	laptop-pro	High-performance laptop with Intel i7 processor and 16GB RAM.	12000000	1500000
5	4K Ultra HD TV	4k-ultra-hd-tv	50-inch 4K Ultra HD smart TV with HDR support.	5000000	500000
6	Smartwatch Pro	smartwatch-pro	Advanced smartwatch with health tracking features.	500000	100000
\.


                                                                                                                                                                                                                                                                                                                                                                                                            3070.dat                                                                                            0000600 0004000 0002000 00000000253 14650415763 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	Bogor	082345678901	67890	2
3	Bandung	083456789012	23456	3
4	Bekasi	084567890123	34567	4
5	Samarinda	085678901234	45678	5
1	New Address Jakarta	087654321098	54321	1
\.


                                                                                                                                                                                                                                                                                                                                                     3068.dat                                                                                            0000600 0004000 0002000 00000000521 14650415763 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	Hans Jeffrey	hans.jeffrey@example.com	hans	admin#1234	CUSTOMER
3	Zidane Sc	zidane.sc@example.com	zidane	admin#1234	CUSTOMER
4	Saddam Satria	saddam.satria@example.com	saddam	admin#1234	CUSTOMER
5	Citra Dwi	citra.dwi@example.com	citra	admin#1234	CUSTOMER
1	Peter Jack Kambey Updated	peter.updated@example.com	peter	admin#1234	ADMIN
\.


                                                                                                                                                                               restore.sql                                                                                         0000600 0004000 0002000 00000034677 14650415763 0015420 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 13.8 (Debian 13.8-1.pgdg110+1)
-- Dumped by pg_dump version 16.3 (Ubuntu 16.3-1.pgdg22.04+1)

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

DROP DATABASE kelompok15;
--
-- Name: kelompok15; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE kelompok15 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE kelompok15 OWNER TO postgres;

\connect kelompok15

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: OrderItemType; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."OrderItemType" AS ENUM (
    'PRODUCT',
    'EXPEDITION'
);


ALTER TYPE public."OrderItemType" OWNER TO postgres;

--
-- Name: OrderStatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."OrderStatus" AS ENUM (
    'VERIFICATION',
    'SENDING',
    'SENT'
);


ALTER TYPE public."OrderStatus" OWNER TO postgres;

--
-- Name: PaymentMethod; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."PaymentMethod" AS ENUM (
    'BANK',
    'CC'
);


ALTER TYPE public."PaymentMethod" OWNER TO postgres;

--
-- Name: PaymentStatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."PaymentStatus" AS ENUM (
    'UNPAID',
    'PAID',
    'CANCEL'
);


ALTER TYPE public."PaymentStatus" OWNER TO postgres;

--
-- Name: RoleType; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."RoleType" AS ENUM (
    'ADMIN',
    'CUSTOMER'
);


ALTER TYPE public."RoleType" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    id integer NOT NULL,
    type public."OrderItemType" NOT NULL,
    price numeric(10,0) NOT NULL,
    discount numeric(10,0) NOT NULL,
    total_price numeric(10,0) NOT NULL,
    quantity integer DEFAULT 1,
    order_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_items_id_seq
    AS integer
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
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    order_date timestamp without time zone NOT NULL,
    order_expired timestamp without time zone NOT NULL,
    tracking_number character varying(250) DEFAULT NULL::character varying,
    payment_method public."PaymentMethod",
    payment_proof character varying(250) DEFAULT NULL::character varying,
    status public."PaymentStatus" NOT NULL,
    order_status public."OrderStatus" NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
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
-- Name: product_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_images (
    id integer NOT NULL,
    image_title character varying(250) NOT NULL,
    image_path character varying(250) NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.product_images OWNER TO postgres;

--
-- Name: product_images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_images_id_seq OWNER TO postgres;

--
-- Name: product_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_images_id_seq OWNED BY public.product_images.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    title character varying(250) NOT NULL,
    slug character varying(250) NOT NULL,
    description text NOT NULL,
    price numeric(10,0) NOT NULL,
    discount numeric(10,0) NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
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
-- Name: user_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_details (
    id integer NOT NULL,
    address text NOT NULL,
    phone character varying(13) NOT NULL,
    postal_code character varying(5) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.user_details OWNER TO postgres;

--
-- Name: user_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_details_id_seq OWNER TO postgres;

--
-- Name: user_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_details_id_seq OWNED BY public.user_details.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    email character varying(250) NOT NULL,
    username character varying(250) NOT NULL,
    password character varying(50) NOT NULL,
    role public."RoleType" NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
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
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: product_images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images ALTER COLUMN id SET DEFAULT nextval('public.product_images_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: user_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_details ALTER COLUMN id SET DEFAULT nextval('public.user_details_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (id, type, price, discount, total_price, quantity, order_id, product_id) FROM stdin;
\.
COPY public.order_items (id, type, price, discount, total_price, quantity, order_id, product_id) FROM '$$PATH$$/3078.dat';

--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, order_date, order_expired, tracking_number, payment_method, payment_proof, status, order_status, user_id) FROM stdin;
\.
COPY public.orders (id, order_date, order_expired, tracking_number, payment_method, payment_proof, status, order_status, user_id) FROM '$$PATH$$/3076.dat';

--
-- Data for Name: product_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_images (id, image_title, image_path, product_id) FROM stdin;
\.
COPY public.product_images (id, image_title, image_path, product_id) FROM '$$PATH$$/3074.dat';

--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, title, slug, description, price, discount) FROM stdin;
\.
COPY public.products (id, title, slug, description, price, discount) FROM '$$PATH$$/3072.dat';

--
-- Data for Name: user_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_details (id, address, phone, postal_code, user_id) FROM stdin;
\.
COPY public.user_details (id, address, phone, postal_code, user_id) FROM '$$PATH$$/3070.dat';

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, username, password, role) FROM stdin;
\.
COPY public.users (id, name, email, username, password, role) FROM '$$PATH$$/3068.dat';

--
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_items_id_seq', 8, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 6, true);


--
-- Name: product_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_images_id_seq', 5, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 6, true);


--
-- Name: user_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_details_id_seq', 5, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: orders orders_tracking_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_tracking_number_key UNIQUE (tracking_number);


--
-- Name: product_images product_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_images_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: products products_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_slug_key UNIQUE (slug);


--
-- Name: user_details user_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_details
    ADD CONSTRAINT user_details_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: order_items order_items_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- Name: order_items order_items_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: product_images product_images_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_images_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: user_details user_details_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_details
    ADD CONSTRAINT user_details_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
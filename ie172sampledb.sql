PGDMP         1                |            ie172sampledb    13.11    15.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    198695    ie172sampledb    DATABASE     �   CREATE DATABASE ie172sampledb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE ie172sampledb;
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            �           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    4            �            1259    198736    genres    TABLE     �   CREATE TABLE public.genres (
    genre_id integer NOT NULL,
    genre_name character varying(128),
    genre_modified_on timestamp without time zone DEFAULT now(),
    genre_delete_ind boolean DEFAULT false
);
    DROP TABLE public.genres;
       public         heap    postgres    false    4            �            1259    198734    genres_genre_id_seq    SEQUENCE     �   CREATE SEQUENCE public.genres_genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.genres_genre_id_seq;
       public          postgres    false    4    201            �           0    0    genres_genre_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.genres_genre_id_seq OWNED BY public.genres.genre_id;
          public          postgres    false    200            �            1259    198746    movies    TABLE     �   CREATE TABLE public.movies (
    movie_id integer NOT NULL,
    movie_name character varying(256),
    genre_id integer,
    movie_release_date date,
    movie_delete_ind boolean DEFAULT false
);
    DROP TABLE public.movies;
       public         heap    postgres    false    4            �            1259    198744    movies_movie_id_seq    SEQUENCE     �   CREATE SEQUENCE public.movies_movie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.movies_movie_id_seq;
       public          postgres    false    203    4            �           0    0    movies_movie_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.movies_movie_id_seq OWNED BY public.movies.movie_id;
          public          postgres    false    202            (           2604    198739    genres genre_id    DEFAULT     r   ALTER TABLE ONLY public.genres ALTER COLUMN genre_id SET DEFAULT nextval('public.genres_genre_id_seq'::regclass);
 >   ALTER TABLE public.genres ALTER COLUMN genre_id DROP DEFAULT;
       public          postgres    false    200    201    201            +           2604    198749    movies movie_id    DEFAULT     r   ALTER TABLE ONLY public.movies ALTER COLUMN movie_id SET DEFAULT nextval('public.movies_movie_id_seq'::regclass);
 >   ALTER TABLE public.movies ALTER COLUMN movie_id DROP DEFAULT;
       public          postgres    false    203    202    203            �          0    198736    genres 
   TABLE DATA           [   COPY public.genres (genre_id, genre_name, genre_modified_on, genre_delete_ind) FROM stdin;
    public          postgres    false    201   ^       �          0    198746    movies 
   TABLE DATA           f   COPY public.movies (movie_id, movie_name, genre_id, movie_release_date, movie_delete_ind) FROM stdin;
    public          postgres    false    203   �       �           0    0    genres_genre_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.genres_genre_id_seq', 9, true);
          public          postgres    false    200            �           0    0    movies_movie_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.movies_movie_id_seq', 1, false);
          public          postgres    false    202            .           2606    198743    genres genres_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (genre_id);
 <   ALTER TABLE ONLY public.genres DROP CONSTRAINT genres_pkey;
       public            postgres    false    201            0           2606    198752    movies movies_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (movie_id);
 <   ALTER TABLE ONLY public.movies DROP CONSTRAINT movies_pkey;
       public            postgres    false    203            1           2606    198753    movies movies_genre_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES public.genres(genre_id);
 E   ALTER TABLE ONLY public.movies DROP CONSTRAINT movies_genre_id_fkey;
       public          postgres    false    2862    203    201            �   �   x�u�;
1@�:Y�����K'X��A,t �L�6�\.����>���d߈/HU�RN�h��)���٧� bG�GkG�+fV�J�A�D�ݼ+];b�ܑ-�C�*/�T�0h�̃'2 *�"x*g-��b�PTI�      �      x������ � �     
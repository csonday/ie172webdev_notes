PGDMP     '    0            	    |            ie172sampledb    13.7    13.7     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    654770    ie172sampledb    DATABASE     q   CREATE DATABASE ie172sampledb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE ie172sampledb;
                postgres    false            �            1259    654801    genres    TABLE     �   CREATE TABLE public.genres (
    genre_id integer NOT NULL,
    genre_name character varying(128),
    genre_modified_on timestamp without time zone DEFAULT now(),
    genre_delete_ind boolean DEFAULT false
);
    DROP TABLE public.genres;
       public         heap    postgres    false            �            1259    654806    genres_genre_id_seq    SEQUENCE     �   CREATE SEQUENCE public.genres_genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.genres_genre_id_seq;
       public          postgres    false    200            �           0    0    genres_genre_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.genres_genre_id_seq OWNED BY public.genres.genre_id;
          public          postgres    false    201            �            1259    654808    movies    TABLE     �   CREATE TABLE public.movies (
    movie_id integer NOT NULL,
    movie_name character varying(256),
    genre_id integer,
    movie_release_date date,
    movie_delete_ind boolean DEFAULT false
);
    DROP TABLE public.movies;
       public         heap    postgres    false            �            1259    654812    movies_movie_id_seq    SEQUENCE     �   CREATE SEQUENCE public.movies_movie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.movies_movie_id_seq;
       public          postgres    false    202            �           0    0    movies_movie_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.movies_movie_id_seq OWNED BY public.movies.movie_id;
          public          postgres    false    203            *           2604    654814    genres genre_id    DEFAULT     r   ALTER TABLE ONLY public.genres ALTER COLUMN genre_id SET DEFAULT nextval('public.genres_genre_id_seq'::regclass);
 >   ALTER TABLE public.genres ALTER COLUMN genre_id DROP DEFAULT;
       public          postgres    false    201    200            ,           2604    654815    movies movie_id    DEFAULT     r   ALTER TABLE ONLY public.movies ALTER COLUMN movie_id SET DEFAULT nextval('public.movies_movie_id_seq'::regclass);
 >   ALTER TABLE public.movies ALTER COLUMN movie_id DROP DEFAULT;
       public          postgres    false    203    202            �          0    654801    genres 
   TABLE DATA           [   COPY public.genres (genre_id, genre_name, genre_modified_on, genre_delete_ind) FROM stdin;
    public          postgres    false    200   q       �          0    654808    movies 
   TABLE DATA           f   COPY public.movies (movie_id, movie_name, genre_id, movie_release_date, movie_delete_ind) FROM stdin;
    public          postgres    false    202   �       �           0    0    genres_genre_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.genres_genre_id_seq', 3, true);
          public          postgres    false    201            �           0    0    movies_movie_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.movies_movie_id_seq', 1, false);
          public          postgres    false    203            .           2606    654817    genres genres_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (genre_id);
 <   ALTER TABLE ONLY public.genres DROP CONSTRAINT genres_pkey;
       public            postgres    false    200            0           2606    654819    movies movies_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (movie_id);
 <   ALTER TABLE ONLY public.movies DROP CONSTRAINT movies_pkey;
       public            postgres    false    202            1           2606    654820    movies movies_genre_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES public.genres(genre_id);
 E   ALTER TABLE ONLY public.movies DROP CONSTRAINT movies_genre_id_fkey;
       public          postgres    false    200    202    2862            �   T   x�3�tL.����4202�54�50R0��2��22�320�07�L�2�t)J�MĮ������Ș�#��(��*ssKcC��=... �      �      x������ � �     
PGDMP      
                }            RH    17.2    17.2     3           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            4           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            5           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            6           1262    17136    RH    DATABASE     {   CREATE DATABASE "RH" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE "RH";
                     postgres    false            �            1259    17137    funcionarios    TABLE     �   CREATE TABLE public.funcionarios (
    codigo integer NOT NULL,
    nome_func character(100) NOT NULL,
    data_entrada date,
    profissao character varying(100) NOT NULL,
    salario real
);
     DROP TABLE public.funcionarios;
       public         heap r       postgres    false            �            1259    17146    registro_ponto    TABLE     �   CREATE TABLE public.registro_ponto (
    registro_ponto_id integer NOT NULL,
    hora_entrada time without time zone,
    "codFunc" integer NOT NULL,
    entrada date
);
 "   DROP TABLE public.registro_ponto;
       public         heap r       postgres    false            �            1259    17142    view_funcionarios    VIEW     �   CREATE VIEW public.view_funcionarios AS
 SELECT codigo,
    nome_func,
    data_entrada,
    profissao,
    salario
   FROM public.funcionarios;
 $   DROP VIEW public.view_funcionarios;
       public       v       postgres    false    217    217    217    217    217            �            1259    17160    view_funcionarios_new    MATERIALIZED VIEW     �   CREATE MATERIALIZED VIEW public.view_funcionarios_new AS
 SELECT codigo,
    nome_func,
    data_entrada,
    profissao,
    salario
   FROM public.funcionarios
  WITH NO DATA;
 5   DROP MATERIALIZED VIEW public.view_funcionarios_new;
       public         heap m       postgres    false    217    217    217    217    217            �            1259    17156 
   view_ponto    VIEW     �   CREATE VIEW public.view_ponto AS
 SELECT f.codigo,
    f.nome_func,
    f.profissao,
    f.salario,
    rp.hora_entrada,
    rp.entrada
   FROM (public.funcionarios f
     JOIN public.registro_ponto rp ON ((f.codigo = rp."codFunc")));
    DROP VIEW public.view_ponto;
       public       v       postgres    false    217    217    219    219    217    217    219            .          0    17137    funcionarios 
   TABLE DATA           [   COPY public.funcionarios (codigo, nome_func, data_entrada, profissao, salario) FROM stdin;
    public               postgres    false    217   �       /          0    17146    registro_ponto 
   TABLE DATA           ]   COPY public.registro_ponto (registro_ponto_id, hora_entrada, "codFunc", entrada) FROM stdin;
    public               postgres    false    219          �           2606    17141    funcionarios funcionarios_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_pkey PRIMARY KEY (codigo);
 H   ALTER TABLE ONLY public.funcionarios DROP CONSTRAINT funcionarios_pkey;
       public                 postgres    false    217            �           2606    17150 "   registro_ponto registro_ponto_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.registro_ponto
    ADD CONSTRAINT registro_ponto_pkey PRIMARY KEY (registro_ponto_id);
 L   ALTER TABLE ONLY public.registro_ponto DROP CONSTRAINT registro_ponto_pkey;
       public                 postgres    false    219            �           2606    17151    registro_ponto codFuncFK    FK CONSTRAINT     �   ALTER TABLE ONLY public.registro_ponto
    ADD CONSTRAINT "codFuncFK" FOREIGN KEY ("codFunc") REFERENCES public.funcionarios(codigo);
 D   ALTER TABLE ONLY public.registro_ponto DROP CONSTRAINT "codFuncFK";
       public               postgres    false    219    4758    217            0           0    17160    view_funcionarios_new    MATERIALIZED VIEW DATA     8   REFRESH MATERIALIZED VIEW public.view_funcionarios_new;
          public               postgres    false    221    4914            .      x������ � �      /      x������ � �     
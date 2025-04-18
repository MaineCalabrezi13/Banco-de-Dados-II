PGDMP      *                }            hotel    17.2    17.2 &    L           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            M           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            N           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            O           1262    16416    hotel    DATABASE     |   CREATE DATABASE hotel WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE hotel;
                     postgres    false            �            1259    16465    atendimento    TABLE     �   CREATE TABLE public.atendimento (
    id_atendimento integer NOT NULL,
    "id_serviço" integer NOT NULL,
    id_hospedagem integer NOT NULL
);
    DROP TABLE public.atendimento;
       public         heap r       postgres    false            P           0    0    TABLE atendimento    ACL     \   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.atendimento TO gerente WITH GRANT OPTION;
          public               postgres    false    220            �            1259    16530    clientes    TABLE     D  CREATE TABLE public.clientes (
    rg character varying(11) NOT NULL,
    nome character varying(30) NOT NULL,
    sexo character varying(10) NOT NULL,
    telefone character varying(11),
    CONSTRAINT cx_sexo CHECK (((sexo)::text = ANY ((ARRAY['Masculino'::character varying, 'Feminino'::character varying])::text[])))
);
    DROP TABLE public.clientes;
       public         heap r       postgres    false            Q           0    0    TABLE clientes    ACL     G   GRANT SELECT ON TABLE public.clientes TO estagiario WITH GRANT OPTION;
          public               postgres    false    223            �            1259    16435 
   hospedagem    TABLE        CREATE TABLE public.hospedagem (
    id_hospedagem integer NOT NULL,
    cod_rg character varying(11) NOT NULL,
    num_quarto character varying(5) NOT NULL,
    data_entrada date NOT NULL,
    data_saida date,
    status character varying(30) NOT NULL
);
    DROP TABLE public.hospedagem;
       public         heap r       postgres    false            R           0    0    TABLE hospedagem    ACL     [   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.hospedagem TO gerente WITH GRANT OPTION;
          public               postgres    false    218            �            1259    16450    quarto    TABLE     �   CREATE TABLE public.quarto (
    num_quarto character varying(5) NOT NULL,
    andar character varying(10),
    id_tipo integer NOT NULL,
    status character varying(30) NOT NULL
);
    DROP TABLE public.quarto;
       public         heap r       postgres    false            S           0    0    TABLE quarto    ACL     W   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.quarto TO gerente WITH GRANT OPTION;
          public               postgres    false    219            �            1259    16425    reserva    TABLE     3  CREATE TABLE public.reserva (
    id_reserva integer NOT NULL,
    dt_reserva character varying(30) NOT NULL,
    qtd_dias integer NOT NULL,
    data_entrada date NOT NULL,
    status character varying(30) NOT NULL,
    cod_rg character varying(11) NOT NULL,
    num_quarto character varying(5) NOT NULL
);
    DROP TABLE public.reserva;
       public         heap r       postgres    false            T           0    0    TABLE reserva    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.reserva TO gerente WITH GRANT OPTION;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.reserva TO atendente WITH GRANT OPTION;
          public               postgres    false    217            �            1259    16475    servico    TABLE     �   CREATE TABLE public.servico (
    "id_serviço" integer NOT NULL,
    descricao character varying NOT NULL,
    valor numeric(15,3) NOT NULL
);
    DROP TABLE public.servico;
       public         heap r       postgres    false            U           0    0    TABLE servico    ACL     X   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.servico TO gerente WITH GRANT OPTION;
          public               postgres    false    221            �            1259    16499    tipo_quarto    TABLE     �   CREATE TABLE public.tipo_quarto (
    id_tipo integer NOT NULL,
    descricao character varying NOT NULL,
    valor numeric(15,3) NOT NULL
);
    DROP TABLE public.tipo_quarto;
       public         heap r       postgres    false            V           0    0    TABLE tipo_quarto    ACL     \   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tipo_quarto TO gerente WITH GRANT OPTION;
          public               postgres    false    222            F          0    16465    atendimento 
   TABLE DATA           S   COPY public.atendimento (id_atendimento, "id_serviço", id_hospedagem) FROM stdin;
    public               postgres    false    220   &-       I          0    16530    clientes 
   TABLE DATA           <   COPY public.clientes (rg, nome, sexo, telefone) FROM stdin;
    public               postgres    false    223   C-       D          0    16435 
   hospedagem 
   TABLE DATA           i   COPY public.hospedagem (id_hospedagem, cod_rg, num_quarto, data_entrada, data_saida, status) FROM stdin;
    public               postgres    false    218   `-       E          0    16450    quarto 
   TABLE DATA           D   COPY public.quarto (num_quarto, andar, id_tipo, status) FROM stdin;
    public               postgres    false    219   }-       C          0    16425    reserva 
   TABLE DATA           m   COPY public.reserva (id_reserva, dt_reserva, qtd_dias, data_entrada, status, cod_rg, num_quarto) FROM stdin;
    public               postgres    false    217   �-       G          0    16475    servico 
   TABLE DATA           B   COPY public.servico ("id_serviço", descricao, valor) FROM stdin;
    public               postgres    false    221   �-       H          0    16499    tipo_quarto 
   TABLE DATA           @   COPY public.tipo_quarto (id_tipo, descricao, valor) FROM stdin;
    public               postgres    false    222   �-       �           2606    16469    atendimento atendimento_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.atendimento
    ADD CONSTRAINT atendimento_pkey PRIMARY KEY (id_atendimento);
 F   ALTER TABLE ONLY public.atendimento DROP CONSTRAINT atendimento_pkey;
       public                 postgres    false    220            �           2606    16535    clientes clientes_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (rg);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public                 postgres    false    223            �           2606    16439    hospedagem hospedagem_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.hospedagem
    ADD CONSTRAINT hospedagem_pkey PRIMARY KEY (id_hospedagem);
 D   ALTER TABLE ONLY public.hospedagem DROP CONSTRAINT hospedagem_pkey;
       public                 postgres    false    218            �           2606    16454    quarto quarto_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.quarto
    ADD CONSTRAINT quarto_pkey PRIMARY KEY (num_quarto);
 <   ALTER TABLE ONLY public.quarto DROP CONSTRAINT quarto_pkey;
       public                 postgres    false    219            �           2606    16429    reserva reserva_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_pkey PRIMARY KEY (id_reserva);
 >   ALTER TABLE ONLY public.reserva DROP CONSTRAINT reserva_pkey;
       public                 postgres    false    217            �           2606    16481    servico servico_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.servico
    ADD CONSTRAINT servico_pkey PRIMARY KEY ("id_serviço");
 >   ALTER TABLE ONLY public.servico DROP CONSTRAINT servico_pkey;
       public                 postgres    false    221            �           2606    16505    tipo_quarto tipo_quarto_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.tipo_quarto
    ADD CONSTRAINT tipo_quarto_pkey PRIMARY KEY (id_tipo);
 F   ALTER TABLE ONLY public.tipo_quarto DROP CONSTRAINT tipo_quarto_pkey;
       public                 postgres    false    222            �           2606    16470 *   atendimento atendimento_id_hospedagem_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.atendimento
    ADD CONSTRAINT atendimento_id_hospedagem_fkey FOREIGN KEY (id_hospedagem) REFERENCES public.hospedagem(id_hospedagem);
 T   ALTER TABLE ONLY public.atendimento DROP CONSTRAINT atendimento_id_hospedagem_fkey;
       public               postgres    false    220    4769    218            �           2606    16482 (   atendimento atendimento_id_serviço_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.atendimento
    ADD CONSTRAINT "atendimento_id_serviço_fkey" FOREIGN KEY ("id_serviço") REFERENCES public.servico("id_serviço") NOT VALID;
 T   ALTER TABLE ONLY public.atendimento DROP CONSTRAINT "atendimento_id_serviço_fkey";
       public               postgres    false    4775    221    220            �           2606    16536 !   hospedagem hospedagem_cod_rg_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.hospedagem
    ADD CONSTRAINT hospedagem_cod_rg_fkey FOREIGN KEY (cod_rg) REFERENCES public.clientes(rg) NOT VALID;
 K   ALTER TABLE ONLY public.hospedagem DROP CONSTRAINT hospedagem_cod_rg_fkey;
       public               postgres    false    4779    223    218            �           2606    16460 %   hospedagem hospedagem_num_quarto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.hospedagem
    ADD CONSTRAINT hospedagem_num_quarto_fkey FOREIGN KEY (num_quarto) REFERENCES public.quarto(num_quarto) NOT VALID;
 O   ALTER TABLE ONLY public.hospedagem DROP CONSTRAINT hospedagem_num_quarto_fkey;
       public               postgres    false    218    4771    219            �           2606    16541    reserva reserva_cod_rg_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_cod_rg_fkey FOREIGN KEY (cod_rg) REFERENCES public.clientes(rg) NOT VALID;
 E   ALTER TABLE ONLY public.reserva DROP CONSTRAINT reserva_cod_rg_fkey;
       public               postgres    false    223    4779    217            �           2606    16455    reserva reserva_num_quarto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_num_quarto_fkey FOREIGN KEY (num_quarto) REFERENCES public.quarto(num_quarto) NOT VALID;
 I   ALTER TABLE ONLY public.reserva DROP CONSTRAINT reserva_num_quarto_fkey;
       public               postgres    false    4771    217    219            F      x������ � �      I      x������ � �      D      x������ � �      E      x������ � �      C      x������ � �      G      x������ � �      H      x������ � �     
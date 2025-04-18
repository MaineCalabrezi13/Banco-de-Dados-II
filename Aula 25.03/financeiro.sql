PGDMP                      }         
   financeiro    17.2    17.2     Y           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            Z           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            [           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            \           1262    16549 
   financeiro    DATABASE     �   CREATE DATABASE financeiro WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE financeiro;
                     postgres    false                        3079    16570    pg_trgm 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;
    DROP EXTENSION pg_trgm;
                        false            ]           0    0    EXTENSION pg_trgm    COMMENT     e   COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';
                             false    2            �            1259    16550    clientes    TABLE       CREATE TABLE public.clientes (
    id integer NOT NULL,
    nome character varying(100),
    email character varying(100),
    telefone character varying(20),
    cidade character varying(50),
    estado "char",
    datacadastro date,
    cnpj character(15)
);
    DROP TABLE public.clientes;
       public         heap r       postgres    false            �            1259    16556    contas_a_receber    TABLE     #  CREATE TABLE public.contas_a_receber (
    id integer NOT NULL,
    parcela_atual integer NOT NULL,
    cliente_id integer,
    descricao text NOT NULL,
    valor numeric(10,2) NOT NULL,
    data_nascimento date NOT NULL,
    status character varying(20),
    data_pagamento date,
    CONSTRAINT contas_a_receber_parcela_atual_check CHECK ((parcela_atual > 0)),
    CONSTRAINT contas_a_receber_status_check CHECK (((status)::text = ANY ((ARRAY['Pendente'::character varying, 'Pago'::character varying, 'Vencido'::character varying])::text[])))
);
 $   DROP TABLE public.contas_a_receber;
       public         heap r       postgres    false            U          0    16550    clientes 
   TABLE DATA           a   COPY public.clientes (id, nome, email, telefone, cidade, estado, datacadastro, cnpj) FROM stdin;
    public               postgres    false    218   �       V          0    16556    contas_a_receber 
   TABLE DATA           �   COPY public.contas_a_receber (id, parcela_atual, cliente_id, descricao, valor, data_nascimento, status, data_pagamento) FROM stdin;
    public               postgres    false    219   �       �           2606    16554    clientes clientes_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public                 postgres    false    218            �           2606    16564 &   contas_a_receber contas_a_receber_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.contas_a_receber
    ADD CONSTRAINT contas_a_receber_pkey PRIMARY KEY (id, parcela_atual);
 P   ALTER TABLE ONLY public.contas_a_receber DROP CONSTRAINT contas_a_receber_pkey;
       public                 postgres    false    219    219            �           1259    16555    idx_cliente    INDEX     @   CREATE INDEX idx_cliente ON public.clientes USING btree (nome);
    DROP INDEX public.idx_cliente;
       public                 postgres    false    218            �           1259    16653    idx_cnpj_unico    INDEX     J   CREATE UNIQUE INDEX idx_cnpj_unico ON public.clientes USING btree (cnpj);
 "   DROP INDEX public.idx_cnpj_unico;
       public                 postgres    false    218            �           1259    16652    idx_conta_data_valor    INDEX     c   CREATE INDEX idx_conta_data_valor ON public.contas_a_receber USING btree (data_nascimento, valor);
 (   DROP INDEX public.idx_conta_data_valor;
       public                 postgres    false    219    219            �           1259    16651    idx_conta_texto    INDEX     c   CREATE INDEX idx_conta_texto ON public.contas_a_receber USING gin (descricao public.gin_trgm_ops);
 #   DROP INDEX public.idx_conta_texto;
       public                 postgres    false    219    2    2    2    2    2    2    2    2    2    2    2    2            �           2606    16565 1   contas_a_receber contas_a_receber_cliente_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.contas_a_receber
    ADD CONSTRAINT contas_a_receber_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES public.clientes(id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.contas_a_receber DROP CONSTRAINT contas_a_receber_cliente_id_fkey;
       public               postgres    false    4796    219    218            U   7  x�}�Mr�6F׭S��"��],e�˞��$�lZ��E.Pt��6NV��j����A� ��f�Oe?�D���`��RM���¡ac�O⌲
���E��I��U��m�`<��(�1`<N�,/�(be�8���T�k�Ӝ9�E	[����R+�z.��Ɇ�f�*�{�Ah�e��*|�a���E��_��_U}���1��q�$��*�G��_+����&�j��'`�i���=g'`�ij؜���Q�`��E5�jB��a�������'-��%K�2Î�`����5�G��yHaEiN�1쐮��4�=9��sCN�"s����
6�� h��FiN�	�ҹ�t������b��Z��`��Z�Z�@er�������� ���e`�ei�Y�J�k�o����<"�l��9{@gt�5��xv	�L�V,������4-Y7�bsx�yع����yrp"Y4c^�g�U{a.��������s���u��>�ɐ�>���=�&/��8�Q�Wʒ�=���Uw�k��X?�q�k��	���5^�tn�6_qu�J�w�Sz�ENRF"��Rz�v&�6-ͤs�F�_���"��(��Rx���U���!�PR��鸒�FMw ђ8�y�2�|l{��6�G
W4}ă����H$M���,�Mս��q����w�~ARu�\�����SV�c�����{����L�C^��t7���ȳh�*+a�[w�{���]:I�A�WM�mz�%y4�Gp۽說�g�����a?{2a����FK�	�A��r+�b��
��*$����=�����X���ż�Nfr�g���AF/&�ӝlD%��>�ai�����j���"*���	PU�M�A���p�`�蜜kl�TMB���jr��O���}�2�^������S�"#��gTF� ke���G�yG�/��&��������9|�ލ���j4^^�9g&M�y�d����w�f�W�������;5]��)��62y5y9�
�G�-��y�D_��
C5��9%��L�#W��ƺX�#'�)��D��ı]���p�Z�:Q�      V   �  x��V;��0��S��G�#�	R���%�`"�I9An��*U���eFZ��.L�7o�<Y$_��AN��*�ʝ��y9���y�i��*��<����xȱN��T��1āio�Q�~�O2(D �ڷ{�V�pr���|�t8�s�8�"�U"��uh��t������M
R2FuZ!�*�����r���G�ODː��2�,���M����QrX��Y?Mש�ZkP����<]��n����\�&nP�i��Z����35��r�(Z�P�u)��9?���j�	W�۪%r�g~۟r��N���0dNq��A��:��!����T����+�����T��U��3z�?%�kC6_%C4uZL���.�x1��EHj�YFS����]p���uȠc@UL��)Է5�:���A��6l!ת��T4ī��g}\?�������E{)���0i�nu2�.xS�@��EG@�5��4��7��i�#�.n �>ܱ�����%�� �=P��xW.k� �k`O�p;�0��(�,�ae
1���~��S��J;�톡Ŗ�]<�����@��t�ұ̇&�>T<��7�9d�>�@�3f.�m���c���6{'�a��0S�\�z��@և��?���9Ͷb�CK�q׿���{��^[�`���zy
�~�n��$z蘋�T��V�l��z\�l�>َ�gYV�<=�i����     
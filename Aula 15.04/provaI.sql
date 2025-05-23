PGDMP  1    0                }            provaI    16.3    16.3 1    !           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            "           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            #           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            $           1262    26171    provaI    DATABASE        CREATE DATABASE "provaI" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE "provaI";
                postgres    false            �            1259    26172 
   categorias    TABLE     q   CREATE TABLE public.categorias (
    cat_codigo integer NOT NULL,
    cat_nome character varying(50) NOT NULL
);
    DROP TABLE public.categorias;
       public         heap    postgres    false            %           0    0    TABLE categorias    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.categorias TO ceo WITH GRANT OPTION;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.categorias TO suprimento WITH GRANT OPTION;
          public          postgres    false    215            �            1259    26182    cidades    TABLE     �   CREATE TABLE public.cidades (
    cid_cep character varying(9) NOT NULL,
    cid_nome character varying(50) NOT NULL,
    cid_estado character(2) NOT NULL
);
    DROP TABLE public.cidades;
       public         heap    postgres    false            &           0    0    TABLE cidades    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.cidades TO ceo WITH GRANT OPTION;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.cidades TO suprimento WITH GRANT OPTION;
          public          postgres    false    217            �            1259    26212    entrada    TABLE     �   CREATE TABLE public.entrada (
    ent_codigo integer NOT NULL,
    ent_data date NOT NULL,
    ent_hora time with time zone NOT NULL
);
    DROP TABLE public.entrada;
       public         heap    postgres    false            '           0    0    TABLE entrada    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.entrada TO ceo WITH GRANT OPTION;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.entrada TO suprimento WITH GRANT OPTION;
          public          postgres    false    220            �            1259    26187 
   fornecedor    TABLE       CREATE TABLE public.fornecedor (
    for_codigo integer NOT NULL,
    cid_cep character varying(9) NOT NULL,
    for_nome character varying(50) NOT NULL,
    for_telefone character varying(15) NOT NULL,
    for_celular character varying(15) NOT NULL,
    for_email character varying(50) NOT NULL,
    for_cnpj character varying(15) NOT NULL,
    for_sexo character varying(15) NOT NULL,
    for_rua character varying(50) NOT NULL,
    for_numero character varying(5) NOT NULL,
    for_bairro character varying(50) NOT NULL
);
    DROP TABLE public.fornecedor;
       public         heap    postgres    false            (           0    0    TABLE fornecedor    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.fornecedor TO ceo WITH GRANT OPTION;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.fornecedor TO suprimento WITH GRANT OPTION;
          public          postgres    false    218            �            1259    26232    itens_entrada    TABLE     �  CREATE TABLE public.itens_entrada (
    pro_codigo integer NOT NULL,
    ent_codigo integer NOT NULL,
    for_codigo integer NOT NULL,
    pro_preco_venda numeric(15,3) NOT NULL,
    pro_preco_compra numeric(15,3) NOT NULL,
    pro_icms numeric(16,2) NOT NULL,
    pro_preco_ent_c_icms numeric(15,3) NOT NULL,
    ent_quatidade numeric(15,3) NOT NULL,
    ent_preco_total numeric(15,3) NOT NULL
);
 !   DROP TABLE public.itens_entrada;
       public         heap    postgres    false            )           0    0    TABLE itens_entrada    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.itens_entrada TO ceo WITH GRANT OPTION;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.itens_entrada TO suprimento WITH GRANT OPTION;
          public          postgres    false    222            �            1259    26217    itens_venda    TABLE     �   CREATE TABLE public.itens_venda (
    pro_codigo integer NOT NULL,
    ven_codigo integer NOT NULL,
    ven_quatidade numeric(15,3) NOT NULL,
    ven_preco_unitario numeric(15,3) NOT NULL,
    ven_preco_total numeric(15,3) NOT NULL
);
    DROP TABLE public.itens_venda;
       public         heap    postgres    false            *           0    0    TABLE itens_venda    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.itens_venda TO ceo WITH GRANT OPTION;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.itens_venda TO comercial WITH GRANT OPTION;
          public          postgres    false    221            �            1259    26197    produtos    TABLE     �  CREATE TABLE public.produtos (
    pro_codigo integer NOT NULL,
    for_codigo integer NOT NULL,
    cat_codigo integer NOT NULL,
    pro_nome character varying(50) NOT NULL,
    pro_foto character varying(50) NOT NULL,
    pro_qnt numeric(15,3) NOT NULL,
    pro_barra character varying(15) NOT NULL,
    pro_quant_min_estoque numeric(15,3) NOT NULL,
    codigo_pro character varying(15) NOT NULL,
    pro_preco numeric(15,3)
);
    DROP TABLE public.produtos;
       public         heap    postgres    false            +           0    0    TABLE produtos    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.produtos TO ceo WITH GRANT OPTION;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.produtos TO suprimento WITH GRANT OPTION;
          public          postgres    false    219            �            1259    26177    venda    TABLE     �   CREATE TABLE public.venda (
    ven_codigo integer NOT NULL,
    ven_data date NOT NULL,
    ven_hora time with time zone NOT NULL
);
    DROP TABLE public.venda;
       public         heap    postgres    false            ,           0    0    TABLE venda    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.venda TO ceo WITH GRANT OPTION;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.venda TO comercial WITH GRANT OPTION;
          public          postgres    false    216                      0    26172 
   categorias 
   TABLE DATA           :   COPY public.categorias (cat_codigo, cat_nome) FROM stdin;
    public          postgres    false    215   �<                 0    26182    cidades 
   TABLE DATA           @   COPY public.cidades (cid_cep, cid_nome, cid_estado) FROM stdin;
    public          postgres    false    217   \=                 0    26212    entrada 
   TABLE DATA           A   COPY public.entrada (ent_codigo, ent_data, ent_hora) FROM stdin;
    public          postgres    false    220   2>                 0    26187 
   fornecedor 
   TABLE DATA           �   COPY public.fornecedor (for_codigo, cid_cep, for_nome, for_telefone, for_celular, for_email, for_cnpj, for_sexo, for_rua, for_numero, for_bairro) FROM stdin;
    public          postgres    false    218   �>                 0    26232    itens_entrada 
   TABLE DATA           �   COPY public.itens_entrada (pro_codigo, ent_codigo, for_codigo, pro_preco_venda, pro_preco_compra, pro_icms, pro_preco_ent_c_icms, ent_quatidade, ent_preco_total) FROM stdin;
    public          postgres    false    222   qA                 0    26217    itens_venda 
   TABLE DATA           q   COPY public.itens_venda (pro_codigo, ven_codigo, ven_quatidade, ven_preco_unitario, ven_preco_total) FROM stdin;
    public          postgres    false    221   <B                 0    26197    produtos 
   TABLE DATA           �   COPY public.produtos (pro_codigo, for_codigo, cat_codigo, pro_nome, pro_foto, pro_qnt, pro_barra, pro_quant_min_estoque, codigo_pro, pro_preco) FROM stdin;
    public          postgres    false    219   �B                 0    26177    venda 
   TABLE DATA           ?   COPY public.venda (ven_codigo, ven_data, ven_hora) FROM stdin;
    public          postgres    false    216   �E       l           2606    26176    categorias categorias_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (cat_codigo);
 D   ALTER TABLE ONLY public.categorias DROP CONSTRAINT categorias_pkey;
       public            postgres    false    215            r           2606    26186    cidades cidades_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.cidades
    ADD CONSTRAINT cidades_pkey PRIMARY KEY (cid_cep);
 >   ALTER TABLE ONLY public.cidades DROP CONSTRAINT cidades_pkey;
       public            postgres    false    217            y           2606    26216    entrada entrada_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.entrada
    ADD CONSTRAINT entrada_pkey PRIMARY KEY (ent_codigo);
 >   ALTER TABLE ONLY public.entrada DROP CONSTRAINT entrada_pkey;
       public            postgres    false    220            t           2606    26191    fornecedor fornecedor_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.fornecedor
    ADD CONSTRAINT fornecedor_pkey PRIMARY KEY (for_codigo);
 D   ALTER TABLE ONLY public.fornecedor DROP CONSTRAINT fornecedor_pkey;
       public            postgres    false    218                       2606    26236     itens_entrada itens_entrada_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.itens_entrada
    ADD CONSTRAINT itens_entrada_pkey PRIMARY KEY (pro_codigo, ent_codigo);
 J   ALTER TABLE ONLY public.itens_entrada DROP CONSTRAINT itens_entrada_pkey;
       public            postgres    false    222    222            |           2606    26221    itens_venda itens_venda_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.itens_venda
    ADD CONSTRAINT itens_venda_pkey PRIMARY KEY (pro_codigo, ven_codigo);
 F   ALTER TABLE ONLY public.itens_venda DROP CONSTRAINT itens_venda_pkey;
       public            postgres    false    221    221            w           2606    26201    produtos produtos_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_pkey PRIMARY KEY (pro_codigo);
 @   ALTER TABLE ONLY public.produtos DROP CONSTRAINT produtos_pkey;
       public            postgres    false    219            p           2606    26181    venda venda_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.venda
    ADD CONSTRAINT venda_pkey PRIMARY KEY (ven_codigo);
 :   ALTER TABLE ONLY public.venda DROP CONSTRAINT venda_pkey;
       public            postgres    false    216            }           1259    26262 
   idx_codigo    INDEX     J   CREATE INDEX idx_codigo ON public.itens_entrada USING btree (for_codigo);
    DROP INDEX public.idx_codigo;
       public            postgres    false    222            z           1259    26263    idx_data    INDEX     @   CREATE INDEX idx_data ON public.entrada USING btree (ent_data);
    DROP INDEX public.idx_data;
       public            postgres    false    220            n           1259    26264    idx_datahota    INDEX     L   CREATE INDEX idx_datahota ON public.venda USING btree (ven_data, ven_hora);
     DROP INDEX public.idx_datahota;
       public            postgres    false    216    216            m           1259    26265    idx_nome_cat    INDEX     N   CREATE UNIQUE INDEX idx_nome_cat ON public.categorias USING btree (cat_nome);
     DROP INDEX public.idx_nome_cat;
       public            postgres    false    215            u           1259    26266    idx_nome_pro    INDEX     L   CREATE UNIQUE INDEX idx_nome_pro ON public.produtos USING btree (pro_nome);
     DROP INDEX public.idx_nome_pro;
       public            postgres    false    219            �           2606    26207    produtos cat_pro    FK CONSTRAINT     �   ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT cat_pro FOREIGN KEY (cat_codigo) REFERENCES public.categorias(cat_codigo) NOT VALID;
 :   ALTER TABLE ONLY public.produtos DROP CONSTRAINT cat_pro;
       public          postgres    false    219    215    4716            �           2606    26192    fornecedor for_cid    FK CONSTRAINT     x   ALTER TABLE ONLY public.fornecedor
    ADD CONSTRAINT for_cid FOREIGN KEY (cid_cep) REFERENCES public.cidades(cid_cep);
 <   ALTER TABLE ONLY public.fornecedor DROP CONSTRAINT for_cid;
       public          postgres    false    4722    217    218            �           2606    26202    produtos for_pro    FK CONSTRAINT        ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT for_pro FOREIGN KEY (for_codigo) REFERENCES public.fornecedor(for_codigo);
 :   ALTER TABLE ONLY public.produtos DROP CONSTRAINT for_pro;
       public          postgres    false    219    218    4724            �           2606    26242    itens_entrada inten_pro    FK CONSTRAINT     �   ALTER TABLE ONLY public.itens_entrada
    ADD CONSTRAINT inten_pro FOREIGN KEY (pro_codigo) REFERENCES public.produtos(pro_codigo) NOT VALID;
 A   ALTER TABLE ONLY public.itens_entrada DROP CONSTRAINT inten_pro;
       public          postgres    false    219    4727    222            �           2606    26237    itens_entrada ite_for    FK CONSTRAINT     �   ALTER TABLE ONLY public.itens_entrada
    ADD CONSTRAINT ite_for FOREIGN KEY (for_codigo) REFERENCES public.fornecedor(for_codigo) NOT VALID;
 ?   ALTER TABLE ONLY public.itens_entrada DROP CONSTRAINT ite_for;
       public          postgres    false    222    4724    218            �           2606    26227    itens_venda item_venda    FK CONSTRAINT     �   ALTER TABLE ONLY public.itens_venda
    ADD CONSTRAINT item_venda FOREIGN KEY (ven_codigo) REFERENCES public.venda(ven_codigo) NOT VALID;
 @   ALTER TABLE ONLY public.itens_venda DROP CONSTRAINT item_venda;
       public          postgres    false    216    221    4720            �           2606    26247    itens_entrada iten_entrada    FK CONSTRAINT     �   ALTER TABLE ONLY public.itens_entrada
    ADD CONSTRAINT iten_entrada FOREIGN KEY (ent_codigo) REFERENCES public.entrada(ent_codigo) NOT VALID;
 D   ALTER TABLE ONLY public.itens_entrada DROP CONSTRAINT iten_entrada;
       public          postgres    false    220    4729    222            �           2606    26222    itens_venda iten_pro    FK CONSTRAINT     �   ALTER TABLE ONLY public.itens_venda
    ADD CONSTRAINT iten_pro FOREIGN KEY (pro_codigo) REFERENCES public.produtos(pro_codigo) NOT VALID;
 >   ALTER TABLE ONLY public.itens_venda DROP CONSTRAINT iten_pro;
       public          postgres    false    219    4727    221               ~   x��;�0E�zf1��$�$*�4yB#9N;)�� ;��b��{:8m�cxA%ZK�%�����]��0
���-��>3��M:81��!��c��JS��Qg����?��bN�����3O*�)w         �   x�=�=n�@F�Sp���I��qd		A�f"o�҆�p��J�*G�bYb%�{�~�Y
���C�Vf�Է�rD���ir��Y�Rw�-�mtho�&��M��Rs��=�� ���С�"��w����ܫP�q�O{�W�h�}�0wZk��ۛPud�<�؁d�lؘ���d�|���XY��}|&����ލ�W����?
sA]         d   x�U��� г�bf0jI�uD3̕7��@j�"�tV
4�
D�� &\n3a+�\g�H��V�+P�� Mdt�?�]f�
�~�Wޮ_�}oȽ��C,�         �  x�e��n�0���S�b���n�S��n\��%�!@�)y��t:d*�tՋ�(۱�N>@����#p�����'�;�����C�~X���XB�8$��,�<ϲ4�ʶvv^�����l�@�2I����D��s�9=�=[��V-}�b�9O8�cxЖ�4{�:���Xı�IB�X��
��Qs����*�}��ZXfl��k$�k��
��b$Ar!�,8��������;]!Hq$ON��} �y���F���cX)��Ǧ٭�*Wc� /J����Q��o�Û�Ⱦ��2br�SyacG���f�ێ�#<���iܛ/&x̖�V�-�Oy�&J����i_�Nwz�l��W��8`���I�'�|�*���)8�L<���Պ�ۃj��G��w�;��@I;�v��;�<'�_�T^�"�'���c���Cz�|}�:L���D�&�D�0��r�=�¶�B�Q� E*e�ӗ"�ϟ�ړp��S|�a��h�)Y(��V�è���N�xN�4�b��ݴ��'\<��6>Ѕ����m=Ǔ�@1��W�^�ȏH���KȲ���?F���:n92�C���i��r�F3�*�B;�_N��M�\�t�b��v4�<��B��cQ'IH�����ko��lcM?���H
����r:�'J"��[������r��J��5��]w�j|��YE-q         �   x�}��� C��0	��]n�9.s�?'W� �:����?^+1���[ڣ�h�M����(,�%����n,�%]�ђ������?� ���ԗ���ފ w �4$�3}ވs���s�AK�Kn�+gF��#�I�(dY}��<3��|7�4�wn@�[F�S�x͇bй�[B���W,v�1O�����[Y�         q   x�M���0�7�A�	���_G��K�ǎ4 �73��-+"�i��X���bH'�di��h,��2�2~{ɽd�x	Ζ�N�_�!.�;J��(�b~�J)Fl�_����V�-�         �  x�e�[��0�������q�	�Ri`Z��TUB&�@Z��	Ӫ��ڇ.�K`c=����/�/��������ʕ�?ɪ9J����z܂O�G)�$�|�QL���f���X�e��Z�'�l��m'�P�9a����P(�C���b4F	�!3 ]K���@�\�;%�䴁E}X�k�e1G	�����h_p��1��Ct�Y�&(!��a�c/�������P���1��x�GlEf.]C^���SJ��~�OPY����ct�9�K��3/�� ]C~hN���YT��g�K{�$��u��P������kUR�3������1�a�=V�Bl�b����A��;�l^l,ښC���#끲L��45Ž��'����ĉ�ѩRMw��	4��ޱ�a��f����&3y>	r�u���e���1D�R��no�c���AmV���Z���.�[^L
謻V��}�n\v���"ˍ÷��ɶ�"������{2-�g�Yh�a��~HBǵ�d�����*�3��������w�aC����8��;ђR58�8�8��Z��}�n��9C��ڧ��'��}�]������Q1$/$���I1�
^c8Ȅ���U���y	�ፇ����Fe.;���i"�N
¢x�,�u������NM�:�M����(R�����A9�:���#� %Ȯ��:�i��O�����k��;v�ї�4��_��`���t         c   x�U���0�s�KQ����s�P��k�l+Sˮѡ%��]����|��Q��`��{� h����	.pF%��(�8iU����ozȽ���u,�     
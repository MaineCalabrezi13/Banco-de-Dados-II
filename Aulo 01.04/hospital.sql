PGDMP  4    
                }            hospital    16.3    16.3 +    (           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            )           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            *           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            +           1262    26055    hospital    DATABASE        CREATE DATABASE hospital WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE hospital;
                postgres    false            �            1259    26108    alas    TABLE     �   CREATE TABLE public.alas (
    idala integer NOT NULL,
    idhospital integer NOT NULL,
    nome character varying(50) NOT NULL
);
    DROP TABLE public.alas;
       public         heap    postgres    false            �            1259    26133    atendimento    TABLE     2  CREATE TABLE public.atendimento (
    idatendimento integer NOT NULL,
    data date NOT NULL,
    hora time with time zone NOT NULL,
    valor numeric(15,3) NOT NULL,
    idplano integer NOT NULL,
    status character varying(15) NOT NULL,
    idmedico integer NOT NULL,
    idpaciente integer NOT NULL
);
    DROP TABLE public.atendimento;
       public         heap    postgres    false            �            1259    26102    enfermeiras    TABLE     7  CREATE TABLE public.enfermeiras (
    idenfermeiro integer NOT NULL,
    nome character varying(50) NOT NULL,
    chefe character(3) NOT NULL,
    cre character(6) NOT NULL,
    idchefe integer,
    idala integer NOT NULL,
    CONSTRAINT ck_chefe CHECK ((chefe = ANY (ARRAY['Sim'::bpchar, 'Não'::bpchar])))
);
    DROP TABLE public.enfermeiras;
       public         heap    postgres    false            �            1259    26071    especialidade    TABLE     u   CREATE TABLE public.especialidade (
    idespecialidade integer NOT NULL,
    nome character varying(50) NOT NULL
);
 !   DROP TABLE public.especialidade;
       public         heap    postgres    false            �            1259    26056    hospital    TABLE     �   CREATE TABLE public.hospital (
    idhospital integer NOT NULL,
    nome character varying(50) NOT NULL,
    cnpj character varying(15) NOT NULL
);
    DROP TABLE public.hospital;
       public         heap    postgres    false            �            1259    26076    medicos    TABLE     �   CREATE TABLE public.medicos (
    idmedico integer NOT NULL,
    nome character varying(50) NOT NULL,
    crm character varying(10) NOT NULL,
    idespecialidade integer NOT NULL
);
    DROP TABLE public.medicos;
       public         heap    postgres    false            �            1259    26128 	   pacientes    TABLE     �   CREATE TABLE public.pacientes (
    idpaciente integer NOT NULL,
    nome character varying(50) NOT NULL,
    datanascimento date NOT NULL,
    telefone character varying(15) NOT NULL
);
    DROP TABLE public.pacientes;
       public         heap    postgres    false            �            1259    26087    planomedico    TABLE     a   CREATE TABLE public.planomedico (
    idplano integer NOT NULL,
    idmedico integer NOT NULL
);
    DROP TABLE public.planomedico;
       public         heap    postgres    false            �            1259    26061 
   planosaude    TABLE     �   CREATE TABLE public.planosaude (
    idplano integer NOT NULL,
    nome character varying(50) NOT NULL,
    telefone character varying(15) NOT NULL,
    idhospital integer NOT NULL
);
    DROP TABLE public.planosaude;
       public         heap    postgres    false            #          0    26108    alas 
   TABLE DATA           7   COPY public.alas (idala, idhospital, nome) FROM stdin;
    public          postgres    false    221   44       %          0    26133    atendimento 
   TABLE DATA           n   COPY public.atendimento (idatendimento, data, hora, valor, idplano, status, idmedico, idpaciente) FROM stdin;
    public          postgres    false    223   �4       "          0    26102    enfermeiras 
   TABLE DATA           U   COPY public.enfermeiras (idenfermeiro, nome, chefe, cre, idchefe, idala) FROM stdin;
    public          postgres    false    220   R5                 0    26071    especialidade 
   TABLE DATA           >   COPY public.especialidade (idespecialidade, nome) FROM stdin;
    public          postgres    false    217   J6                 0    26056    hospital 
   TABLE DATA           :   COPY public.hospital (idhospital, nome, cnpj) FROM stdin;
    public          postgres    false    215   �6                  0    26076    medicos 
   TABLE DATA           G   COPY public.medicos (idmedico, nome, crm, idespecialidade) FROM stdin;
    public          postgres    false    218   97       $          0    26128 	   pacientes 
   TABLE DATA           O   COPY public.pacientes (idpaciente, nome, datanascimento, telefone) FROM stdin;
    public          postgres    false    222   8       !          0    26087    planomedico 
   TABLE DATA           8   COPY public.planomedico (idplano, idmedico) FROM stdin;
    public          postgres    false    219   09                 0    26061 
   planosaude 
   TABLE DATA           I   COPY public.planosaude (idplano, nome, telefone, idhospital) FROM stdin;
    public          postgres    false    216   y9                  2606    26112    alas alas_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.alas
    ADD CONSTRAINT alas_pkey PRIMARY KEY (idala);
 8   ALTER TABLE ONLY public.alas DROP CONSTRAINT alas_pkey;
       public            postgres    false    221            �           2606    26137    atendimento atendimento_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.atendimento
    ADD CONSTRAINT atendimento_pkey PRIMARY KEY (idatendimento);
 F   ALTER TABLE ONLY public.atendimento DROP CONSTRAINT atendimento_pkey;
       public            postgres    false    223            p           2606    26153    atendimento ck_status    CHECK CONSTRAINT     �   ALTER TABLE public.atendimento
    ADD CONSTRAINT ck_status CHECK (((status)::text = ANY ((ARRAY['Aberto'::character varying, 'Atendido'::character varying])::text[]))) NOT VALID;
 :   ALTER TABLE public.atendimento DROP CONSTRAINT ck_status;
       public          postgres    false    223    223            }           2606    26107    enfermeiras enfermeiras_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.enfermeiras
    ADD CONSTRAINT enfermeiras_pkey PRIMARY KEY (idenfermeiro);
 F   ALTER TABLE ONLY public.enfermeiras DROP CONSTRAINT enfermeiras_pkey;
       public            postgres    false    220            w           2606    26075     especialidade especialidade_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.especialidade
    ADD CONSTRAINT especialidade_pkey PRIMARY KEY (idespecialidade);
 J   ALTER TABLE ONLY public.especialidade DROP CONSTRAINT especialidade_pkey;
       public            postgres    false    217            r           2606    26060    hospital hospital_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.hospital
    ADD CONSTRAINT hospital_pkey PRIMARY KEY (idhospital);
 @   ALTER TABLE ONLY public.hospital DROP CONSTRAINT hospital_pkey;
       public            postgres    false    215            y           2606    26080    medicos medicos_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.medicos
    ADD CONSTRAINT medicos_pkey PRIMARY KEY (idmedico);
 >   ALTER TABLE ONLY public.medicos DROP CONSTRAINT medicos_pkey;
       public            postgres    false    218            �           2606    26132    pacientes pacientes_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.pacientes
    ADD CONSTRAINT pacientes_pkey PRIMARY KEY (idpaciente);
 B   ALTER TABLE ONLY public.pacientes DROP CONSTRAINT pacientes_pkey;
       public            postgres    false    222            {           2606    26091    planomedico planomedico_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.planomedico
    ADD CONSTRAINT planomedico_pkey PRIMARY KEY (idplano, idmedico);
 F   ALTER TABLE ONLY public.planomedico DROP CONSTRAINT planomedico_pkey;
       public            postgres    false    219    219            u           2606    26065    planosaude planosaude_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.planosaude
    ADD CONSTRAINT planosaude_pkey PRIMARY KEY (idplano);
 D   ALTER TABLE ONLY public.planosaude DROP CONSTRAINT planosaude_pkey;
       public            postgres    false    216            s           1259    26086    idx_unique_cnpj    INDEX     K   CREATE UNIQUE INDEX idx_unique_cnpj ON public.hospital USING btree (cnpj);
 #   DROP INDEX public.idx_unique_cnpj;
       public            postgres    false    215            �           2606    26113    alas alas_idhospital_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.alas
    ADD CONSTRAINT alas_idhospital_fkey FOREIGN KEY (idhospital) REFERENCES public.hospital(idhospital);
 C   ALTER TABLE ONLY public.alas DROP CONSTRAINT alas_idhospital_fkey;
       public          postgres    false    4722    221    215            �           2606    26118    enfermeiras fk_ala_enf    FK CONSTRAINT        ALTER TABLE ONLY public.enfermeiras
    ADD CONSTRAINT fk_ala_enf FOREIGN KEY (idala) REFERENCES public.alas(idala) NOT VALID;
 @   ALTER TABLE ONLY public.enfermeiras DROP CONSTRAINT fk_ala_enf;
       public          postgres    false    221    220    4735            �           2606    26143 !   atendimento fk_atendimento_medico    FK CONSTRAINT     �   ALTER TABLE ONLY public.atendimento
    ADD CONSTRAINT fk_atendimento_medico FOREIGN KEY (idmedico) REFERENCES public.medicos(idmedico) NOT VALID;
 K   ALTER TABLE ONLY public.atendimento DROP CONSTRAINT fk_atendimento_medico;
       public          postgres    false    223    218    4729            �           2606    26138 #   atendimento fk_atendimento_paciente    FK CONSTRAINT     �   ALTER TABLE ONLY public.atendimento
    ADD CONSTRAINT fk_atendimento_paciente FOREIGN KEY (idpaciente) REFERENCES public.pacientes(idpaciente) NOT VALID;
 M   ALTER TABLE ONLY public.atendimento DROP CONSTRAINT fk_atendimento_paciente;
       public          postgres    false    222    4737    223            �           2606    26148     atendimento fk_atendimento_plano    FK CONSTRAINT     �   ALTER TABLE ONLY public.atendimento
    ADD CONSTRAINT fk_atendimento_plano FOREIGN KEY (idplano) REFERENCES public.planosaude(idplano) NOT VALID;
 J   ALTER TABLE ONLY public.atendimento DROP CONSTRAINT fk_atendimento_plano;
       public          postgres    false    4725    223    216            �           2606    26123    enfermeiras fk_enf_chefe    FK CONSTRAINT     �   ALTER TABLE ONLY public.enfermeiras
    ADD CONSTRAINT fk_enf_chefe FOREIGN KEY (idchefe) REFERENCES public.enfermeiras(idenfermeiro) NOT VALID;
 B   ALTER TABLE ONLY public.enfermeiras DROP CONSTRAINT fk_enf_chefe;
       public          postgres    false    220    4733    220            �           2606    26081    medicos fk_especialidade    FK CONSTRAINT     �   ALTER TABLE ONLY public.medicos
    ADD CONSTRAINT fk_especialidade FOREIGN KEY (idespecialidade) REFERENCES public.especialidade(idespecialidade);
 B   ALTER TABLE ONLY public.medicos DROP CONSTRAINT fk_especialidade;
       public          postgres    false    218    217    4727            �           2606    26097    planomedico medico_plano    FK CONSTRAINT     �   ALTER TABLE ONLY public.planomedico
    ADD CONSTRAINT medico_plano FOREIGN KEY (idmedico) REFERENCES public.medicos(idmedico);
 B   ALTER TABLE ONLY public.planomedico DROP CONSTRAINT medico_plano;
       public          postgres    false    4729    218    219            �           2606    26066    planosaude plano_hospital    FK CONSTRAINT     �   ALTER TABLE ONLY public.planosaude
    ADD CONSTRAINT plano_hospital FOREIGN KEY (idhospital) REFERENCES public.hospital(idhospital);
 C   ALTER TABLE ONLY public.planosaude DROP CONSTRAINT plano_hospital;
       public          postgres    false    215    216    4722            �           2606    26092    planomedico plano_medico    FK CONSTRAINT     �   ALTER TABLE ONLY public.planomedico
    ADD CONSTRAINT plano_medico FOREIGN KEY (idplano) REFERENCES public.planosaude(idplano);
 B   ALTER TABLE ONLY public.planomedico DROP CONSTRAINT plano_medico;
       public          postgres    false    4725    216    219            #   L   x�3�4�t�ITHIUpN,J����O�L�2B����� �� ��"��	B�=3/5j�)B�/��*���� �!�      %   �   x����
�0���ΫH��n���|O�gA|�Am�`����'t(��'��Yt=���*�u�vR.����h/��_͏��n�kj���vq���v:IB4����d�(A����.R�ںv
�EԠ���v��u�޵ګ�����4J�}P��4���A����	L��M��<��M�3�7>���      "   �   x�U�9n�0E��S���ŲK[��9B`�nFi�b�\'G��2b
3-�_�Gbo(�m�"�zF{9�ĵ�.0=���|�?Z@2,ђ�(��Aig^F^ᑌV�xWfT��^�酨q���z2����F�t��r��HYk���o���.|h���7k~)�xV\�������h���iX�-��߀]��aҴ�ޒ��R�O�Q�~g	����Ӭ��|�IT\���pj�         r   x�5�K�@Cמ� ʟ5����M�	(R;�4��V��lW��e�A�Bi��\?�W�G�S��PK�>ZG��F���-����4��t�|縹���M�8�����7)�<7)�)�2�         ]   x�3���/.�,I�QN�+IT�)��L�4426153��4 ����T^����_|x%������������e�P������_�ȉ0������ �? �          �   x�-�Mj�0����)��򿗭K(%�����l�
d�HQ�SN��յ����	xs����b��a�\��b�m�S��T��P`�)g4�Sl��IK(��z�ΰY��J�WPa�O��`,��U�%a56�xU�i��o�l�r���Fi�#��bˏ��Q����~�ޥq�$}�������x�C�"�����������8����;C�?L>U�      $     x�E�Aj�0������I��e�"�4$�n�c�@��lg���(�X�I����3���ss����k�,��g���4��C��}�es��z�'ʶ��>����4�?�;dFC�D�����Bs��D�JFvBt�jṬ���D�Ϡn	���4^Knv�6ƫ�o�҃	r^�p\�jZ}c�Ӽ�j$�l
���ʵ��%o���+5�D+�5I�1���C��İVL�2��96�<|��j�?n��I)��^`      !   9   x�ʱ� ��+��_T����5�l�U���G�>M-��1bĈ#F��q_I��
         �   x�5�=�0Fg�0�I�8[1� BB0�DM�H�A�p'���pZu����}��ۘ� �sB*Ԇ@T�!�Z2��ه��e�YKd��o��7�ίIBH�;�)��"j�l8��'�uZ)Us��4��C\L]�%����8��%a+�����6M�-N�*�5�b��ND��]UU�L;�     
PGDMP                      }            hospital    17.2    17.2 7    e           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            f           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            g           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            h           1262    16778    hospital    DATABASE        CREATE DATABASE hospital WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE hospital;
                     postgres    false            i           0    0    DATABASE hospital    ACL     +   GRANT ALL ON DATABASE hospital TO gerente;
                        postgres    false    4968            �            1259    16779    alas    TABLE     �   CREATE TABLE public.alas (
    idala integer NOT NULL,
    idhospital integer NOT NULL,
    nome character varying(50) NOT NULL
);
    DROP TABLE public.alas;
       public         heap r       postgres    false            j           0    0 
   TABLE alas    ACL     B   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.alas TO chefes;
          public               postgres    false    217            �            1259    16782    atendimento    TABLE     2  CREATE TABLE public.atendimento (
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
       public         heap r       postgres    false            k           0    0    TABLE atendimento    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.atendimento TO chefes;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.atendimento TO atendente;
          public               postgres    false    218            �            1259    16785    enfermeiras    TABLE     7  CREATE TABLE public.enfermeiras (
    idenfermeiro integer NOT NULL,
    nome character varying(50) NOT NULL,
    chefe character(3) NOT NULL,
    cre character(6) NOT NULL,
    idchefe integer,
    idala integer NOT NULL,
    CONSTRAINT ck_chefe CHECK ((chefe = ANY (ARRAY['Sim'::bpchar, 'Não'::bpchar])))
);
    DROP TABLE public.enfermeiras;
       public         heap r       postgres    false            l           0    0    TABLE enfermeiras    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.enfermeiras TO chefes;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.enfermeiras TO atendente;
          public               postgres    false    219            �            1259    16789    especialidade    TABLE     u   CREATE TABLE public.especialidade (
    idespecialidade integer NOT NULL,
    nome character varying(50) NOT NULL
);
 !   DROP TABLE public.especialidade;
       public         heap r       postgres    false            m           0    0    TABLE especialidade    ACL     N   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.especialidade TO atendente;
          public               postgres    false    220            �            1259    16792    hospital    TABLE     �   CREATE TABLE public.hospital (
    idhospital integer NOT NULL,
    nome character varying(50) NOT NULL,
    cnpj character varying(15) NOT NULL
);
    DROP TABLE public.hospital;
       public         heap r       postgres    false            �            1259    16795    medicos    TABLE     �   CREATE TABLE public.medicos (
    idmedico integer NOT NULL,
    nome character varying(50) NOT NULL,
    crm character varying(10) NOT NULL,
    idespecialidade integer NOT NULL
);
    DROP TABLE public.medicos;
       public         heap r       postgres    false            n           0    0    TABLE medicos    ACL     H   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.medicos TO atendente;
          public               postgres    false    222            �            1259    16798 	   pacientes    TABLE     �   CREATE TABLE public.pacientes (
    idpaciente integer NOT NULL,
    nome character varying(50) NOT NULL,
    datanascimento date NOT NULL,
    telefone character varying(15) NOT NULL
);
    DROP TABLE public.pacientes;
       public         heap r       postgres    false            o           0    0    TABLE pacientes    ACL     J   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.pacientes TO atendente;
          public               postgres    false    223            �            1259    16801    planomedico    TABLE     a   CREATE TABLE public.planomedico (
    idplano integer NOT NULL,
    idmedico integer NOT NULL
);
    DROP TABLE public.planomedico;
       public         heap r       postgres    false            �            1259    16804 
   planosaude    TABLE     �   CREATE TABLE public.planosaude (
    idplano integer NOT NULL,
    nome character varying(50) NOT NULL,
    telefone character varying(15) NOT NULL,
    idhospital integer NOT NULL
);
    DROP TABLE public.planosaude;
       public         heap r       postgres    false            Z          0    16779    alas 
   TABLE DATA           7   COPY public.alas (idala, idhospital, nome) FROM stdin;
    public               postgres    false    217   !@       [          0    16782    atendimento 
   TABLE DATA           n   COPY public.atendimento (idatendimento, data, hora, valor, idplano, status, idmedico, idpaciente) FROM stdin;
    public               postgres    false    218   }@       \          0    16785    enfermeiras 
   TABLE DATA           U   COPY public.enfermeiras (idenfermeiro, nome, chefe, cre, idchefe, idala) FROM stdin;
    public               postgres    false    219   ?A       ]          0    16789    especialidade 
   TABLE DATA           >   COPY public.especialidade (idespecialidade, nome) FROM stdin;
    public               postgres    false    220   7B       ^          0    16792    hospital 
   TABLE DATA           :   COPY public.hospital (idhospital, nome, cnpj) FROM stdin;
    public               postgres    false    221   �B       _          0    16795    medicos 
   TABLE DATA           G   COPY public.medicos (idmedico, nome, crm, idespecialidade) FROM stdin;
    public               postgres    false    222   &C       `          0    16798 	   pacientes 
   TABLE DATA           O   COPY public.pacientes (idpaciente, nome, datanascimento, telefone) FROM stdin;
    public               postgres    false    223   D       a          0    16801    planomedico 
   TABLE DATA           8   COPY public.planomedico (idplano, idmedico) FROM stdin;
    public               postgres    false    224   E       b          0    16804 
   planosaude 
   TABLE DATA           I   COPY public.planosaude (idplano, nome, telefone, idhospital) FROM stdin;
    public               postgres    false    225   fE       �           2606    16808    alas alas_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.alas
    ADD CONSTRAINT alas_pkey PRIMARY KEY (idala);
 8   ALTER TABLE ONLY public.alas DROP CONSTRAINT alas_pkey;
       public                 postgres    false    217            �           2606    16810    atendimento atendimento_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.atendimento
    ADD CONSTRAINT atendimento_pkey PRIMARY KEY (idatendimento);
 F   ALTER TABLE ONLY public.atendimento DROP CONSTRAINT atendimento_pkey;
       public                 postgres    false    218            �           2606    16811    atendimento ck_status    CHECK CONSTRAINT     �   ALTER TABLE public.atendimento
    ADD CONSTRAINT ck_status CHECK (((status)::text = ANY (ARRAY[('Aberto'::character varying)::text, ('Atendido'::character varying)::text]))) NOT VALID;
 :   ALTER TABLE public.atendimento DROP CONSTRAINT ck_status;
       public               postgres    false    218    218            �           2606    16813    enfermeiras enfermeiras_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.enfermeiras
    ADD CONSTRAINT enfermeiras_pkey PRIMARY KEY (idenfermeiro);
 F   ALTER TABLE ONLY public.enfermeiras DROP CONSTRAINT enfermeiras_pkey;
       public                 postgres    false    219            �           2606    16815     especialidade especialidade_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.especialidade
    ADD CONSTRAINT especialidade_pkey PRIMARY KEY (idespecialidade);
 J   ALTER TABLE ONLY public.especialidade DROP CONSTRAINT especialidade_pkey;
       public                 postgres    false    220            �           2606    16817    hospital hospital_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.hospital
    ADD CONSTRAINT hospital_pkey PRIMARY KEY (idhospital);
 @   ALTER TABLE ONLY public.hospital DROP CONSTRAINT hospital_pkey;
       public                 postgres    false    221            �           2606    16819    medicos medicos_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.medicos
    ADD CONSTRAINT medicos_pkey PRIMARY KEY (idmedico);
 >   ALTER TABLE ONLY public.medicos DROP CONSTRAINT medicos_pkey;
       public                 postgres    false    222            �           2606    16821    pacientes pacientes_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.pacientes
    ADD CONSTRAINT pacientes_pkey PRIMARY KEY (idpaciente);
 B   ALTER TABLE ONLY public.pacientes DROP CONSTRAINT pacientes_pkey;
       public                 postgres    false    223            �           2606    16823    planomedico planomedico_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.planomedico
    ADD CONSTRAINT planomedico_pkey PRIMARY KEY (idplano, idmedico);
 F   ALTER TABLE ONLY public.planomedico DROP CONSTRAINT planomedico_pkey;
       public                 postgres    false    224    224            �           2606    16825    planosaude planosaude_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.planosaude
    ADD CONSTRAINT planosaude_pkey PRIMARY KEY (idplano);
 D   ALTER TABLE ONLY public.planosaude DROP CONSTRAINT planosaude_pkey;
       public                 postgres    false    225            �           1259    16826    idx_unique_cnpj    INDEX     K   CREATE UNIQUE INDEX idx_unique_cnpj ON public.hospital USING btree (cnpj);
 #   DROP INDEX public.idx_unique_cnpj;
       public                 postgres    false    221            �           1259    16893    idxcre    INDEX     D   CREATE UNIQUE INDEX idxcre ON public.enfermeiras USING btree (cre);
    DROP INDEX public.idxcre;
       public                 postgres    false    219            �           1259    16892    idxcrm    INDEX     @   CREATE UNIQUE INDEX idxcrm ON public.medicos USING btree (crm);
    DROP INDEX public.idxcrm;
       public                 postgres    false    222            �           1259    16896    idxdatahora    INDEX     I   CREATE INDEX idxdatahora ON public.atendimento USING btree (data, hora);
    DROP INDEX public.idxdatahora;
       public                 postgres    false    218    218            �           1259    16894    idxnome    INDEX     E   CREATE UNIQUE INDEX idxnome ON public.planosaude USING btree (nome);
    DROP INDEX public.idxnome;
       public                 postgres    false    225            �           1259    16895    idxnomepaciente    INDEX     E   CREATE INDEX idxnomepaciente ON public.pacientes USING btree (nome);
 #   DROP INDEX public.idxnomepaciente;
       public                 postgres    false    223            �           2606    16827    alas alas_idhospital_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.alas
    ADD CONSTRAINT alas_idhospital_fkey FOREIGN KEY (idhospital) REFERENCES public.hospital(idhospital);
 C   ALTER TABLE ONLY public.alas DROP CONSTRAINT alas_idhospital_fkey;
       public               postgres    false    217    221    4786            �           2606    16832    enfermeiras fk_ala_enf    FK CONSTRAINT        ALTER TABLE ONLY public.enfermeiras
    ADD CONSTRAINT fk_ala_enf FOREIGN KEY (idala) REFERENCES public.alas(idala) NOT VALID;
 @   ALTER TABLE ONLY public.enfermeiras DROP CONSTRAINT fk_ala_enf;
       public               postgres    false    4776    217    219            �           2606    16837 !   atendimento fk_atendimento_medico    FK CONSTRAINT     �   ALTER TABLE ONLY public.atendimento
    ADD CONSTRAINT fk_atendimento_medico FOREIGN KEY (idmedico) REFERENCES public.medicos(idmedico) NOT VALID;
 K   ALTER TABLE ONLY public.atendimento DROP CONSTRAINT fk_atendimento_medico;
       public               postgres    false    218    222    4790            �           2606    16842 #   atendimento fk_atendimento_paciente    FK CONSTRAINT     �   ALTER TABLE ONLY public.atendimento
    ADD CONSTRAINT fk_atendimento_paciente FOREIGN KEY (idpaciente) REFERENCES public.pacientes(idpaciente) NOT VALID;
 M   ALTER TABLE ONLY public.atendimento DROP CONSTRAINT fk_atendimento_paciente;
       public               postgres    false    223    218    4793            �           2606    16847     atendimento fk_atendimento_plano    FK CONSTRAINT     �   ALTER TABLE ONLY public.atendimento
    ADD CONSTRAINT fk_atendimento_plano FOREIGN KEY (idplano) REFERENCES public.planosaude(idplano) NOT VALID;
 J   ALTER TABLE ONLY public.atendimento DROP CONSTRAINT fk_atendimento_plano;
       public               postgres    false    218    4798    225            �           2606    16852    enfermeiras fk_enf_chefe    FK CONSTRAINT     �   ALTER TABLE ONLY public.enfermeiras
    ADD CONSTRAINT fk_enf_chefe FOREIGN KEY (idchefe) REFERENCES public.enfermeiras(idenfermeiro) NOT VALID;
 B   ALTER TABLE ONLY public.enfermeiras DROP CONSTRAINT fk_enf_chefe;
       public               postgres    false    219    4781    219            �           2606    16857    medicos fk_especialidade    FK CONSTRAINT     �   ALTER TABLE ONLY public.medicos
    ADD CONSTRAINT fk_especialidade FOREIGN KEY (idespecialidade) REFERENCES public.especialidade(idespecialidade);
 B   ALTER TABLE ONLY public.medicos DROP CONSTRAINT fk_especialidade;
       public               postgres    false    220    222    4784            �           2606    16862    planomedico medico_plano    FK CONSTRAINT     �   ALTER TABLE ONLY public.planomedico
    ADD CONSTRAINT medico_plano FOREIGN KEY (idmedico) REFERENCES public.medicos(idmedico);
 B   ALTER TABLE ONLY public.planomedico DROP CONSTRAINT medico_plano;
       public               postgres    false    224    4790    222            �           2606    16867    planosaude plano_hospital    FK CONSTRAINT     �   ALTER TABLE ONLY public.planosaude
    ADD CONSTRAINT plano_hospital FOREIGN KEY (idhospital) REFERENCES public.hospital(idhospital);
 C   ALTER TABLE ONLY public.planosaude DROP CONSTRAINT plano_hospital;
       public               postgres    false    225    221    4786            �           2606    16872    planomedico plano_medico    FK CONSTRAINT     �   ALTER TABLE ONLY public.planomedico
    ADD CONSTRAINT plano_medico FOREIGN KEY (idplano) REFERENCES public.planosaude(idplano);
 B   ALTER TABLE ONLY public.planomedico DROP CONSTRAINT plano_medico;
       public               postgres    false    224    4798    225            Z   L   x�3�4�t�ITHIUpN,J����O�L�2B����� �� ��"��	B�=3/5j�)B�/��*���� �!�      [   �   x����
�0���ΫH��n���|O�gA|�Am�`����'t(��'��Yt=���*�u�vR.����h/��_͏��n�kj���vq���v:IB4����d�(A����.R�ںv
�EԠ���v��u�޵ګ�����4J�}P��4���A����	L��M��<��M�3�7>���      \   �   x�U�9n�0E��S���ŲK[��9B`�nFi�b�\'G��2b
3-�_�Gbo(�m�"�zF{9�ĵ�.0=���|�?Z@2,ђ�(��Aig^F^ᑌV�xWfT��^�酨q���z2����F�t��r��HYk���o���.|h���7k~)�xV\�������h���iX�-��߀]��aҴ�ޒ��R�O�Q�~g	����Ӭ��|�IT\���pj�      ]   r   x�5�K�@Cמ� ʟ5����M�	(R;�4��V��lW��e�A�Bi��\?�W�G�S��PK�>ZG��F���-����4��t�|縹���M�8�����7)�<7)�)�2�      ^   ]   x�3���/.�,I�QN�+IT�)��L�4426153��4 ����T^����_|x%������������e�P������_�ȉ0������ �? �      _   �   x�-�Mj�0����)��򿗭K(%�����l�
d�HQ�SN��յ����	xs����b��a�\��b�m�S��T��P`�)g4�Sl��IK(��z�ΰY��J�WPa�O��`,��U�%a56�xU�i��o�l�r���Fi�#��bˏ��Q����~�ޥq�$}�������x�C�"�����������8����;C�?L>U�      `     x�E�Aj�0������I��e�"�4$�n�c�@��lg���(�X�I����3���ss����k�,��g���4��C��}�es��z�'ʶ��>����4�?�;dFC�D�����Bs��D�JFvBt�jṬ���D�Ϡn	���4^Knv�6ƫ�o�҃	r^�p\�jZ}c�Ӽ�j$�l
���ʵ��%o���+5�D+�5I�1���C��İVL�2��96�<|��j�?n��I)��^`      a   9   x�ʱ� ��+��_T����5�l�U���G�>M-��1bĈ#F��q_I��
      b   �   x�5�=�0Fg�0�I�8[1� BB0�DM�H�A�p'���pZu����}��ۘ� �sB*Ԇ@T�!�Z2��ه��e�YKd��o��7�ίIBH�;�)��"j�l8��'�uZ)Us��4��C\L]�%����8��%a+�����6M�-N�*�5�b��ND��]UU�L;�     
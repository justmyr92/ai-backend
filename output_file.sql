PGDMP      7    	             }         	   commision    16.0    16.0 T    B           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            C           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            D           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            E           1262    43476 	   commision    DATABASE     �   CREATE DATABASE commision WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Philippines.1252';
    DROP DATABASE commision;
                postgres    false            �            1259    68613    annual_reports    TABLE     �   CREATE TABLE public.annual_reports (
    annual_id integer NOT NULL,
    year character varying(4) NOT NULL,
    file_path text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 "   DROP TABLE public.annual_reports;
       public         heap    postgres    false            �            1259    68612    annual_reports_annual_id_seq    SEQUENCE     �   CREATE SEQUENCE public.annual_reports_annual_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.annual_reports_annual_id_seq;
       public          postgres    false    229            F           0    0    annual_reports_annual_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.annual_reports_annual_id_seq OWNED BY public.annual_reports.annual_id;
          public          postgres    false    228            �            1259    43484    campus    TABLE     �   CREATE TABLE public.campus (
    campus_id character varying(50) NOT NULL,
    name character varying(50),
    is_extension boolean
);
    DROP TABLE public.campus;
       public         heap    postgres    false            �            1259    68837    csd_notification    TABLE     �   CREATE TABLE public.csd_notification (
    notif_id integer NOT NULL,
    notification_message text NOT NULL,
    date_received timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    user_id character varying(50) NOT NULL
);
 $   DROP TABLE public.csd_notification;
       public         heap    postgres    false            �            1259    68836    csd_notification_notif_id_seq    SEQUENCE     �   CREATE SEQUENCE public.csd_notification_notif_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.csd_notification_notif_id_seq;
       public          postgres    false    234            G           0    0    csd_notification_notif_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.csd_notification_notif_id_seq OWNED BY public.csd_notification.notif_id;
          public          postgres    false    233            �            1259    43477 
   csd_office    TABLE       CREATE TABLE public.csd_office (
    user_id character varying(50) NOT NULL,
    role integer DEFAULT 0,
    name character varying(100),
    email character varying(100),
    password character varying(100),
    CONSTRAINT csd_office_role_check CHECK ((role = ANY (ARRAY[0, 1, 2])))
);
    DROP TABLE public.csd_office;
       public         heap    postgres    false            �            1259    43605    evidence    TABLE     �   CREATE TABLE public.evidence (
    evidence_id character varying(50) NOT NULL,
    name text,
    type character varying(70),
    section_id character varying(50),
    record_id character varying(50)
);
    DROP TABLE public.evidence;
       public         heap    postgres    false            �            1259    43527    formula_per_instrument    TABLE     �   CREATE TABLE public.formula_per_instrument (
    formula_id character varying(50) NOT NULL,
    formula text,
    instrument_id character varying(50)
);
 *   DROP TABLE public.formula_per_instrument;
       public         heap    postgres    false            �            1259    43551    formula_per_section    TABLE     �   CREATE TABLE public.formula_per_section (
    formula_id character varying(50) NOT NULL,
    formula text,
    section_id character varying(50)
);
 '   DROP TABLE public.formula_per_section;
       public         heap    postgres    false            �            1259    43515 
   instrument    TABLE     q  CREATE TABLE public.instrument (
    instrument_id character varying(50) NOT NULL,
    section_no character varying(10),
    sdg_subtitle text,
    sdg_id character varying(50),
    status character varying(10),
    CONSTRAINT instrument_status_check CHECK (((status)::text = ANY (ARRAY[('active'::character varying)::text, ('inactive'::character varying)::text])))
);
    DROP TABLE public.instrument;
       public         heap    postgres    false            �            1259    43575    options    TABLE     �   CREATE TABLE public.options (
    option_id character varying(50) NOT NULL,
    option text,
    question_id character varying(50)
);
    DROP TABLE public.options;
       public         heap    postgres    false            �            1259    43563    question    TABLE     �   CREATE TABLE public.question (
    question_id character varying(50) NOT NULL,
    question text,
    type character varying(20),
    suffix character varying(20),
    section_id character varying(50),
    sub_id character varying(50)
);
    DROP TABLE public.question;
       public         heap    postgres    false            �            1259    43587    records    TABLE     Z  CREATE TABLE public.records (
    record_id character varying(50) NOT NULL,
    user_id character varying(50),
    status integer DEFAULT 1,
    date_submitted timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    sdg_id character varying(50),
    year integer,
    CONSTRAINT records_status_check CHECK ((status = ANY (ARRAY[1, 2, 3])))
);
    DROP TABLE public.records;
       public         heap    postgres    false            �            1259    43622    records_values    TABLE     �   CREATE TABLE public.records_values (
    record_value_id character varying(50) NOT NULL,
    value character varying(50),
    question_id character varying(50),
    record_id character varying(50),
    campus_id character varying(255)
);
 "   DROP TABLE public.records_values;
       public         heap    postgres    false            �            1259    68812    sd_notification    TABLE     �   CREATE TABLE public.sd_notification (
    notif_id integer NOT NULL,
    notification_message text NOT NULL,
    date_received timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    user_id character varying(50) NOT NULL
);
 #   DROP TABLE public.sd_notification;
       public         heap    postgres    false            �            1259    68811    sd_notification_notif_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sd_notification_notif_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.sd_notification_notif_id_seq;
       public          postgres    false    232            H           0    0    sd_notification_notif_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.sd_notification_notif_id_seq OWNED BY public.sd_notification.notif_id;
          public          postgres    false    231            �            1259    43489 	   sd_office    TABLE     B  CREATE TABLE public.sd_office (
    user_id character varying(50) NOT NULL,
    role integer DEFAULT 1,
    name character varying(100),
    email character varying(100),
    password character varying(100),
    campus_id character varying(50),
    CONSTRAINT sd_office_role_check CHECK ((role = ANY (ARRAY[0, 1, 2])))
);
    DROP TABLE public.sd_office;
       public         heap    postgres    false            �            1259    43501    sdg    TABLE     �   CREATE TABLE public.sdg (
    sdg_id character varying(50) NOT NULL,
    title character varying(50),
    number integer,
    description text
);
    DROP TABLE public.sdg;
       public         heap    postgres    false            �            1259    43539    section    TABLE     �   CREATE TABLE public.section (
    section_id character varying(50) NOT NULL,
    content_no character varying(10),
    section_content text,
    instrument_id character varying(50)
);
    DROP TABLE public.section;
       public         heap    postgres    false            �            1259    68791    user_otp    TABLE     �   CREATE TABLE public.user_otp (
    user_id character varying(50) NOT NULL,
    otp character varying(60) NOT NULL,
    expiration timestamp without time zone NOT NULL
);
    DROP TABLE public.user_otp;
       public         heap    postgres    false            `           2604    68616    annual_reports annual_id    DEFAULT     �   ALTER TABLE ONLY public.annual_reports ALTER COLUMN annual_id SET DEFAULT nextval('public.annual_reports_annual_id_seq'::regclass);
 G   ALTER TABLE public.annual_reports ALTER COLUMN annual_id DROP DEFAULT;
       public          postgres    false    228    229    229            d           2604    68840    csd_notification notif_id    DEFAULT     �   ALTER TABLE ONLY public.csd_notification ALTER COLUMN notif_id SET DEFAULT nextval('public.csd_notification_notif_id_seq'::regclass);
 H   ALTER TABLE public.csd_notification ALTER COLUMN notif_id DROP DEFAULT;
       public          postgres    false    233    234    234            b           2604    68815    sd_notification notif_id    DEFAULT     �   ALTER TABLE ONLY public.sd_notification ALTER COLUMN notif_id SET DEFAULT nextval('public.sd_notification_notif_id_seq'::regclass);
 G   ALTER TABLE public.sd_notification ALTER COLUMN notif_id DROP DEFAULT;
       public          postgres    false    232    231    232            :          0    68613    annual_reports 
   TABLE DATA           P   COPY public.annual_reports (annual_id, year, file_path, created_at) FROM stdin;
    public          postgres    false    229   Jk       -          0    43484    campus 
   TABLE DATA           ?   COPY public.campus (campus_id, name, is_extension) FROM stdin;
    public          postgres    false    216   �k       ?          0    68837    csd_notification 
   TABLE DATA           b   COPY public.csd_notification (notif_id, notification_message, date_received, user_id) FROM stdin;
    public          postgres    false    234   �l       ,          0    43477 
   csd_office 
   TABLE DATA           J   COPY public.csd_office (user_id, role, name, email, password) FROM stdin;
    public          postgres    false    215   �l       7          0    43605    evidence 
   TABLE DATA           R   COPY public.evidence (evidence_id, name, type, section_id, record_id) FROM stdin;
    public          postgres    false    226   4m       1          0    43527    formula_per_instrument 
   TABLE DATA           T   COPY public.formula_per_instrument (formula_id, formula, instrument_id) FROM stdin;
    public          postgres    false    220   Qm       3          0    43551    formula_per_section 
   TABLE DATA           N   COPY public.formula_per_section (formula_id, formula, section_id) FROM stdin;
    public          postgres    false    222   nm       0          0    43515 
   instrument 
   TABLE DATA           ]   COPY public.instrument (instrument_id, section_no, sdg_subtitle, sdg_id, status) FROM stdin;
    public          postgres    false    219   #z       5          0    43575    options 
   TABLE DATA           A   COPY public.options (option_id, option, question_id) FROM stdin;
    public          postgres    false    224   �~       4          0    43563    question 
   TABLE DATA           [   COPY public.question (question_id, question, type, suffix, section_id, sub_id) FROM stdin;
    public          postgres    false    223   2�       6          0    43587    records 
   TABLE DATA           [   COPY public.records (record_id, user_id, status, date_submitted, sdg_id, year) FROM stdin;
    public          postgres    false    225   ��       8          0    43622    records_values 
   TABLE DATA           c   COPY public.records_values (record_value_id, value, question_id, record_id, campus_id) FROM stdin;
    public          postgres    false    227   ��       =          0    68812    sd_notification 
   TABLE DATA           a   COPY public.sd_notification (notif_id, notification_message, date_received, user_id) FROM stdin;
    public          postgres    false    232   ʘ       .          0    43489 	   sd_office 
   TABLE DATA           T   COPY public.sd_office (user_id, role, name, email, password, campus_id) FROM stdin;
    public          postgres    false    217   �       /          0    43501    sdg 
   TABLE DATA           A   COPY public.sdg (sdg_id, title, number, description) FROM stdin;
    public          postgres    false    218   ��       2          0    43539    section 
   TABLE DATA           Y   COPY public.section (section_id, content_no, section_content, instrument_id) FROM stdin;
    public          postgres    false    221   >�       ;          0    68791    user_otp 
   TABLE DATA           <   COPY public.user_otp (user_id, otp, expiration) FROM stdin;
    public          postgres    false    230   M�       I           0    0    annual_reports_annual_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.annual_reports_annual_id_seq', 3, true);
          public          postgres    false    228            J           0    0    csd_notification_notif_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.csd_notification_notif_id_seq', 7, true);
          public          postgres    false    233            K           0    0    sd_notification_notif_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.sd_notification_notif_id_seq', 12, true);
          public          postgres    false    231            �           2606    68621 "   annual_reports annual_reports_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.annual_reports
    ADD CONSTRAINT annual_reports_pkey PRIMARY KEY (annual_id);
 L   ALTER TABLE ONLY public.annual_reports DROP CONSTRAINT annual_reports_pkey;
       public            postgres    false    229            m           2606    43488    campus campus_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.campus
    ADD CONSTRAINT campus_pkey PRIMARY KEY (campus_id);
 <   ALTER TABLE ONLY public.campus DROP CONSTRAINT campus_pkey;
       public            postgres    false    216            �           2606    68845 &   csd_notification csd_notification_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.csd_notification
    ADD CONSTRAINT csd_notification_pkey PRIMARY KEY (notif_id);
 P   ALTER TABLE ONLY public.csd_notification DROP CONSTRAINT csd_notification_pkey;
       public            postgres    false    234            k           2606    43483    csd_office csd_office_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.csd_office
    ADD CONSTRAINT csd_office_pkey PRIMARY KEY (user_id);
 D   ALTER TABLE ONLY public.csd_office DROP CONSTRAINT csd_office_pkey;
       public            postgres    false    215            �           2606    43611    evidence evidence_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.evidence
    ADD CONSTRAINT evidence_pkey PRIMARY KEY (evidence_id);
 @   ALTER TABLE ONLY public.evidence DROP CONSTRAINT evidence_pkey;
       public            postgres    false    226            u           2606    43533 2   formula_per_instrument formula_per_instrument_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.formula_per_instrument
    ADD CONSTRAINT formula_per_instrument_pkey PRIMARY KEY (formula_id);
 \   ALTER TABLE ONLY public.formula_per_instrument DROP CONSTRAINT formula_per_instrument_pkey;
       public            postgres    false    220            y           2606    43557 ,   formula_per_section formula_per_section_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.formula_per_section
    ADD CONSTRAINT formula_per_section_pkey PRIMARY KEY (formula_id);
 V   ALTER TABLE ONLY public.formula_per_section DROP CONSTRAINT formula_per_section_pkey;
       public            postgres    false    222            s           2606    43521    instrument instrument_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.instrument
    ADD CONSTRAINT instrument_pkey PRIMARY KEY (instrument_id);
 D   ALTER TABLE ONLY public.instrument DROP CONSTRAINT instrument_pkey;
       public            postgres    false    219            }           2606    43581    options options_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.options
    ADD CONSTRAINT options_pkey PRIMARY KEY (option_id);
 >   ALTER TABLE ONLY public.options DROP CONSTRAINT options_pkey;
       public            postgres    false    224            {           2606    43569    question question_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_pkey PRIMARY KEY (question_id);
 @   ALTER TABLE ONLY public.question DROP CONSTRAINT question_pkey;
       public            postgres    false    223                       2606    43594    records records_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.records
    ADD CONSTRAINT records_pkey PRIMARY KEY (record_id);
 >   ALTER TABLE ONLY public.records DROP CONSTRAINT records_pkey;
       public            postgres    false    225            �           2606    43626 "   records_values records_values_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.records_values
    ADD CONSTRAINT records_values_pkey PRIMARY KEY (record_value_id);
 L   ALTER TABLE ONLY public.records_values DROP CONSTRAINT records_values_pkey;
       public            postgres    false    227            �           2606    68820 $   sd_notification sd_notification_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.sd_notification
    ADD CONSTRAINT sd_notification_pkey PRIMARY KEY (notif_id);
 N   ALTER TABLE ONLY public.sd_notification DROP CONSTRAINT sd_notification_pkey;
       public            postgres    false    232            o           2606    43495    sd_office sd_office_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.sd_office
    ADD CONSTRAINT sd_office_pkey PRIMARY KEY (user_id);
 B   ALTER TABLE ONLY public.sd_office DROP CONSTRAINT sd_office_pkey;
       public            postgres    false    217            q           2606    43507    sdg sdg_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.sdg
    ADD CONSTRAINT sdg_pkey PRIMARY KEY (sdg_id);
 6   ALTER TABLE ONLY public.sdg DROP CONSTRAINT sdg_pkey;
       public            postgres    false    218            w           2606    43545    section section_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.section
    ADD CONSTRAINT section_pkey PRIMARY KEY (section_id);
 >   ALTER TABLE ONLY public.section DROP CONSTRAINT section_pkey;
       public            postgres    false    221            �           2606    68795    user_otp user_otp_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.user_otp
    ADD CONSTRAINT user_otp_pkey PRIMARY KEY (user_id);
 @   ALTER TABLE ONLY public.user_otp DROP CONSTRAINT user_otp_pkey;
       public            postgres    false    230            �           2606    43617     evidence evidence_record_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.evidence
    ADD CONSTRAINT evidence_record_id_fkey FOREIGN KEY (record_id) REFERENCES public.records(record_id);
 J   ALTER TABLE ONLY public.evidence DROP CONSTRAINT evidence_record_id_fkey;
       public          postgres    false    4735    226    225            �           2606    43612 !   evidence evidence_section_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.evidence
    ADD CONSTRAINT evidence_section_id_fkey FOREIGN KEY (section_id) REFERENCES public.section(section_id);
 K   ALTER TABLE ONLY public.evidence DROP CONSTRAINT evidence_section_id_fkey;
       public          postgres    false    226    4727    221            �           2606    68052    records_values fk_campus    FK CONSTRAINT     �   ALTER TABLE ONLY public.records_values
    ADD CONSTRAINT fk_campus FOREIGN KEY (campus_id) REFERENCES public.campus(campus_id);
 B   ALTER TABLE ONLY public.records_values DROP CONSTRAINT fk_campus;
       public          postgres    false    216    4717    227            �           2606    51668    records fk_sdg    FK CONSTRAINT     n   ALTER TABLE ONLY public.records
    ADD CONSTRAINT fk_sdg FOREIGN KEY (sdg_id) REFERENCES public.sdg(sdg_id);
 8   ALTER TABLE ONLY public.records DROP CONSTRAINT fk_sdg;
       public          postgres    false    225    218    4721            �           2606    68796    user_otp fk_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_otp
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES public.sd_office(user_id) ON DELETE CASCADE;
 =   ALTER TABLE ONLY public.user_otp DROP CONSTRAINT fk_user_id;
       public          postgres    false    217    230    4719            �           2606    68821    sd_notification fk_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.sd_notification
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES public.sd_office(user_id) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.sd_notification DROP CONSTRAINT fk_user_id;
       public          postgres    false    4719    232    217            �           2606    68846    csd_notification fk_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.csd_notification
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES public.csd_office(user_id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.csd_notification DROP CONSTRAINT fk_user_id;
       public          postgres    false    215    234    4715            �           2606    43534 @   formula_per_instrument formula_per_instrument_instrument_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.formula_per_instrument
    ADD CONSTRAINT formula_per_instrument_instrument_id_fkey FOREIGN KEY (instrument_id) REFERENCES public.instrument(instrument_id);
 j   ALTER TABLE ONLY public.formula_per_instrument DROP CONSTRAINT formula_per_instrument_instrument_id_fkey;
       public          postgres    false    4723    219    220            �           2606    43558 7   formula_per_section formula_per_section_section_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.formula_per_section
    ADD CONSTRAINT formula_per_section_section_id_fkey FOREIGN KEY (section_id) REFERENCES public.section(section_id);
 a   ALTER TABLE ONLY public.formula_per_section DROP CONSTRAINT formula_per_section_section_id_fkey;
       public          postgres    false    4727    221    222            �           2606    43522 !   instrument instrument_sdg_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.instrument
    ADD CONSTRAINT instrument_sdg_id_fkey FOREIGN KEY (sdg_id) REFERENCES public.sdg(sdg_id);
 K   ALTER TABLE ONLY public.instrument DROP CONSTRAINT instrument_sdg_id_fkey;
       public          postgres    false    219    218    4721            �           2606    43582     options options_question_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.options
    ADD CONSTRAINT options_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.question(question_id);
 J   ALTER TABLE ONLY public.options DROP CONSTRAINT options_question_id_fkey;
       public          postgres    false    223    224    4731            �           2606    43570 !   question question_section_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_section_id_fkey FOREIGN KEY (section_id) REFERENCES public.section(section_id);
 K   ALTER TABLE ONLY public.question DROP CONSTRAINT question_section_id_fkey;
       public          postgres    false    223    221    4727            �           2606    43595    records records_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.records
    ADD CONSTRAINT records_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.sd_office(user_id);
 F   ALTER TABLE ONLY public.records DROP CONSTRAINT records_user_id_fkey;
       public          postgres    false    217    225    4719            �           2606    43627 .   records_values records_values_question_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.records_values
    ADD CONSTRAINT records_values_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.question(question_id);
 X   ALTER TABLE ONLY public.records_values DROP CONSTRAINT records_values_question_id_fkey;
       public          postgres    false    4731    227    223            �           2606    43632 ,   records_values records_values_record_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.records_values
    ADD CONSTRAINT records_values_record_id_fkey FOREIGN KEY (record_id) REFERENCES public.records(record_id);
 V   ALTER TABLE ONLY public.records_values DROP CONSTRAINT records_values_record_id_fkey;
       public          postgres    false    227    225    4735            �           2606    43496 "   sd_office sd_office_campus_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sd_office
    ADD CONSTRAINT sd_office_campus_id_fkey FOREIGN KEY (campus_id) REFERENCES public.campus(campus_id);
 L   ALTER TABLE ONLY public.sd_office DROP CONSTRAINT sd_office_campus_id_fkey;
       public          postgres    false    217    4717    216            �           2606    43546 "   section section_instrument_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.section
    ADD CONSTRAINT section_instrument_id_fkey FOREIGN KEY (instrument_id) REFERENCES public.instrument(instrument_id);
 L   ALTER TABLE ONLY public.section DROP CONSTRAINT section_instrument_id_fkey;
       public          postgres    false    4723    221    219            :   �   x�m�I
1DםS�	���T�3�i숋�����ƅ (Ԫ��Î ��� �BL�Բ.u�׾vni%��������z�蜢�?a�������>��6����p��62'���#!�@�a��8��̛>.u�'�ٱ��>%u�J�r*/�      -   �   x�]λ�0й��� ��f$l�bcq�REJ�*��=]�k/�^ۺ2�댹y������EKA���K�ް���кqp`%�#�Z�Sima��W������8�4�V�FG�;�=�u���e�c=���L�Z���N.�� ���l�      ?      x������ � �      ,   s   x�300�4�tvQ�OK�LN�L.N�KI,�H�O,JqH�M���K���T1JR14P)5�rL*7��,H���L)v	�H-L�	��p��6��p6s�sKu73�p�������� �D �      7      x������ � �      1      x������ � �      3   �  x��Yko\��l��[}��/9��x�����(�R�q��:v����!��rWkGjk��%9���Ǚ3�M��h�������WO�֮���.���ӴN3w^oIz�qo���VE�	��efQ�=z���&]�P��FH�ǆ���Dk#��bX2�d0���`�a4L���I�O>z�=��/n"��cyˋ�W#c9�1�߱�Ne��>,�NXZ6.S(]�h�s�Kf���M�}�ϙ�ō�����x���$i��}x�%��\�8�.���.l|{O�9k��u�h"��i������ʺ<�+&_���bZ�̋�2����u���X_ECNL��(��G�ԣ�$�T_��;��|�e�Xe��8��ɦ�y�aK*�Uƫ��!�]��e[�{��]ܒV�t�/=�Z�b}v�PJ&a9�h�~�K����)1����I�؆<��썫ώ�	�ͫ��kt������Ձ�F��W�F�\\3E�2�h��`7Z��͎&�9?V\�|�7�R��z۝۸�ڀd��&�����|g�G�+c�E[�q�|�FC��y#�7r
pX�}��Y�M�fe>�]�����[�D�-�9���n�m^���;��d�Cn�C���N���rc2��!ٜ�$�`q��5�-``���������~����_��Gۍ11���s��$��p��,/GZ���Vq)����_������x�ț�x���Om�#D $]�)�*)FЭ��!1�,����1b�Y1�YY �c
�fLǲ��z����:q�{��[[��-GqI�8��*�����|J���_y=�MQs�h��D ��Dx�9u���#Q�Ƶt䷗�o/[���ѭ/w�?���0����ZE�����5R��1���W�A@z�lsԝR�O��ח��/_�ĳa3r�
��sp��rU>MqF��d8������̂�k�����$W�CN���d�5��|)�����r%��u��.L�$�)��_�o��_1 ��&F�4!a�ޥI!��٥� (����K�M�����e��j�,A�*����uU���qp���[�	�1\o���O^��$?��Kͩ�Vi��9I떉M38w�
�h)t�QL���}W�Z��3��o���댔)!"d�V�\T9�.c���Q�ұkT������l�&٬�:/�ޅ���O���.�����|��u�.;�3�s�`W-��rN��H��W&�)��$W����ʌm��s'�*��)�l�m����|!Z�'���@
c��Ȅ<!O�B�Wj�9
J��8���Pd�;����
��v�)���� ���2ę\l�i���6��s��A�[�ƿ1}3����7����_B������w���y6d[�9�2�p
���=ټ���-uۯUa�Dm���w�XZ�L'���Ł=������.� �w�BU7�P��w��O� ����l���IDJ�(�L�ŶGT�Ғ�H��3�,a��Łs~"bI��Z8���L�o� hr�e1�,����a�d'�	��B�ù�(l#׈(T��')M�7!�'"�ܦ �8!J��q���qʛc즈m�`�g_
$�R�	��i�"wS�i#(
g����޽��޶�e�^>$�������Xɟ��]8�)�E�Q0�A&�g��!��x4�+���Y�gaQF�9��
��n��,ܻ2j>))��:����EJQR3"��$���b)!��S6ֆ
)�
��p�і}<r^b����j��1���w�'r�iE�kn &ئ��90�Xr:�I�M��-����uK7�/~��k2eo��t	|W���ͭ�J��Ղ��&(ʏXi�i���<1\���x`+��.ꑁ��P��L͟�#�ʄr��Ƣ�D����XyB�Ŋ���pY֌�Վˁ��/���	�����~)FF,K*y��F)d���#	J)ҧu�.wr�ɑ��9f=��5ֆ�%�)HM��ѩ������gL4��6*�9@v������ ^�R��@�.���}�,���m
nS���W=�p�A�6ElS���2�9��1�֩�|Z���(���6�ϑ;���F�V�^�Ǟ���J��V���D�$π�rΩ^��X�k�N�?L�b����5Nx�F����|y�!,�W�~Fv{��翽�ˏo�}~�ƛ�Z�5�?�������Ϸ?]<i�o����hnn?��R����`������I�6�)�q� .�<���x�-��Z߯�ໜ�C1�Yͫ.��lQ]���h��� vr0��X��P_���c����7��on���w��=+��2����q��(�O���o'�J�����g�h��X��iG�mTx�*J�hFZWN�há<(UŖ:2�kd4�Ɠj�ɚ�wi��ɻ��N��_9w�K��ɕ�O,5�����e��H����_�눸DI�X�W��z�fh>�E��sT1���@4b���;���c��q�;,���:9$�<��I�m$g"�>�)8�;���c3�Tm,;�`3͹�3M�M�?�u��)���UG������~N����r`b����&��^��f	��`�vv���W�����'���1�Z�6�����~����"	+�$���pw��Oԥ���Ҡ+g�BO57�n��o��m�0mMNS��V��⿛EX�� ����y>��Ky��]z�Z�:�&H��������.,�K��R[x���S����+&�@M����_�e����eR����/���9<�-/�W?�g���A.Ǹ�=�)�.�S�R���y()B�JD	����d�<3�33��^n�("H驕J�|P�s�q�ٸ�,bB6oW��d�h��~��$�y 19�Eb�Ln�P��$�Ђv�N2*YD�X�ș�Q�>/P�"��[�9:�A�{�'�;\��Kr5��)�y'[b	E���x�ئ�$UPe�R�{{��.�t�Qog�X������P�ݥ��,g�>9�������ʷ5F�@�W��<�����z#潜��%��^�HvRSBj(��uU��k��$X$Cd`���qޣ6e�ї5�����!�8�<�)�\6iR�K;�����`���]/�d��(��r]��Č\��9�`g�Q�R����� ����ކ|��㋋�� ʳ^      0   �  x��V�r�6]�_��;Ĳq��'����&��$LH�H{���x��d-��,��>�\�U�bB��rJ���̈&��|,�|-q����]%'�(�ң[-{$u�f�z�z���
�y��8�̌�&�(�5xtz>"9��:@�5{+�A�FS��1ð���\4Ń�u]g�sz�_��pҰ���2��*\���7r��v�t�U�Ye��>��!��a��Q��iՐ�C�ڌ��o�&D���}S���������
�
6$�ԢUhV��gc�s��h�}�m�V4��;�#:h���4���F�I�-mp<��W�^|��[䜢�� 1��$J�Fh�l��$��i�)i��)�Z�g&�A��_N`��릡>�_�ܫ໕Ve0,��
�#�
�'�e@Q�e�/�Fe�ʣO�˪�X2(� ,ƫ�4r�3���}��A���6� (|rkVk��1�����Dh�\����f�-�[��: u�q��2J`j�ۏ���v
e(�9�8�ы�
$ ���[�l����h^��C:z�Y�0���&'bJ�U�n]~�`xf�s�&%9��&����q���m��%��ݖ�ݖ٧`tw��e�D_ƌ#����_��{"G�!����q�����i�������tt��,7�(���e����+H�y]{�W���{b<f1�4��-�yZ�yA�l�ye+�C�$�6�[�Wu��+�?����Y��d��_�w	UX�a[2�]�u�0��ay��+^��M���Vyo�a�I��R|���#N�j�*|֝�^�+�Ϸ.D�%%�^���N� =�u���g88y�K������A�6�=�\�~�)HV�E;�$��v���A�0�u#�|0a".���z�O��j�-�mâ�V�9S�p�H����x�5'��<�ҳ_���t�!�D�`Ͳ?�ޕ�A4��G=��̼�q�j�b
/��&�i���}f�K�����4
�q�B7b��T��gxP��"�71�%��TT�������R����s������>�W�M�q�[Ք��:�=�" $s=���&��c�tOjV�w_� ��)j�%���/�m �ϰpeh��s�vc�`r��a̿��C��-�}�ld�df������	pU�      5   f  x�]�Mn1��3���?�,���EQ���5jN&p��}9#�t�O���v��C��Ǘao��:� (�O���5�e��8Q�5D�8ܿ���_N�_��iz^�a������h�v�������z��e���ߍG)
×�õ��̇��t�_�η?����j0{WV���m�p�ww�+�p*�HA��GwX'������$��T�]VYG`�st��O�9vd(=n	^J]����4߯2�e��m���%��$��jx�֑�7m2͍��m��b�1AΞ��
j�!��?��)[!���V*����� кu��k����Ds3U���q�!�&      4      x��\ݒ۶�����79kWyb 	`oN�c�IU��qR����D���H��f<��ƾ�>�~� E�g~<W�2Q��?����'cDl����b[4�|��7yV/7QUF���>�D�������{��β�aS�QQF?W�~�����b��������x�X�Ň��"���6UN�����'�&�3��u��uq�D���k^��/��|�)6"M�ܹ�>����_��_D��E^.�����Nu���|�.����<4���¾�yq�U���>��Uv��~8�+��Yn�mV7�b���:Q�-�`{61J��~O�P���īg��Ӹ��ſ���v�QV�����,��}2N$��U���M^Gs\�o�U�_�M�6t*�#.ˤ�)Ǘ��0�/�m��T6����5�0�١�ʹg�6+d"�ś����$���M`UB�r^���C^�<�>��\*R���U���q���̣�٧D�Z���mu1�%��J!�{�z;ݰ�)�÷�7��v���y�{uȶQY}U�h_m�e�}FHm+;5V=|����MT��ۜ��@ɖ˪^eX6:T�s�P�"�B��B?x�?��&���P�ْl����]��'�F���*Ë��N���%��-T�d��>Dk����3�x%�]����G\�q+sx�I*m��׫]q �~n�V���xq�}K!���G��m �NBs�
,&�R/Z��M���X/��rr{I�m��O�D�xd��c�܁�^I	?z
���c$�������o�c���W�u�G��˼	��R�H����	�x_g�#EΩ�.1�'�lOJ����Wz'a�خL$�Żu@���{�'�ҏ����p�
� No���n�f���h�]�Q�͗��{J��#.�	�������Mq�!}_rʡ]_T��h]W���������������_��
�~ݓ�{KUJ(�㼳�ko�:kp?���W���:�d���U�]�3a�uF+6B)����,։f�P2�Ȋ��:l��),l��8P�@"M琣eb��V������K]���.�g5�/��
� ��+L�Ɯo�tR>�WuǆP�Ll���c��<}�-PĆ>D�@��E����M��0Ti���c[�䯝�߉��~�b* 1�������n�Я�@N���4����F�.�۱n�R69�1��c5�����JQ}���
u�C��@������{�X�k�� fP\����pD��1'����U)@�I�=�e��p.usЙ��$A�g����'��J:�F�d��ͷ������%ڻ��W�@��t�XP��Z��Nm�X����]"��v�Y�#�}ʍ� ����s����q�D���|6�1�(`{��["eH�N>���6O��<2$;�xK�Q
�w*�I#ȔY�kR�j���Jxw��˂R��"k�eԴ� ~q
��ЀItr_N�
Nۆ
$@�~�r���ɘ���(k���w� y@��/��}�N��
�$�}��p4���OP�ɲ� �
�B��(���ߎr:�r�D*y��N��FpG�s�s��>V��5�S��E3��%}�凪ZEr��c��l_2��D�zS�r�b*H�1i� ��+D���ͱ��7j/��]P�:��Q]^t�ݼ�g_�8-�J=��Gb���*/��݉�a��m���. ��ɗ��4PalS�e��[�f��50t����/�/��.a`��0a�NxR����!)8�����X�8ߦ*F����ؐst ��]U��ܜw�9F����i��t�'�4��/��#���4u�;� }J%p��wD�FԾ�N�
��j�4h�a4JdǺ��w_y��^*E�b�6aDݕF_��z��.�>���zGE�գ�A)%�ޑ�(a@%	~�}�f|�L��&r�X3��Q(9�4�(��.Q�s.�$v����c;�΁/��� g ���4�*p�b˺/B�LJNk��Gģn�� ncc�2C>���WJ�G��}���w�>�mKR>������a��#�EP��c4s�k�h@�Y"]�K������c�@�{0�M�P]cd��2I�"濥
���s��I��TzA���_��p�ev�����14Q;�����L�u���F�1|@��2
�Ȗ�m
�����zŦ�,շa]�ΘjR_���+>i]P\���Y�:R�8]������G�#P��!U�'��N>1{at:���� ֯
ZU7�.�|��䎒sHfe�ew�h5���Ts���e^�5Y7��2,����Z7y�$*�;P75O�p(ЂH��w�&?�^�_7�E���g�ppbg�p�l�k�	���F��䛪!{����w��X3�G)��!�oW�0at�g=�e�+��P�6h@�8�T�eO��T̹�N�>Ԉ"d-߶}�@�M)�QY�v�X���G��(��Y���=�����7L�4��g�k�`@��u7U]�=��E~S!�yLR0��D�M
6]����k��Y^�~vD}ZL��m��0���'W���~*�8��!� 6���t+�;�� �u�Pw�,�����sK��츚2bih����K�O<�������[~�}]�ӭ::��Ez+�Ū��p��.�`a��dB:�0��t�9�K���+J�yy��f�D�VY�	�3f1F��b}C[�;+n�y��E�x�1W��A.�B`,����[g�g8��Br��Rd�!SЫ�e�cC�Z�}s,�+�{�Y�z���L���F�R��7����:��֪Stks�����5�[�!�6N����-������z:������%�KGwѪ��\e�
���0�j�:�\kh�L��+��Č�N7�E�<M�0���Hlm\1q�tx9����ާ%��Cܘ6:������b ��O%+��'�oD�ȡ@ץf���OY��rGF���<^��w9��b�M��#�I�:�>|� 2�o��w����b�������>�80@Q	RH���y�8!P���n+\'V�ԯ��c��>ma�$_dBQ3	%��»�g�5%�fY�n�w�A�D0��I�8�"��j�>k�.-�4�:q$>��&�-���O+��[Hȼ ā���
�妬��%�6�"l `�L�d
6~�֧vQ��%,��!�ؤ�w��oJ�v�*��:�Y7��)�%t��eT����.��	t|ŷ�P�˟uZ�J�� Z�M�4Aݯop�9��!� o=���� �;!���s�5g�d�I��g�	%#O���{0��Ay^�J5�d�\n*����Y�k��r4�;�rt��r�ɠ�{9n�q�9�/���k�v�$�,mUT_��B�Di(֓����ֶNÞ~���Pk���_ɎQ,�=Qm����3bK�#� >��4\n��ʗ�>v�<6[X��%ɽF@D�܊i�E�u�pU)�fH��N<��Ǖ��hD�?���Mv��rt��Y�n���s�(W~�k�*q��y��`X[����>(- �C+G�/�SY��̋�FF���.7,Q���/��h��B�q�����������&�Tc�T��m�~� "V)DX�����s��<�L�쨅�����wAΘ��p*P1�'5�ă��i-��'@o��jێ�xt0��$�R���.@G�X���ʼSuv\��EB��Y Ւ����Yn�_�p(�W,���������yz�P)������u,W��`I��M1s!�Ӌ?�(��o����.>�%��=��ŌD�M�f�6�t�
�Ըg��6�\�M N�k��*Y�}��h����>_�@����T�j}#b̄@���.�6����� ��)� ���X��F��8ECO�T��%4���m{������;r���0�\���Imй ��4�&�����!9�I�\��6-^V�k����?���M%N��B����,H�򾋨�N5��a��j�暱8�Bs���V
��A��$G���E�Z�����=�M�+h����9���p��U}	`A.���]�����7�����7�.�P���օ7 I  (Dy�~\T�Cw�|�.�?ڤ��i?��X�L�� ��)�����24��h�)b%�m�ݑ9Ze�Gu��1⛚$���5ܨ3�nR���Y�*�s_8��2��g�P�h�� �&1��!����"�I�a���FAm3��f�`�qX�US�Z���mD����6K5=����E]�=�g?�܂OYY����%,,�la��NXQ�ΎB��PWq�+��*�V��ʨ��s��Ɓ������rpx�MV_�́Յ��ų����+�5Jh�E�
�f\���/Ը�r����YK��p�}�z!-8*1w6Ͻ��w�;�JRq������V]�:����GL��8����W{���:'X��A��Վ���]�2���K� 7�y(�'/j�Rdj�8��
�eC����sm�9_�X�#�2���>E���p�vX|Z��2��*��燊ʨ�BQM�\��u�!a��R"�<觍��]��ŝV�ʡ�½����� 902��s��.��z����,u�!麪�����@���W��LgeUl�N��J�L�CQk�\�K�~Q`�:+ǽ�N�j�$����)d����խ�f]y�윈e�+���]���#^m��J#��j^�)qM�7f�D�޳�P�۪�.�R��Q.ᦝ�۷1�����#����:�.����)���仢��!vQ�nᙾ�����L��<AM�ɴ��̰q����>'��ȉ���{e�P�{6T���$N[{2IR�{�h6�������}��:��A�A��Ͳ�@���l���WH�u��&�n���� ��.4E?zk�B��n�@ыV��/{�G�i��&t���?_|��!���*��'��o�g�|�9!�5��'�7F?�	�t�3��K?��ur��r[�hK�� O�}�H�ǌ����s�����y��%�yk���ӂ�eӄ0-�S�f��}���_�)�e� Z3�fmi�1�����f.f��ȥ!�I��7��6ImÉS�2[Q��!���y��m���W�<k�e���Y|��������Ҷ���\|��E}�b6�Z�"?7�X��;�mw���n������,�{ZS�%�4F�f�b�Nu;!ke��_��<��d���>M�$�x⚟5�S�rڴ=c��q��ľ;�<f/=���`�~ꠙY���	�|�V_�^9k��A�$��*i�n����I;�7��)��-��D�n�q�S	�z8�g��7�T�d��<b�!jf��{�Q�R��(�5tϐ�'�(!n8=�mO*Qߎf��lp��L��̓�$�<�u����q<����~�%��T+�)�ٍ_&ͮ�b�6ǱSk��~V]�2���sRC�Vq��^m�	P���J��Ŀ�i�̏�4��χ)���,�!���LX��pn�����ң`
�G���e�`#�;���}S��+T
z�p��R��)�q���~��l�k�����K�q��oC	��ݕ ��Kx;en��i��Yv�˾b.� �|�i���X~[�[�y��P]sp���&���k5�-BJ��jR��kY�&�<��7���i�n�	a����9���Ւ�R�wJ��*q�o��w�(��ڶ�M���a�S�^kl�T�	M�?����?F���;jU�8Q��<�}�DZ	���T��R�p����Pi���eP-�Hܠi��i����5b���p'W����!����g[�n�t2��*�K����ᜣI��X�h���Wm�OQ��4�1�ߺj��&_�����o�C=���x�����u�����b��)�ڇ�Y��a2���l]f��A��
�휳K�Y�.��H����[�֤�?�\k�J�o�~�ja
9��N��M��A�Z�?��쨳YM�RQ�C��(�֌�tb�_ņ����>~f@��a��	.|�Kͯ��&�����k8]���T�9�#2��4�"�A�6�=�����/��v�~�j�8z��5܃�M)#5�e�es�3���>�,f�����m
�B��c$H����/kM�� �X��r���ٳ�]Z�D      6      x������ � �      8      x������ � �      =      x������ � �      .   �   x��λ�0@�}
�t�R�J0jc"�KE��Z
*O�`tqq=g�8��shQW�|����D"L��F�Z�-��/���3�J!�$���r��t]�/�"��.d+���y�{R�LfV�]�l�&T�a0��x��!̩� v���8�/��ɒ_6�R��`�P޽�9V�a�F��cy�J�|M��,b��{�1~��X�      /   o  x�5Q�N1<�_�(��I�P���B��t�m#v�M@�{���x���x�T�x��/�p_o��VG�I^�9�<�ry�H��d�pB�o����̚�{��\U���	�$�S(�+���I0���5YƝ�w�[�.��̚��� �����oZ1���vOT܉�N�U),�+���Np��Xs��/C\3�o�8LMk>x�P,C��k�����cP�D�W��V���r那�7+M9����H�ڳp�]�9w&R�Ƌ�J)�|
3ְ\�I�����	���#��ׇ	&�o�=�ү�&�of�![�_Թ���uI���R��f�&ߞܹE=�a!�VZ����`0��>��      2   �  x��Y�v�6]����9'ɉb�Nq<�&v�c%��l(ݍ1>�(���������[��I�da;�ԭ�[�k�s����lїǤk�Swk��~wńȸxv-����v?Mnt8P�Ƣ--���yv-��R�v��h�!�w}2�Su���.F[%���m;D!�S�a��"I��%�-��&�t:u��*��8|��ưl���_��X�;&ݞ�\,Zf�����g�\K����w}QM]�9N�j;F%�'�d�Ie�۽~thq<��B��^�^�Zwo�F�S����}�l�(��{g��(��S�:O�0t����k\}����\nB�2!��Q�3�v����iv:ɩ�n]��޹��]9m�SJ����m���i��ߺ�S��sH>��� 	Ec���Q	�:�x�������#� ��+�zhq�!�X(�M��3!;G�qj�ǣ( #}v�g*�p�]�K�h��Y'7�_�
�Q>0���=7���%�$�;v�xp<�jD(m�#�L��=sH�r�݈K��,�D!�r���3�>iS�<7�js�F��~1����A���G�'�F�oj�er�E=��P���<\�<v>�p�,�Ӵѕe�"�^�P�]�X/����j[��4�Qy�nPU^�z�	1����2��,VS�Ea-�԰՞��˒O?��ȡ}Q�%�n�f2�	F���L U1l�j%S��C�;o�[��X�uw%��}���*⋩�	eW��M�{�!���dF7Ns�^Ð"Bq e���t����O1�69���Ӗ���-��yTdr-E�X�H�!�͋�S%}���M���YoÓB�]�-�&����o�Oq{�'T��uI�I�4{�5�>�X��'4��TR�6�{{�ﭝ�L<��)-��?���͵�ۺCI��j��}|@wWF�BK��p����}m�΁G#��P�+^��]9�ђ~?�lx���u?�)&�=��'ԏ���{�I��# 㚢��]nm�g)J#0�v���#ҁ�������2)r*�F�:�lH��%'��Cd�y��6�i9�:.�ry�3ށ����w�R(V�܈g6�5*?������lA�"�j����:�"ԃVV=U<��E�
 �	������?U"�Ss�>m��6JpM�4���A19>6T��T��"�&C��-�����p����f?fj���_)��޵���)6�a:��� �K��n&WW$HT�*�j�2,��T=�9Յw1��x&�7��4ؤ��0��.�q:S^�)���O�l;_]�6Duw���ܧ7��Ͽ��o}
�����"�g��~��/fTܭQC�PZ��"��r��/TmӤ�8��������vuw Wqm"!	��ڷ�/9zR�'3��-�{{W �?�N������I��	�*����G�q��h}�|E��i��Y��y�1`���0������4Nkɢ��r�\H�p�R�_�/�W�7S�������u������l`�x2� k�L�q�MS���x9�v.�-����E����JJ#@b�z"�l}�@��Z�O��\u�q��{`����}�A�y>�P���o�A�Q����3K�f���Ƙ����7k�V�e�1c�ᄰ�BIEͥ;5��g艰���iE�r<4 �*��aT�B�5�<h�@נ��n�i��e���<�r���ɗ��-�J4Jd�lR	)8�u��y,�t���u�y%�L�_�>�qG���n��g0O��4z�dYT�(�1���
�����($r���i���6E��Z�FiM��gQ��,�)�2p��k�ė�H�ۻv�#�z@Td<�@3�>�7
��� MP��*9�q�=�%%���!ҍ�y*�ɳX��(A,2ȧ^Q�����F�1�H��a���?����V���8��H<Ơ��nKr��bynx)���.ƙ�qt�G�:7��/�<�43)�2J�4\=:۠�O��@��(d��h�KT��~&�(��:��n�����qA��0 .�J̊^��H�fRN5"�	z��2L�/ۡ_���/���%{�M���\���%x�K���<R�@�_ �������u���S<S�@�b��kƾ��c���)Gn_��F@���P�H0��>('�U�cƥl�6Ի�f>��y{;��Ǎ�%ϗ~QL�1=Cq��߲�O���ݖ��2ϸp��rts�%��-�[$a��4�E���+� H�C����K��������TǕ��q�o��k
���S7@��X�爮5D{\QQVq�#��,.^�]]?������(����ˈ�Ɣ_?��%�qo��"��:Y'��Kۍ�`��5YE�~#�pa�}��𖩌yӴ$�H���FecZr��<O��V�T�*U����L��
��S��}�G�@�Vy^��(��FܔS{�?!䉪�CI~
O�a��v��r�W�IF\���W��(3�Xh�|?ow&�<��F�*M�K���C����M��$,�/#)t�$�W_&���l�B{�~1�v��5[�
j�c�<\).~6��\�Z�o�T9��mW��ח�
���qZ�fDo]��_�=F,96�'~�������l]'�#]���ݻ7�L�4���1������֑B��8?���
$���sp[�LLz��7�4�����1C+��K��ό�{�P��"T�0�ǋy0+�00c���iΉ�S�b��؜- �@��~JV�9f4tT��d�@rj*m/�cgm4��Xo
��a��&��d�� J��1�W잁�җ���B9ۈ�I�#��$����l�>�q]�no?�\�����&��Tߟ�����Q�y�KR1�Ӽ��?���R�e��'�#}NJf�ڵv]�/}���(A�K1�SBBS��zʅ�����J�9ȅ�=��P��ƅ���I����U��T�:���d��~��)CC��A����b}RI���ه�����E�/��ӣ;��ǰ�!Mi+�⌙x��Ж�,|��:�v����7�}5��o�)և�o������Q��7?�۰Æd���0,F%l���._e��v��h�d�Q�M��
��0���@���1|� ���cWW����Lj���g��re�įb�ҹV�
L�}'�|�l���?�t}?�>{��O���ل�z��T�M��fD�Ib�2�ۯ�UA���N���/߆}a��5&EE���'�?�*���)�G�����]����f1Kow�p��C��G_7��!Q�p�����;�M��p��Ą9��d�(�2#2v6���	�[,R��FIw�<5:�r�^�d�G�:@gׯ���D#�h�7�������fD�u�B#}���x���&���F�C�`7"%"��j����A�LMv!���C������f��(D!C�%(���a����~Jx_�N2�\�m���/��^�$$q���.�xC�6��z�(��A���5_'�)����B��S�GӨ̞ҳ��;W����vQ�TJ���H	�d�5¥��>�K-��lO�� o��U�_={��w>ߑ      ;      x������ � �     
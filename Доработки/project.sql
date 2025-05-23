PGDMP  /                    }            postgres    17.4    17.4 B    	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            
           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false                       1262    5    postgres    DATABASE     k   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'ru';
    DROP DATABASE postgres;
                     postgres    false                       0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                        postgres    false    4876                        2615    24580    test    SCHEMA        CREATE SCHEMA test;
    DROP SCHEMA test;
                     postgres    false            �            1259    24646    book    TABLE     �   CREATE TABLE test.book (
    id integer NOT NULL,
    title text,
    author text,
    year integer,
    isbn text,
    publisher text
);
    DROP TABLE test.book;
       test         heap r       postgres    false    5            �            1259    24713    book_from_reader    TABLE     �   CREATE TABLE test.book_from_reader (
    id integer NOT NULL,
    book_id integer,
    reader_id integer,
    issued_at date DEFAULT CURRENT_DATE
);
 "   DROP TABLE test.book_from_reader;
       test         heap r       postgres    false    5            �            1259    24712    book_copies_id_seq    SEQUENCE     �   CREATE SEQUENCE test.book_copies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE test.book_copies_id_seq;
       test               postgres    false    225    5                       0    0    book_copies_id_seq    SEQUENCE OWNED BY     J   ALTER SEQUENCE test.book_copies_id_seq OWNED BY test.book_from_reader.id;
          test               postgres    false    224            �            1259    24749    book_status    TABLE     �   CREATE TABLE test.book_status (
    id integer NOT NULL,
    book_id integer,
    reader_id integer,
    action text,
    date date,
    CONSTRAINT book_status_action_check CHECK ((action = ANY (ARRAY['issued'::text, 'returned'::text])))
);
    DROP TABLE test.book_status;
       test         heap r       postgres    false    5            �            1259    24748    book_history_id_seq    SEQUENCE     �   CREATE SEQUENCE test.book_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE test.book_history_id_seq;
       test               postgres    false    229    5                       0    0    book_history_id_seq    SEQUENCE OWNED BY     F   ALTER SEQUENCE test.book_history_id_seq OWNED BY test.book_status.id;
          test               postgres    false    228            �            1259    24862    book_on_shelves    TABLE     l   CREATE TABLE test.book_on_shelves (
    id integer NOT NULL,
    book_id integer,
    shelves_id integer
);
 !   DROP TABLE test.book_on_shelves;
       test         heap r       postgres    false    5            �            1259    24645    books_id_seq    SEQUENCE     �   CREATE SEQUENCE test.books_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE test.books_id_seq;
       test               postgres    false    5    221                       0    0    books_id_seq    SEQUENCE OWNED BY     8   ALTER SEQUENCE test.books_id_seq OWNED BY test.book.id;
          test               postgres    false    220            �            1259    24861    books_on_shelves_id_seq    SEQUENCE     �   CREATE SEQUENCE test.books_on_shelves_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE test.books_on_shelves_id_seq;
       test               postgres    false    231    5                       0    0    books_on_shelves_id_seq    SEQUENCE OWNED BY     N   ALTER SEQUENCE test.books_on_shelves_id_seq OWNED BY test.book_on_shelves.id;
          test               postgres    false    230            �            1259    24584    branches    TABLE     X   CREATE TABLE test.branches (
    id integer NOT NULL,
    number text,
    name text
);
    DROP TABLE test.branches;
       test         heap r       postgres    false    5            �            1259    24739 
   librarians    TABLE     }   CREATE TABLE test.librarians (
    id integer NOT NULL,
    full_name text,
    employment_date date,
    room_id integer
);
    DROP TABLE test.librarians;
       test         heap r       postgres    false    5            �            1259    24738    librarians_id_seq    SEQUENCE     �   CREATE SEQUENCE test.librarians_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE test.librarians_id_seq;
       test               postgres    false    227    5                       0    0    librarians_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE test.librarians_id_seq OWNED BY test.librarians.id;
          test               postgres    false    226            �            1259    24703    reader    TABLE     ]   CREATE TABLE test.reader (
    id integer NOT NULL,
    full_name text,
    reg_date date
);
    DROP TABLE test.reader;
       test         heap r       postgres    false    5            �            1259    24702    readers_id_seq    SEQUENCE     �   CREATE SEQUENCE test.readers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE test.readers_id_seq;
       test               postgres    false    223    5                       0    0    readers_id_seq    SEQUENCE OWNED BY     <   ALTER SEQUENCE test.readers_id_seq OWNED BY test.reader.id;
          test               postgres    false    222            �            1259    24967    room    TABLE     o   CREATE TABLE test.room (
    id integer NOT NULL,
    branches_id integer,
    name text,
    location text
);
    DROP TABLE test.room;
       test         heap r       postgres    false    5            �            1259    24966    rooms_id_seq    SEQUENCE     �   CREATE SEQUENCE test.rooms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE test.rooms_id_seq;
       test               postgres    false    5    233                       0    0    rooms_id_seq    SEQUENCE OWNED BY     8   ALTER SEQUENCE test.rooms_id_seq OWNED BY test.room.id;
          test               postgres    false    232            �            1259    24631    shelves    TABLE     _   CREATE TABLE test.shelves (
    id integer NOT NULL,
    room_id integer,
    location text
);
    DROP TABLE test.shelves;
       test         heap r       postgres    false    5            �            1259    24630    shelves_id_seq    SEQUENCE     �   CREATE SEQUENCE test.shelves_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE test.shelves_id_seq;
       test               postgres    false    5    219                       0    0    shelves_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE test.shelves_id_seq OWNED BY test.shelves.id;
          test               postgres    false    218            �          0    24646    book 
   TABLE DATA           F   COPY test.book (id, title, author, year, isbn, publisher) FROM stdin;
    test               postgres    false    221   �E       �          0    24713    book_from_reader 
   TABLE DATA           K   COPY test.book_from_reader (id, book_id, reader_id, issued_at) FROM stdin;
    test               postgres    false    225   ,M                 0    24862    book_on_shelves 
   TABLE DATA           @   COPY test.book_on_shelves (id, book_id, shelves_id) FROM stdin;
    test               postgres    false    231   >N                 0    24749    book_status 
   TABLE DATA           I   COPY test.book_status (id, book_id, reader_id, action, date) FROM stdin;
    test               postgres    false    229   �N       �          0    24584    branches 
   TABLE DATA           2   COPY test.branches (id, number, name) FROM stdin;
    test               postgres    false    217   �O                  0    24739 
   librarians 
   TABLE DATA           K   COPY test.librarians (id, full_name, employment_date, room_id) FROM stdin;
    test               postgres    false    227   ~Q       �          0    24703    reader 
   TABLE DATA           7   COPY test.reader (id, full_name, reg_date) FROM stdin;
    test               postgres    false    223   PT                 0    24967    room 
   TABLE DATA           =   COPY test.room (id, branches_id, name, location) FROM stdin;
    test               postgres    false    233   *X       �          0    24631    shelves 
   TABLE DATA           6   COPY test.shelves (id, room_id, location) FROM stdin;
    test               postgres    false    219   ZY                  0    0    book_copies_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('test.book_copies_id_seq', 1, false);
          test               postgres    false    224                       0    0    book_history_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('test.book_history_id_seq', 1, false);
          test               postgres    false    228                       0    0    books_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('test.books_id_seq', 2, true);
          test               postgres    false    220                       0    0    books_on_shelves_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('test.books_on_shelves_id_seq', 1, false);
          test               postgres    false    230                       0    0    librarians_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('test.librarians_id_seq', 1, false);
          test               postgres    false    226                       0    0    readers_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('test.readers_id_seq', 1, false);
          test               postgres    false    222                       0    0    rooms_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('test.rooms_id_seq', 20, true);
          test               postgres    false    232                       0    0    shelves_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('test.shelves_id_seq', 1, false);
          test               postgres    false    218            S           2606    24722 !   book_from_reader book_copies_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY test.book_from_reader
    ADD CONSTRAINT book_copies_pkey PRIMARY KEY (id);
 I   ALTER TABLE ONLY test.book_from_reader DROP CONSTRAINT book_copies_pkey;
       test                 postgres    false    225            W           2606    24755    book_status book_history_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY test.book_status
    ADD CONSTRAINT book_history_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY test.book_status DROP CONSTRAINT book_history_pkey;
       test                 postgres    false    229            Y           2606    24868 %   book_on_shelves books_on_shelves_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY test.book_on_shelves
    ADD CONSTRAINT books_on_shelves_pkey PRIMARY KEY (id);
 M   ALTER TABLE ONLY test.book_on_shelves DROP CONSTRAINT books_on_shelves_pkey;
       test                 postgres    false    231            O           2606    24653    book books_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY test.book
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);
 7   ALTER TABLE ONLY test.book DROP CONSTRAINT books_pkey;
       test                 postgres    false    221            K           2606    24588    branches branches _pkey 
   CONSTRAINT     U   ALTER TABLE ONLY test.branches
    ADD CONSTRAINT "branches _pkey" PRIMARY KEY (id);
 A   ALTER TABLE ONLY test.branches DROP CONSTRAINT "branches _pkey";
       test                 postgres    false    217            U           2606    24747    librarians librarians_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY test.librarians
    ADD CONSTRAINT librarians_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY test.librarians DROP CONSTRAINT librarians_pkey;
       test                 postgres    false    227            Q           2606    24711    reader readers_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY test.reader
    ADD CONSTRAINT readers_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY test.reader DROP CONSTRAINT readers_pkey;
       test                 postgres    false    223            [           2606    24974    room rooms_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY test.room
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);
 7   ALTER TABLE ONLY test.room DROP CONSTRAINT rooms_pkey;
       test                 postgres    false    233            M           2606    24638    shelves shelves_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY test.shelves
    ADD CONSTRAINT shelves_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY test.shelves DROP CONSTRAINT shelves_pkey;
       test                 postgres    false    219            `           2606    25000    book_status book    FK CONSTRAINT     t   ALTER TABLE ONLY test.book_status
    ADD CONSTRAINT book FOREIGN KEY (book_id) REFERENCES test.book(id) NOT VALID;
 8   ALTER TABLE ONLY test.book_status DROP CONSTRAINT book;
       test               postgres    false    229    221    4687            ]           2606    25005    book_from_reader book    FK CONSTRAINT     y   ALTER TABLE ONLY test.book_from_reader
    ADD CONSTRAINT book FOREIGN KEY (book_id) REFERENCES test.book(id) NOT VALID;
 =   ALTER TABLE ONLY test.book_from_reader DROP CONSTRAINT book;
       test               postgres    false    221    225    4687            b           2606    25010    book_on_shelves book    FK CONSTRAINT     x   ALTER TABLE ONLY test.book_on_shelves
    ADD CONSTRAINT book FOREIGN KEY (book_id) REFERENCES test.book(id) NOT VALID;
 <   ALTER TABLE ONLY test.book_on_shelves DROP CONSTRAINT book;
       test               postgres    false    4687    221    231            d           2606    25020    room branches    FK CONSTRAINT     y   ALTER TABLE ONLY test.room
    ADD CONSTRAINT branches FOREIGN KEY (branches_id) REFERENCES test.branches(id) NOT VALID;
 5   ALTER TABLE ONLY test.room DROP CONSTRAINT branches;
       test               postgres    false    4683    233    217            a           2606    25071    book_status reader    FK CONSTRAINT     z   ALTER TABLE ONLY test.book_status
    ADD CONSTRAINT reader FOREIGN KEY (reader_id) REFERENCES test.reader(id) NOT VALID;
 :   ALTER TABLE ONLY test.book_status DROP CONSTRAINT reader;
       test               postgres    false    4689    223    229            ^           2606    25086    book_from_reader reader    FK CONSTRAINT        ALTER TABLE ONLY test.book_from_reader
    ADD CONSTRAINT reader FOREIGN KEY (reader_id) REFERENCES test.reader(id) NOT VALID;
 ?   ALTER TABLE ONLY test.book_from_reader DROP CONSTRAINT reader;
       test               postgres    false    225    223    4689            \           2606    25076    shelves room    FK CONSTRAINT     p   ALTER TABLE ONLY test.shelves
    ADD CONSTRAINT room FOREIGN KEY (room_id) REFERENCES test.room(id) NOT VALID;
 4   ALTER TABLE ONLY test.shelves DROP CONSTRAINT room;
       test               postgres    false    219    4699    233            _           2606    25081    librarians room    FK CONSTRAINT     s   ALTER TABLE ONLY test.librarians
    ADD CONSTRAINT room FOREIGN KEY (room_id) REFERENCES test.room(id) NOT VALID;
 7   ALTER TABLE ONLY test.librarians DROP CONSTRAINT room;
       test               postgres    false    4699    227    233            c           2606    25015    book_on_shelves shelves    FK CONSTRAINT     �   ALTER TABLE ONLY test.book_on_shelves
    ADD CONSTRAINT shelves FOREIGN KEY (shelves_id) REFERENCES test.shelves(id) NOT VALID;
 ?   ALTER TABLE ONLY test.book_on_shelves DROP CONSTRAINT shelves;
       test               postgres    false    219    4685    231            �   z  x��X[R�V�֬B�KWoe-Y�M�C�.����|8%��'[��Q��b$�8��=�q��龓x�,Ϟ�{�m��������k�c��+�NJ�̋ ���� /|��}�[������f���ҳg�����־}ĕ��5���qwn7xa���va7�7pu���ί�c�$��س'������V#y��s>����qa�y�JL���g�w+7�j�L���0��(@������vd�퓭�L��"�Jj��vb�>����% ��}{#����e�2]WY�A�O%
=�U��`f��?$�u���o���*E�G����P0���Q�=�c���8���X�Q�,	Y�ؾE���O0DJ�������W��?Gi�E�(��o$);i��"|!��AT{;�&u�@�4��"bc�g?��)`��Msd��K�#NK����%�gNI$Ga[��(|M*���V��)˖{�R[�s��B�)�9!�#���>�H��QD��ʁ�(��KWߍ�J�Q�~��_�`��Y��P�93���+��Q4p�/4����=�y������l�*��,���3�s��X�}!���⁷$0-�b���p�
a|�W\m��->�k� ڤo/%�:���"!K��?���k��Z��KV�J��j�ϐ��1�q#�i��q�RlΖ%�5�}���
b��Q��/y�����AN��L-���(�]�H�VTi�ֈuL=��a�eQYB�)���C��8��djrGЩ�Q3�lAC'�q���l�A�T��2������Vn�=!��p�0zЄ�ᣴv�"� �ؾW�ͻQ��������- ��i+�$n��l๝�bCϦ?b�� �A�	C�Q�wD�K?M4�d`4":�t]J��������'�2BW���/���p���uR��7>5�K6��^x�!� S�N���U��*���&�$�[�����8Ou� o��Y��e�l"�"v�a@L�R �#21�L����
Hx�_<�Dx�e J��)2��#�n;SB�i�w+M�����JZ����Zz�L8oN�gF��*$u�n\�&�4��5o%���弘���B��� �����/������蕓�ǎ������j�Y햽�.I)]5E��� Ly�L����dУ�P�m�aWE!!�,[��]�Ua�=��ĭ� ��6����",��d}s���O*�R5]�h���RfZ�.�_@Sn�{�49W��0�Ӭ�4J��3̺W$�m���$��2�1��,&�BD�t��~'5<$�G���VLk���
u+���fOe��JΤ�)�2�Jgi��2�H~�-�x��g�.<:�a-*����v�����K(�'�� �'p�6�)�������[]$ӏ�}l�R���J�ߙ�5���^P+�kbAQbˈ(]��v��Z����%�/���ռiWߋ*6n��{�w ��XW��G7'��[����|NG�AH`���8u�1`��y�q/�0�Tvy�E��Z�`�J���:�my,���̤yaǙ�����[3	��M�ֵT;��(]�'(i��n�&�0 e����G�<ʝpT"j����ȳ��aڿ��9T���1M�J��=�x�㸒�`���5~�9P�1�zk`�{iحBQą�V��2Oۈ���@4�(��L�6��� �p�dO����i>��#�m�ׅ%�ߗU-�~"m0g��RO����e�zĒئ�N0�,6e��I2��vx!>�+��L�����*[�K$;��,�Jn(����i!Ǫ;����!3λ�.MV���з�Z���khs�о{6;�0�=���k��6�Qȉ[�qVg�����F<�ϥ�5�W���w:O�N�������h����      �     x�M�K�1C��.=
&��]����(P*��0�*CT�8>M]����G��������K��)�%�XnX��}�<آ*�ȆWX�]�^�=
�)�r��P7z�[n��N�qj�f��r�lB��O\	t!�������B7�1��.�w� G�� G��	�.�'8�l��`K�Y8�%�d�fY�oW_��_����^g`��VV1.æ��%2N�{{a��)���z%��E�Y�����ؓVƥ�{��b����?�urM         m   x����0�}�<�$i�]���E�,c�Z2�CG�)k�����bkjs�K�G��G�8ƥ'��A�O�K�o5x�9��43�h]�|��)����5�PS�����?�r�         �   x�m�1nC1Cg�.)L����K�d��!i�_�^
�Ä=��	����~�a����[q������?1V����yRKY�ûdG�8�����'T��NNH�=&�QÖ�
ݤ�E��v2�}ncP�'Έͬq���3;u`iG5 �z���>���׭��2�'h�&,e����V��a�5,e�hKv~~����R      �   �  x���Yn"1���)�Q���2�	0�&RV)R6D�y�ih4i�B�F�A�8Vxh�]���-ٕ�^�LK���uZ��:�0�4s�ї7S�����k�a�7
��ǡ�������9�.M�i��Ȳ�d����r��u�#b�ӱ�n��\�A臟Ա��;���cZkgJ���^�MwTz�(��}�+�s��8GDe"C��6V�w�VE�c����y�aF��i����	�'�&��\��U�S'�����!��҉�.��ø.k<�E ���ް�?N�+�僚�+����q�_���	�%�{��f�c����_�-�u����A-Y�C���	��r5�c���󈯍z0�6�O��e��x�Ē"NÆ�������Q�K�O8�u�??�9/��S�i��f���j��g�?���j�?�|*�taC�ﷸ�:>y����@�Ѯ_�f����g�_ŗ�Dt����8��#��          �  x��T]r�0~֞"���ľ�!�/Z
�N):��SǤ1M�&���F|+�v��C;�����ϊ���LjY�Zf��c��*�ph��κ�ra����҄��J���Tŕuc��)3�]2�u:Q��0�Y�˰�.�.�4�����֕�&���Ex)w�i�L�J��-�)~<`���Eb��ޙ�
#�i��eq�Cs,4r��)�->�Ao���LAcU`-O]W�G8^�5֖��;�l3g�4Qy�ߪ�����Q8N���p�ۧQ�َ�剙Pi�0z-�����#څ_T��r��[�����{݇��㉺�`�~з�4A��{ؐ�?�H�]BRO�Q�f �c �aG�F~F�{1.Ʊ�Pj�[�!7�r�������ft��2x �g�Ex�L�i�j�R6��ήc2z!*���I>D���I�mKy�hs3>�T����	�%g�Ut0��h�nv�����1"�u�C$�+���F��P����k5�}����w,�>q�#��-0i:-��[��
���|��B��$�ԙ&��JQ���{qn7YU:jzVw�#��0�9d�KX'�N>�H���YV�6}�����jbQ��RƄ�C���$�E�5�������r��#�q�o"�0��/N'��yd����Y�C�����R��7����/��Ożcr[�o�А�����?#��|N�G      �   �  x�mVYn�0�&O��)ɒ���8	��H�����w��b[�{�F}3���A����̼y��J�+�4�y7{������S��	��,I�D�R�`���_�m33?`�N<�|aV��ג��/OR�h-3���y5{�I~��~nfѫCL��u�r�sݟ�7���_Ǹ�����?��{~j�7>n�d�,��C�-�:��r�~�Pgf73�|�
��ZL*�Uɹ0�0v�S����dO�|֭��T˒�o(?�������*��d%�[p֦���9^��|E�x7����V��7�6@��в�D�4�X����7��9y��t������vU`�TJ �U�����P�����Q�*Qp����/�|��PK��dC�[���.�L��q��B��ŝ��u�K�@�{8w6�-'��T~C�r��b�EXv���?#�0ٙ�L7����[*���Y.�SD�u���p���D1��6{h_R�-�Syvj�JUQ�f��G�9%�$QK��C�W�*�	�m�}�O��)թm�~���m>���#R�g��۱�'���p�j����<�A���je����~{��W$G��̲{;��=C������#N�VR��1���@��6L$!e�-�Y��rL���s����'ӭ+���C�w���R��)~��S�Dj熓�U�P7��Ҷ B�����4P2���+�a\�B��As��d����d��p)� T���A�٪^�q�YA��ɴoF�*dܥAƈSL�(׌x�������Lx�\�	����K����{�/���b�����<�M��Yb;�����[ў�
�k��!�'#����<��G����z�O1�<J�`5G�2/D�1Í�8K5��\;	<� ��m���&&��y)�g�h?:+U˜9X=n9��k�Xt4\��.+ıJt&�%���s�������&�?�R�6�            x���9NAE��O1@�U3c�C�}�%c��B�\�Y�f�P}#
G�=j�%�U���|��m.��>B߾B��2{�-!Y�w^f2{�Q��w��l�
�݅N������y��a6�O�[{����������������5�\d�r�^��%6����o�-�����V�R�V�F;Eo�ҀSGp�"p�7(
'Qr���I�ܢp�hnSJ8ɚ;�&�D�]JN����SGs�҆��y@m�I�<�
tR�D5���9ZK�C��NT�Z@���ZB����$ Hj;�      �   �   x�]�IN1D��S�J}��ea�&)�a�6g� !N�Y��ɻ'���L���Կ��N�fy�LӾ~7L�p%0#{x2CK����Ԣ�p-���g���{x.����1zx9Ò���8|%�$*]���N7r-f0�����Vw*o�P�^�ց�׃n�`(���͞T>���F䶀�j[y��=��:|�P�E�-�B�W�.�P�M�[X��.ۻ��?ԏq�     
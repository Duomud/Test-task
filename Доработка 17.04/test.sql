PGDMP      	                }            postgres    17.4    17.4 ;               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false                       1262    5    postgres    DATABASE     k   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'ru';
    DROP DATABASE postgres;
                     postgres    false                       0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                        postgres    false    4869                        2615    24580    test    SCHEMA        CREATE SCHEMA test;
    DROP SCHEMA test;
                     postgres    false            �            1259    24646    book    TABLE     �   CREATE TABLE test.book (
    id integer NOT NULL,
    title text,
    author text,
    year integer,
    isbn text,
    publisher text,
    status_id integer
);
    DROP TABLE test.book;
       test         heap r       postgres    false    5            �            1259    25106    book_from_reader    TABLE     �   CREATE TABLE test.book_from_reader (
    id integer NOT NULL,
    book_id integer NOT NULL,
    reader_id integer NOT NULL,
    issued_at date NOT NULL,
    returned_at date
);
 "   DROP TABLE test.book_from_reader;
       test         heap r       postgres    false    5            �            1259    24862    book_on_shelves    TABLE     l   CREATE TABLE test.book_on_shelves (
    id integer NOT NULL,
    book_id integer,
    shelves_id integer
);
 !   DROP TABLE test.book_on_shelves;
       test         heap r       postgres    false    5            �            1259    25128    book_status    TABLE     S   CREATE TABLE test.book_status (
    id integer NOT NULL,
    name text NOT NULL
);
    DROP TABLE test.book_status;
       test         heap r       postgres    false    5            �            1259    24645    books_id_seq    SEQUENCE     �   CREATE SEQUENCE test.books_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE test.books_id_seq;
       test               postgres    false    221    5                       0    0    books_id_seq    SEQUENCE OWNED BY     8   ALTER SEQUENCE test.books_id_seq OWNED BY test.book.id;
          test               postgres    false    220            �            1259    24861    books_on_shelves_id_seq    SEQUENCE     �   CREATE SEQUENCE test.books_on_shelves_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE test.books_on_shelves_id_seq;
       test               postgres    false    227    5                       0    0    books_on_shelves_id_seq    SEQUENCE OWNED BY     N   ALTER SEQUENCE test.books_on_shelves_id_seq OWNED BY test.book_on_shelves.id;
          test               postgres    false    226            �            1259    24584    branches    TABLE     X   CREATE TABLE test.branches (
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
       test               postgres    false    5    225            	           0    0    librarians_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE test.librarians_id_seq OWNED BY test.librarians.id;
          test               postgres    false    224            �            1259    24703    reader    TABLE     ]   CREATE TABLE test.reader (
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
       test               postgres    false    223    5            
           0    0    readers_id_seq    SEQUENCE OWNED BY     <   ALTER SEQUENCE test.readers_id_seq OWNED BY test.reader.id;
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
       test               postgres    false    229    5                       0    0    rooms_id_seq    SEQUENCE OWNED BY     8   ALTER SEQUENCE test.rooms_id_seq OWNED BY test.room.id;
          test               postgres    false    228            �            1259    24631    shelves    TABLE     _   CREATE TABLE test.shelves (
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
       test               postgres    false    5    219                       0    0    shelves_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE test.shelves_id_seq OWNED BY test.shelves.id;
          test               postgres    false    218            �          0    24646    book 
   TABLE DATA           Q   COPY test.book (id, title, author, year, isbn, publisher, status_id) FROM stdin;
    test               postgres    false    221   M>       �          0    25106    book_from_reader 
   TABLE DATA           X   COPY test.book_from_reader (id, book_id, reader_id, issued_at, returned_at) FROM stdin;
    test               postgres    false    230   �E       �          0    24862    book_on_shelves 
   TABLE DATA           @   COPY test.book_on_shelves (id, book_id, shelves_id) FROM stdin;
    test               postgres    false    227   dG       �          0    25128    book_status 
   TABLE DATA           -   COPY test.book_status (id, name) FROM stdin;
    test               postgres    false    231   �G       �          0    24584    branches 
   TABLE DATA           2   COPY test.branches (id, number, name) FROM stdin;
    test               postgres    false    217   �H       �          0    24739 
   librarians 
   TABLE DATA           K   COPY test.librarians (id, full_name, employment_date, room_id) FROM stdin;
    test               postgres    false    225   kJ       �          0    24703    reader 
   TABLE DATA           7   COPY test.reader (id, full_name, reg_date) FROM stdin;
    test               postgres    false    223   =M       �          0    24967    room 
   TABLE DATA           =   COPY test.room (id, branches_id, name, location) FROM stdin;
    test               postgres    false    229   Q       �          0    24631    shelves 
   TABLE DATA           6   COPY test.shelves (id, room_id, location) FROM stdin;
    test               postgres    false    219   GR                  0    0    books_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('test.books_id_seq', 2, true);
          test               postgres    false    220                       0    0    books_on_shelves_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('test.books_on_shelves_id_seq', 1, false);
          test               postgres    false    226                       0    0    librarians_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('test.librarians_id_seq', 1, false);
          test               postgres    false    224                       0    0    readers_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('test.readers_id_seq', 1, false);
          test               postgres    false    222                       0    0    rooms_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('test.rooms_id_seq', 20, true);
          test               postgres    false    228                       0    0    shelves_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('test.shelves_id_seq', 1, false);
          test               postgres    false    218            U           2606    25112 &   book_from_reader book_from_reader_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY test.book_from_reader
    ADD CONSTRAINT book_from_reader_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY test.book_from_reader DROP CONSTRAINT book_from_reader_pkey;
       test                 postgres    false    230            W           2606    25134    book_status book_status_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY test.book_status
    ADD CONSTRAINT book_status_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY test.book_status DROP CONSTRAINT book_status_pkey;
       test                 postgres    false    231            Q           2606    24868 %   book_on_shelves books_on_shelves_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY test.book_on_shelves
    ADD CONSTRAINT books_on_shelves_pkey PRIMARY KEY (id);
 M   ALTER TABLE ONLY test.book_on_shelves DROP CONSTRAINT books_on_shelves_pkey;
       test                 postgres    false    227            K           2606    24653    book books_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY test.book
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);
 7   ALTER TABLE ONLY test.book DROP CONSTRAINT books_pkey;
       test                 postgres    false    221            G           2606    24588    branches branches _pkey 
   CONSTRAINT     U   ALTER TABLE ONLY test.branches
    ADD CONSTRAINT "branches _pkey" PRIMARY KEY (id);
 A   ALTER TABLE ONLY test.branches DROP CONSTRAINT "branches _pkey";
       test                 postgres    false    217            O           2606    24747    librarians librarians_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY test.librarians
    ADD CONSTRAINT librarians_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY test.librarians DROP CONSTRAINT librarians_pkey;
       test                 postgres    false    225            M           2606    24711    reader readers_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY test.reader
    ADD CONSTRAINT readers_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY test.reader DROP CONSTRAINT readers_pkey;
       test                 postgres    false    223            S           2606    24974    room rooms_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY test.room
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);
 7   ALTER TABLE ONLY test.room DROP CONSTRAINT rooms_pkey;
       test                 postgres    false    229            I           2606    24638    shelves shelves_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY test.shelves
    ADD CONSTRAINT shelves_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY test.shelves DROP CONSTRAINT shelves_pkey;
       test                 postgres    false    219            [           2606    25010    book_on_shelves book    FK CONSTRAINT     x   ALTER TABLE ONLY test.book_on_shelves
    ADD CONSTRAINT book FOREIGN KEY (book_id) REFERENCES test.book(id) NOT VALID;
 <   ALTER TABLE ONLY test.book_on_shelves DROP CONSTRAINT book;
       test               postgres    false    4683    227    221            ^           2606    25113 .   book_from_reader book_from_reader_book_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY test.book_from_reader
    ADD CONSTRAINT book_from_reader_book_id_fkey FOREIGN KEY (book_id) REFERENCES test.book(id);
 V   ALTER TABLE ONLY test.book_from_reader DROP CONSTRAINT book_from_reader_book_id_fkey;
       test               postgres    false    221    230    4683            _           2606    25118 0   book_from_reader book_from_reader_reader_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY test.book_from_reader
    ADD CONSTRAINT book_from_reader_reader_id_fkey FOREIGN KEY (reader_id) REFERENCES test.reader(id);
 X   ALTER TABLE ONLY test.book_from_reader DROP CONSTRAINT book_from_reader_reader_id_fkey;
       test               postgres    false    230    223    4685            ]           2606    25020    room branches    FK CONSTRAINT     y   ALTER TABLE ONLY test.room
    ADD CONSTRAINT branches FOREIGN KEY (branches_id) REFERENCES test.branches(id) NOT VALID;
 5   ALTER TABLE ONLY test.room DROP CONSTRAINT branches;
       test               postgres    false    229    4679    217            Y           2606    25168    book fk_book_status    FK CONSTRAINT     v   ALTER TABLE ONLY test.book
    ADD CONSTRAINT fk_book_status FOREIGN KEY (status_id) REFERENCES test.book_status(id);
 ;   ALTER TABLE ONLY test.book DROP CONSTRAINT fk_book_status;
       test               postgres    false    231    221    4695            X           2606    25076    shelves room    FK CONSTRAINT     p   ALTER TABLE ONLY test.shelves
    ADD CONSTRAINT room FOREIGN KEY (room_id) REFERENCES test.room(id) NOT VALID;
 4   ALTER TABLE ONLY test.shelves DROP CONSTRAINT room;
       test               postgres    false    219    4691    229            Z           2606    25081    librarians room    FK CONSTRAINT     s   ALTER TABLE ONLY test.librarians
    ADD CONSTRAINT room FOREIGN KEY (room_id) REFERENCES test.room(id) NOT VALID;
 7   ALTER TABLE ONLY test.librarians DROP CONSTRAINT room;
       test               postgres    false    229    225    4691            \           2606    25015    book_on_shelves shelves    FK CONSTRAINT     �   ALTER TABLE ONLY test.book_on_shelves
    ADD CONSTRAINT shelves FOREIGN KEY (shelves_id) REFERENCES test.shelves(id) NOT VALID;
 ?   ALTER TABLE ONLY test.book_on_shelves DROP CONSTRAINT shelves;
       test               postgres    false    219    4681    227            �   �  x��X[R�V�֬B�KWoe-Y386U��]�!N��HJ�4O�p����}��8��=�q��龓x�,Ϟ�{�k��������k��#��k�NJ�̋ ���� /|��}�;�����q3ƥ�gF�gϜ�.O�w��}��+;o�������n��B�/��n�o���3���g��I�gO샽�����xd"�~pL`d�w}�DhvѼ�|����ʍ�z(Ӥ�!�2
��v�d6vG����Vv�	�t�I5�};�;W�m풐G6�������2����,� �cFQ��obfC+��!�n�1b���;ܪ7A�E�\�j7A��X��V����fQF=L�$d5O`�֋F���L����������4ς�42O={���!I�N�C�	o��n�^3��Ф�(�FyYD̢g.��G�8�s�m�җ�)|[�*,����KV�y9<�\�m���54AH���k[x��f@ �垫��y]���P���E|d�c�:�"���\,^� �/]��v&y�A�8��(-����0B���>�fޕ/0W�.�#
�h�*&�_i6_3~v8�-5�xp���9��A�"���}�Z��
K�����<30�
����'��ٖ���rᣐ�6�i�S���X�b"��B@c���5����3�-��"��$"��~�+��1�~fI>!�>!㨥ۂML�)v,e*!��Y	���_����l�"�||��B��6Ћ]I�VTpT6�wB���iR�Q�B��)
�!E����Ɖ'�O}�S�G�Q��KvKR�!�����kk����&��,�8쇩X�(��Ξ�V�8P0]iB��I��R���m?�����D� �m�tX��xi�J*i\�+[za���з��z#آ���W�X�OϤ�@K�M5�d`6"F/�a������n�g�>B^��ۯ���pP�4ݐ{|
�$!�9$xOu��n9сC�N� �ʬ�̋��1)�?���-&�"� S�M���.t���R��R�=QL�'�rM)w��$�ٹ ��6Ċ�#Q&�$~��]g��2��!��}b���٨����dI��i�D|a� ���V�C�u�����*�TõpIƚ�c�h
UE��	]�<�t�޲#�WND;:g:gJ�\g\��A��R�j���>���ٰ�)Ǔ'�Sk!@��>�B�[�h��M��?{J��[A$	<��'+�����.��b�yO=Ʊ�(��e��M�d�U�����=wO�,�l�xp�u�Fi�^w0���t�^L$o�P�9�u�Ŭ�P1;u���I-d�G��q+����Le���Z8\����}�$o�ʔO��8gi�v���|_��\�Z��7]�t-���袓cK�^{A�/�Οq�#���e<����D���)`����_�3��~lETw����ߙ�5�^X�&ꫥ�E����5;�Z<WK�\�_�t��?2ۚw��|�J%h�f�_���"ֵ�?���Ij�V�����C�S�I��/�5�f|pu-e�i��5�3U�n��i+�����w:Ɏ�~;(��#3i�_�y,g���\3*�M�޵X;&��4�QCh�"K�F�1*�o���?�������r���F���[�{J��&�A��D?�-�\�3���JJ�ys� ;%�9��❹T^k3�f�n5�".�6���[��qa[�t�aRi��mJ�4ua,�2dO@FY�A��?�;�S��X�8ƾ�A�j��S�@:��Vz�ԅ�氻�c���Ń	e�)s�P[g�Q^�p�l=�9�㋮�+�k$<��,�Jn3/�*�s�ѣ�������ݪ�&+�C�)x��:nPX^�Si����A�ۨH��c(�?'�ĭ��h�S�,�z��[�V��`!��=���,�ٽ�~��wwA���h4�Td�*      �   ^  x�uS�m1��vIa=쳗���JN���A>�E1Ҥ?�=��M�,����
�}H����-oB�'�����{�D���%�;MWɣ�����+�;��Y�p
38�}k�޹#O�M�-���4����J�k�z�ĥ���c�я��B�UcSy;�X1��*W]�K��˻�b~zē�v	-G&4(��.��`/c�mߢ�'ŷ(�5����;��<7����U���z���9j��ܦp�>��I*�C�z����N��n��N;G
u@��͝��z��\�?_tBg&��z']p��5�YJc8��%�dd�<��Qw�����V�����b����"�H��|      �   m   x����0�}�<�$i�]���E�,c�Z2�CG�)k�����bkjs�K�G��G�8ƥ'��A�O�K�o5x�9��43�h]�|��)����5�PS�����?�r�      �   �   x�-�1�0k�~ B��c�)@J$�4���
(�|a�G��;��ͮ�q���̴
Q0v�5<���h�9`����&�u���:�/fl�Փ1(ʬ���y�+JYRe���L~�p���Cb�#�(�AH�� �~���#��      �   �  x���Yn"1���)�Q���2�	0�&RV)R6D�y�ih4i�B�F�A�8Vxh�]���-ٕ�^�LK���uZ��:�0�4s�ї7S�����k�a�7
��ǡ�������9�.M�i��Ȳ�d����r��u�#b�ӱ�n��\�A臟Ա��;���cZkgJ���^�MwTz�(��}�+�s��8GDe"C��6V�w�VE�c����y�aF��i����	�'�&��\��U�S'�����!��҉�.��ø.k<�E ���ް�?N�+�僚�+����q�_���	�%�{��f�c����_�-�u����A-Y�C���	��r5�c���󈯍z0�6�O��e��x�Ē"NÆ�������Q�K�O8�u�??�9/��S�i��f���j��g�?���j�?�|*�taC�ﷸ�:>y����@�Ѯ_�f����g�_ŗ�Dt����8��#��      �   �  x��T]r�0~֞"���ľ�!�/Z
�N):��SǤ1M�&���F|+�v��C;�����ϊ���LjY�Zf��c��*�ph��κ�ra����҄��J���Tŕuc��)3�]2�u:Q��0�Y�˰�.�.�4�����֕�&���Ex)w�i�L�J��-�)~<`���Eb��ޙ�
#�i��eq�Cs,4r��)�->�Ao���LAcU`-O]W�G8^�5֖��;�l3g�4Qy�ߪ�����Q8N���p�ۧQ�َ�剙Pi�0z-�����#څ_T��r��[�����{݇��㉺�`�~з�4A��{ؐ�?�H�]BRO�Q�f �c �aG�F~F�{1.Ʊ�Pj�[�!7�r�������ft��2x �g�Ex�L�i�j�R6��ήc2z!*���I>D���I�mKy�hs3>�T����	�%g�Ut0��h�nv�����1"�u�C$�+���F��P����k5�}����w,�>q�#��-0i:-��[��
���|��B��$�ԙ&��JQ���{qn7YU:jzVw�#��0�9d�KX'�N>�H���YV�6}�����jbQ��RƄ�C���$�E�5�������r��#�q�o"�0��/N'��yd����Y�C�����R��7����/��Ożcr[�o�А�����?#��|N�G      �   �  x�mVYn�0�&O��)ɒ���8	��H�����w��b[�{�F}3���A����̼y��J�+�4�y7{������S��	��,I�D�R�`���_�m33?`�N<�|aV��ג��/OR�h-3���y5{�I~��~nfѫCL��u�r�sݟ�7���_Ǹ�����?��{~j�7>n�d�,��C�-�:��r�~�Pgf73�|�
��ZL*�Uɹ0�0v�S����dO�|֭��T˒�o(?�������*��d%�[p֦���9^��|E�x7����V��7�6@��в�D�4�X����7��9y��t������vU`�TJ �U�����P�����Q�*Qp����/�|��PK��dC�[���.�L��q��B��ŝ��u�K�@�{8w6�-'��T~C�r��b�EXv���?#�0ٙ�L7����[*���Y.�SD�u���p���D1��6{h_R�-�Syvj�JUQ�f��G�9%�$QK��C�W�*�	�m�}�O��)թm�~���m>���#R�g��۱�'���p�j����<�A���je����~{��W$G��̲{;��=C������#N�VR��1���@��6L$!e�-�Y��rL���s����'ӭ+���C�w���R��)~��S�Dj熓�U�P7��Ҷ B�����4P2���+�a\�B��As��d����d��p)� T���A�٪^�q�YA��ɴoF�*dܥAƈSL�(׌x�������Lx�\�	����K����{�/���b�����<�M��Yb;�����[ў�
�k��!�'#����<��G����z�O1�<J�`5G�2/D�1Í�8K5��\;	<� ��m���&&��y)�g�h?:+U˜9X=n9��k�Xt4\��.+ıJt&�%���s�������&�?�R�6�      �      x���9NAE��O1@�U3c�C�}�%c��B�\�Y�f�P}#
G�=j�%�U���|��m.��>B߾B��2{�-!Y�w^f2{�Q��w��l�
�݅N������y��a6�O�[{����������������5�\d�r�^��%6����o�-�����V�R�V�F;Eo�ҀSGp�"p�7(
'Qr���I�ܢp�hnSJ8ɚ;�&�D�]JN����SGs�҆��y@m�I�<�
tR�D5���9ZK�C��NT�Z@���ZB����$ Hj;�      �   �   x�]�IN1D��S�J}��ea�&)�a�6g� !N�Y��ɻ'���L���Կ��N�fy�LӾ~7L�p%0#{x2CK����Ԣ�p-���g���{x.����1zx9Ò���8|%�$*]���N7r-f0�����Vw*o�P�^�ց�׃n�`(���͞T>���F䶀�j[y��=��:|�P�E�-�B�W�.�P�M�[X��.ۻ��?ԏq�     
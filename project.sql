PGDMP  *                    }            postgres    17.4    17.4 B               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            	           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            
           1262    5    postgres    DATABASE     k   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'ru';
    DROP DATABASE postgres;
                     postgres    false                       0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                        postgres    false    4874                        2615    24580    test    SCHEMA        CREATE SCHEMA test;
    DROP SCHEMA test;
                     postgres    false            �            1259    24646    book    TABLE     �   CREATE TABLE test.book (
    id integer NOT NULL,
    title text,
    author text,
    year integer,
    isbn text,
    publisher text,
    status text
);
    DROP TABLE test.book;
       test         heap r       postgres    false    5            �            1259    24713    book_from_reader    TABLE     �   CREATE TABLE test.book_from_reader (
    id integer NOT NULL,
    book_id integer,
    reader_id integer,
    added date,
    written date
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
       test               postgres    false    5    225                       0    0    book_copies_id_seq    SEQUENCE OWNED BY     J   ALTER SEQUENCE test.book_copies_id_seq OWNED BY test.book_from_reader.id;
          test               postgres    false    224            �            1259    24749    book_status    TABLE     �   CREATE TABLE test.book_status (
    id integer NOT NULL,
    book_id integer,
    taken_at date,
    returned_at date,
    reader_id integer
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
       test               postgres    false    5    229                       0    0    book_history_id_seq    SEQUENCE OWNED BY     F   ALTER SEQUENCE test.book_history_id_seq OWNED BY test.book_status.id;
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
       test               postgres    false    5    221                       0    0    books_id_seq    SEQUENCE OWNED BY     8   ALTER SEQUENCE test.books_id_seq OWNED BY test.book.id;
          test               postgres    false    220            �            1259    24861    books_on_shelves_id_seq    SEQUENCE     �   CREATE SEQUENCE test.books_on_shelves_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE test.books_on_shelves_id_seq;
       test               postgres    false    231    5                       0    0    books_on_shelves_id_seq    SEQUENCE OWNED BY     N   ALTER SEQUENCE test.books_on_shelves_id_seq OWNED BY test.book_on_shelves.id;
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
       test               postgres    false    5    227                       0    0    librarians_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE test.librarians_id_seq OWNED BY test.librarians.id;
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
       test               postgres    false    223    5                       0    0    readers_id_seq    SEQUENCE OWNED BY     <   ALTER SEQUENCE test.readers_id_seq OWNED BY test.reader.id;
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
       test               postgres    false    5    233                       0    0    rooms_id_seq    SEQUENCE OWNED BY     8   ALTER SEQUENCE test.rooms_id_seq OWNED BY test.room.id;
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
       test               postgres    false    219    5                       0    0    shelves_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE test.shelves_id_seq OWNED BY test.shelves.id;
          test               postgres    false    218            �          0    24646    book 
   TABLE DATA           N   COPY test.book (id, title, author, year, isbn, publisher, status) FROM stdin;
    test               postgres    false    221   aE       �          0    24713    book_from_reader 
   TABLE DATA           P   COPY test.book_from_reader (id, book_id, reader_id, added, written) FROM stdin;
    test               postgres    false    225   M                 0    24862    book_on_shelves 
   TABLE DATA           @   COPY test.book_on_shelves (id, book_id, shelves_id) FROM stdin;
    test               postgres    false    231   �N                  0    24749    book_status 
   TABLE DATA           R   COPY test.book_status (id, book_id, taken_at, returned_at, reader_id) FROM stdin;
    test               postgres    false    229   O       �          0    24584    branches 
   TABLE DATA           2   COPY test.branches (id, number, name) FROM stdin;
    test               postgres    false    217   <P       �          0    24739 
   librarians 
   TABLE DATA           K   COPY test.librarians (id, full_name, employment_date, room_id) FROM stdin;
    test               postgres    false    227   $R       �          0    24703    reader 
   TABLE DATA           7   COPY test.reader (id, full_name, reg_date) FROM stdin;
    test               postgres    false    223   �T                 0    24967    room 
   TABLE DATA           =   COPY test.room (id, branches_id, name, location) FROM stdin;
    test               postgres    false    233   �X       �          0    24631    shelves 
   TABLE DATA           6   COPY test.shelves (id, room_id, location) FROM stdin;
    test               postgres    false    219    Z                  0    0    book_copies_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('test.book_copies_id_seq', 1, false);
          test               postgres    false    224                       0    0    book_history_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('test.book_history_id_seq', 1, false);
          test               postgres    false    228                       0    0    books_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('test.books_id_seq', 2, true);
          test               postgres    false    220                       0    0    books_on_shelves_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('test.books_on_shelves_id_seq', 1, false);
          test               postgres    false    230                       0    0    librarians_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('test.librarians_id_seq', 1, false);
          test               postgres    false    226                       0    0    readers_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('test.readers_id_seq', 1, false);
          test               postgres    false    222                       0    0    rooms_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('test.rooms_id_seq', 20, true);
          test               postgres    false    232                       0    0    shelves_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('test.shelves_id_seq', 1, false);
          test               postgres    false    218            Q           2606    24722 !   book_from_reader book_copies_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY test.book_from_reader
    ADD CONSTRAINT book_copies_pkey PRIMARY KEY (id);
 I   ALTER TABLE ONLY test.book_from_reader DROP CONSTRAINT book_copies_pkey;
       test                 postgres    false    225            U           2606    24755    book_status book_history_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY test.book_status
    ADD CONSTRAINT book_history_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY test.book_status DROP CONSTRAINT book_history_pkey;
       test                 postgres    false    229            W           2606    24868 %   book_on_shelves books_on_shelves_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY test.book_on_shelves
    ADD CONSTRAINT books_on_shelves_pkey PRIMARY KEY (id);
 M   ALTER TABLE ONLY test.book_on_shelves DROP CONSTRAINT books_on_shelves_pkey;
       test                 postgres    false    231            M           2606    24653    book books_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY test.book
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);
 7   ALTER TABLE ONLY test.book DROP CONSTRAINT books_pkey;
       test                 postgres    false    221            I           2606    24588    branches branches _pkey 
   CONSTRAINT     U   ALTER TABLE ONLY test.branches
    ADD CONSTRAINT "branches _pkey" PRIMARY KEY (id);
 A   ALTER TABLE ONLY test.branches DROP CONSTRAINT "branches _pkey";
       test                 postgres    false    217            S           2606    24747    librarians librarians_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY test.librarians
    ADD CONSTRAINT librarians_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY test.librarians DROP CONSTRAINT librarians_pkey;
       test                 postgres    false    227            O           2606    24711    reader readers_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY test.reader
    ADD CONSTRAINT readers_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY test.reader DROP CONSTRAINT readers_pkey;
       test                 postgres    false    223            Y           2606    24974    room rooms_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY test.room
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);
 7   ALTER TABLE ONLY test.room DROP CONSTRAINT rooms_pkey;
       test                 postgres    false    233            K           2606    24638    shelves shelves_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY test.shelves
    ADD CONSTRAINT shelves_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY test.shelves DROP CONSTRAINT shelves_pkey;
       test                 postgres    false    219            ^           2606    25000    book_status book    FK CONSTRAINT     t   ALTER TABLE ONLY test.book_status
    ADD CONSTRAINT book FOREIGN KEY (book_id) REFERENCES test.book(id) NOT VALID;
 8   ALTER TABLE ONLY test.book_status DROP CONSTRAINT book;
       test               postgres    false    221    229    4685            [           2606    25005    book_from_reader book    FK CONSTRAINT     y   ALTER TABLE ONLY test.book_from_reader
    ADD CONSTRAINT book FOREIGN KEY (book_id) REFERENCES test.book(id) NOT VALID;
 =   ALTER TABLE ONLY test.book_from_reader DROP CONSTRAINT book;
       test               postgres    false    225    4685    221            `           2606    25010    book_on_shelves book    FK CONSTRAINT     x   ALTER TABLE ONLY test.book_on_shelves
    ADD CONSTRAINT book FOREIGN KEY (book_id) REFERENCES test.book(id) NOT VALID;
 <   ALTER TABLE ONLY test.book_on_shelves DROP CONSTRAINT book;
       test               postgres    false    221    231    4685            b           2606    25020    room branches    FK CONSTRAINT     y   ALTER TABLE ONLY test.room
    ADD CONSTRAINT branches FOREIGN KEY (branches_id) REFERENCES test.branches(id) NOT VALID;
 5   ALTER TABLE ONLY test.room DROP CONSTRAINT branches;
       test               postgres    false    233    217    4681            _           2606    25071    book_status reader    FK CONSTRAINT     z   ALTER TABLE ONLY test.book_status
    ADD CONSTRAINT reader FOREIGN KEY (reader_id) REFERENCES test.reader(id) NOT VALID;
 :   ALTER TABLE ONLY test.book_status DROP CONSTRAINT reader;
       test               postgres    false    229    4687    223            \           2606    25086    book_from_reader reader    FK CONSTRAINT        ALTER TABLE ONLY test.book_from_reader
    ADD CONSTRAINT reader FOREIGN KEY (reader_id) REFERENCES test.reader(id) NOT VALID;
 ?   ALTER TABLE ONLY test.book_from_reader DROP CONSTRAINT reader;
       test               postgres    false    225    4687    223            Z           2606    25076    shelves room    FK CONSTRAINT     p   ALTER TABLE ONLY test.shelves
    ADD CONSTRAINT room FOREIGN KEY (room_id) REFERENCES test.room(id) NOT VALID;
 4   ALTER TABLE ONLY test.shelves DROP CONSTRAINT room;
       test               postgres    false    219    233    4697            ]           2606    25081    librarians room    FK CONSTRAINT     s   ALTER TABLE ONLY test.librarians
    ADD CONSTRAINT room FOREIGN KEY (room_id) REFERENCES test.room(id) NOT VALID;
 7   ALTER TABLE ONLY test.librarians DROP CONSTRAINT room;
       test               postgres    false    233    4697    227            a           2606    25015    book_on_shelves shelves    FK CONSTRAINT     �   ALTER TABLE ONLY test.book_on_shelves
    ADD CONSTRAINT shelves FOREIGN KEY (shelves_id) REFERENCES test.shelves(id) NOT VALID;
 ?   ALTER TABLE ONLY test.book_on_shelves DROP CONSTRAINT shelves;
       test               postgres    false    219    231    4683            �   �  x��XYR�V�����լ,"+�b���Ta̘�bl�Sq>�o ��-\�(�t_���I>\~h�����}�x�,Ϟ�[�j��������nv�;�s�NJ�̋ ���� /|����+;��9���f�f�˟�JϞ:k+\4o}[��W&v��������;u?�S��s���K�&v�MS$IĞ=�w�Vf��7y�ą0��9_�q��I�Z����g��Zn��E�&a�Q����Yؕ8�����cMa��+M�y�ۡ]��zkk��<��� /����t�ei��w	E�g���9,�|��D�hv�~��V���sռ7���P�*��ڬp�" g�9eE�2Z�5KBV�����3��[d����~�F���(ͳ��a��=Gz`��f�;�;�AwWl���Ф���FyYD�c�^���0r��v��۩/�S�BY�$�#Rз�3s�"=�
���E���!1c�l�1�枫�ʹ��d�t ����Hǘ�:Fb{�q#�"�X��FL_�Z/�H�O`�\��� )&���K�{�M蛙W� ]���(�����p~�9�@8��	���a�i,�ĝ�V��Y�BH%q�8�"2�sG�0�ø�0	L��1 �SX���w>I-ޖD����P��n2%�:�;"03D$y�p��ak��J��(�W�JR�j�0g�!�~�Jދ!�-�%݄�L�)|�gB!#DZ	ǐ�_���/����B�z�8����f�F���(!~,�uI�$$J���04S�<FH�T`�<�O����&��Z96���d6TD�B�i��vd�§�	Ň}13����J&{�G�=MH<>H�W�b �0P�퉚l�|���$�7mî����o�Z}%�+��ޞ�!I�wn��!1��J��D
m/����VjRI�nD�67d����{4��և�D�aF��/��l��W�|]��|J��lgma
���>�;�*i����`=Y1	������>k�PvH���'N�g�!�s��Lzl5)u�7X����S�]�1��y�R ���v�� W&�>~��Ug���@�k���;�E�i�����H�F�(�)=g����l�
��ó/�O-*�*Ii��d�9G�'��P�t͗ �s�(�/��98��ӓ��虞虒���g�-1I�p5��#y�y�|��T��vЬ���m�~�E!�Z_�h�O+ٜG�ʻ�[L$<��(+W��Ċ��[�'�Y����2����{hA�{��nft��k&�jW�/ 4��m��\��\D0Y7�(��ǹ�)��;�E����6&��5+��>�b�L(�L�$q^�3�
��M�:%wZծ}75G:Z��jR�X���`Dn��!s�5�,���3��h�*�|��s��W��t������c+�F�0,.��q�=�=�w�1}|���U��jc>�W��v�N6R�;#�F�q�l���5zS<e��,���w���k��W-�|a����m�̟�P-�uǙ�*�N��"�u��l�
��oe�K�O��9�me�bC�$�q�@(����%��p	�Le�y\��U2f� �\�[�>�X�l\t�J�I��#�F���� 5���]5�$�S����{�f7-�ԝ5���
2��Z�����[�|ĭY�`3�+yv0�>�(��d�䝦@7zr��W�ìn,��c�ԝ�VJ�3 >�[c��ƹχ�*E\��'��<�"K�-Q��m��?t��=�=lDeeeH�ٿ�wN��q�_3N�_R&�,OC�9e,8��h�{a�u�BO�r�]v�3&�Ŧ̵O&_<l���<g����!PW(D#��+�ӗ�,�Jn�?�l�FϽ7�Kԟ��]��&+�O;��V�,�8'4���?8T���X�<~=Z�{O�RL�&�R�nA&Cſῥn�l3}���iS��ڧ�a���qO���勭�� $���      �   n  x�MSٍ� �6���!4�l�u����+�&x��IB�j�g�Y�Ӆ�R<���t��*�5������r��]�0�:����~ۤE���<���<�Od|R����h}�Tg{I2�b=��n�}%���y�����w�@��%�t9��YEFr���`��V��>)D�q;���c�gT�U�7��2���<V�E�(��Z n���ib���fi��P��c�X�FW��q�6uF`���UЛ6��t�?l|�(Î�����r�M#��Z'����i,��'� �ܬD�Qԛ�^':����h��6˾���Q�Ԏ%�d���0�~3�@�M�آ=���$���淋�[	��         m   x����0�}�<�$i�]���E�,c�Z2�CG�)k�����bkjs�K�G��G�8ƥ'��A�O�K�o5x�9��43�h]�|��)����5�PS�����?�r�            x�ER�q 1{�^�A��&RA��#�ُG�%!L�bj�h/�p�&�V������PeE��>���BJE�����+]�^O��<C�@����Lio1��6t9K��خ�!?�*x}=�W�&t**����7�:ж��5�����U�qn�2�+b�O|Ҟt�{f�&��C4wpG�@�w��	��s�ד������YmyhɅ�������c��(NaS�/�t$�����K�b��2�K���<n����v�4,m䶱!Xz:�*��� �B.ts      �   �  x���Yn"1���)�Q���2�	0�&RV)R6D�y�ih4i�B�F�A�8Vxh�]���-ٕ�^�LK���uZ��:�0�4s�ї7S�����k�a�7
��ǡ�������9�.M�i��Ȳ�d����r��u�#b�ӱ�n��\�A臟Ա��;���cZkgJ���^�MwTz�(��}�+�s��8GDe"C��6V�w�VE�c����y�aF��i����	�'�&��\��U�S'�����!��҉�.��ø.k<�E ���ް�?N�+�僚�+����q�_���	�%�{��f�c����_�-�u����A-Y�C���	��r5�c���󈯍z0�6�O��e��x�Ē"NÆ�������Q�K�O8�u�??�9/��S�i��f���j��g�?���j�?�|*�taC�ﷸ�:>y����@�Ѯ_�f����g�_ŗ�Dt����8��#��      �   �  x��T]r�0~֞"���ľ�!�/Z
�N):��SǤ1M�&���F|+�v��C;�����ϊ���LjY�Zf��c��*�ph��κ�ra����҄��J���Tŕuc��)3�]2�u:Q��0�Y�˰�.�.�4�����֕�&���Ex)w�i�L�J��-�)~<`���Eb��ޙ�
#�i��eq�Cs,4r��)�->�Ao���LAcU`-O]W�G8^�5֖��;�l3g�4Qy�ߪ�����Q8N���p�ۧQ�َ�剙Pi�0z-�����#څ_T��r��[�����{݇��㉺�`�~з�4A��{ؐ�?�H�]BRO�Q�f �c �aG�F~F�{1.Ʊ�Pj�[�!7�r�������ft��2x �g�Ex�L�i�j�R6��ήc2z!*���I>D���I�mKy�hs3>�T����	�%g�Ut0��h�nv�����1"�u�C$�+���F��P����k5�}����w,�>q�#��-0i:-��[��
���|��B��$�ԙ&��JQ���{qn7YU:jzVw�#��0�9d�KX'�N>�H���YV�6}�����jbQ��RƄ�C���$�E�5�������r��#�q�o"�0��/N'��yd����Y�C�����R��7����/��Ożcr[�o�А�����?#��|N�G      �   �  x�mVYn�0�&O��)ɒ���8	��H�����w��b[�{�F}3���A����̼y��J�+�4�y7{������S��	��,I�D�R�`���_�m33?`�N<�|aV��ג��/OR�h-3���y5{�I~��~nfѫCL��u�r�sݟ�7���_Ǹ�����?��{~j�7>n�d�,��C�-�:��r�~�Pgf73�|�
��ZL*�Uɹ0�0v�S����dO�|֭��T˒�o(?�������*��d%�[p֦���9^��|E�x7����V��7�6@��в�D�4�X����7��9y��t������vU`�TJ �U�����P�����Q�*Qp����/�|��PK��dC�[���.�L��q��B��ŝ��u�K�@�{8w6�-'��T~C�r��b�EXv���?#�0ٙ�L7����[*���Y.�SD�u���p���D1��6{h_R�-�Syvj�JUQ�f��G�9%�$QK��C�W�*�	�m�}�O��)թm�~���m>���#R�g��۱�'���p�j����<�A���je����~{��W$G��̲{;��=C������#N�VR��1���@��6L$!e�-�Y��rL���s����'ӭ+���C�w���R��)~��S�Dj熓�U�P7��Ҷ B�����4P2���+�a\�B��As��d����d��p)� T���A�٪^�q�YA��ɴoF�*dܥAƈSL�(׌x�������Lx�\�	����K����{�/���b�����<�M��Yb;�����[ў�
�k��!�'#����<��G����z�O1�<J�`5G�2/D�1Í�8K5��\;	<� ��m���&&��y)�g�h?:+U˜9X=n9��k�Xt4\��.+ıJt&�%���s�������&�?�R�6�            x���9NAE��O1@�U3c�C�}�%c��B�\�Y�f�P}#
G�=j�%�U���|��m.��>B߾B��2{�-!Y�w^f2{�Q��w��l�
�݅N������y��a6�O�[{����������������5�\d�r�^��%6����o�-�����V�R�V�F;Eo�ҀSGp�"p�7(
'Qr���I�ܢp�hnSJ8ɚ;�&�D�]JN����SGs�҆��y@m�I�<�
tR�D5���9ZK�C��NT�Z@���ZB����$ Hj;�      �   �   x�]�IN1D��S�J}��ea�&)�a�6g� !N�Y��ɻ'���L���Կ��N�fy�LӾ~7L�p%0#{x2CK����Ԣ�p-���g���{x.����1zx9Ò���8|%�$*]���N7r-f0�����Vw*o�P�^�ց�׃n�`(���͞T>���F䶀�j[y��=��:|�P�E�-�B�W�.�P�M�[X��.ۻ��?ԏq�     
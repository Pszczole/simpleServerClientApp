PGDMP         "                {           insuranceCompany    15.2    15.2     
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16562    insuranceCompany    DATABASE     �   CREATE DATABASE "insuranceCompany" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Polish_Poland.1250';
 "   DROP DATABASE "insuranceCompany";
                postgres    false            �            1259    16578    insurance_offers    TABLE     �   CREATE TABLE public.insurance_offers (
    id bigint NOT NULL,
    vehicle_id bigint NOT NULL,
    insurer text NOT NULL,
    price numeric NOT NULL,
    insert_time timestamp with time zone NOT NULL
);
 $   DROP TABLE public.insurance_offers;
       public         heap    postgres    false            �            1259    16563    users    TABLE     �   CREATE TABLE public.users (
    id bigint NOT NULL,
    nick text NOT NULL,
    login text NOT NULL,
    password text NOT NULL,
    insert_time timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16571    vehicles    TABLE     �   CREATE TABLE public.vehicles (
    id bigint NOT NULL,
    login text NOT NULL,
    brand text NOT NULL,
    model text NOT NULL,
    insert_time time with time zone NOT NULL
);
    DROP TABLE public.vehicles;
       public         heap    postgres    false                      0    16578    insurance_offers 
   TABLE DATA           W   COPY public.insurance_offers (id, vehicle_id, insurer, price, insert_time) FROM stdin;
    public          postgres    false    216   ;                 0    16563    users 
   TABLE DATA           G   COPY public.users (id, nick, login, password, insert_time) FROM stdin;
    public          postgres    false    214   �                 0    16571    vehicles 
   TABLE DATA           H   COPY public.vehicles (id, login, brand, model, insert_time) FROM stdin;
    public          postgres    false    215   e       t           2606    16584 &   insurance_offers insurance_offers_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.insurance_offers
    ADD CONSTRAINT insurance_offers_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.insurance_offers DROP CONSTRAINT insurance_offers_pkey;
       public            postgres    false    216            n           2606    16591    users unique_login 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT unique_login UNIQUE (login);
 <   ALTER TABLE ONLY public.users DROP CONSTRAINT unique_login;
       public            postgres    false    214            p           2606    16570    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    214            r           2606    16577    vehicles vehicles_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.vehicles
    ADD CONSTRAINT vehicles_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.vehicles DROP CONSTRAINT vehicles_pkey;
       public            postgres    false    215            v           2606    16585 /   insurance_offers insurance_offers_vehicles_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.insurance_offers
    ADD CONSTRAINT insurance_offers_vehicles_fkey FOREIGN KEY (vehicle_id) REFERENCES public.vehicles(id) NOT VALID;
 Y   ALTER TABLE ONLY public.insurance_offers DROP CONSTRAINT insurance_offers_vehicles_fkey;
       public          postgres    false    3186    216    215            u           2606    16592    vehicles vehicles_users_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.vehicles
    ADD CONSTRAINT vehicles_users_fkey FOREIGN KEY (login) REFERENCES public.users(login) NOT VALID;
 F   ALTER TABLE ONLY public.vehicles DROP CONSTRAINT vehicles_users_fkey;
       public          postgres    false    215    214    3182               �   x���1�@��w���XrI�����š������p(-� ��=q�S ����¢?MD`bٓ�SXn�Z[�!I�#6�%���i�U�8����B�qJC1w����J88����\_1��p*R��!.�q���]�kD��l�@�>+�����J�/Υ1�5gY         n   x�3��J�K�64�М�EU��9��FFƺ�@�`hhejiej�giil`l�m`�eę�X��9�K�sh1�LJ,*�08�2K��	�d�y�)��
d�E�c���� e�8�         v   x�3��J�K��t,M��,4�44�2��22ӳ�4606�60�2��M,�+1Ǧ�YI"VSL8��J�j��s����S�8��sҰ�5Ţ6 ?'�Z3��̣M��U(���K�)����� �?�     
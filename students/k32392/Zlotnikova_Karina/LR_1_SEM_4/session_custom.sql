PGDMP                         {            Session    15.2    15.2 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16400    Session    DATABASE     }   CREATE DATABASE "Session" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "Session";
                postgres    false            �            1259    16491 
   classrooms    TABLE     �  CREATE TABLE public.classrooms (
    classroom_id integer NOT NULL,
    building integer NOT NULL,
    number character varying(6) NOT NULL,
    capacity numeric NOT NULL,
    type character varying(20) NOT NULL,
    CONSTRAINT chk_type CHECK (((type)::text = ANY (ARRAY[('lection'::character varying)::text, ('lab'::character varying)::text, ('computer'::character varying)::text, ('lesson'::character varying)::text])))
);
    DROP TABLE public.classrooms;
       public         heap    postgres    false            �            1259    16679    classrooms_classroom_id_seq    SEQUENCE     �   ALTER TABLE public.classrooms ALTER COLUMN classroom_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.classrooms_classroom_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    223            �            1259    16512    curriculum_discipline    TABLE     �   CREATE TABLE public.curriculum_discipline (
    cur_id integer NOT NULL,
    discipline_id integer NOT NULL,
    curriculum_id integer NOT NULL
);
 )   DROP TABLE public.curriculum_discipline;
       public         heap    postgres    false            �            1259    16681     curriculum_discipline_cur_id_seq    SEQUENCE     �   ALTER TABLE public.curriculum_discipline ALTER COLUMN cur_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.curriculum_discipline_cur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    225            �            1259    16433    curriculums    TABLE     �   CREATE TABLE public.curriculums (
    curriculum_id integer NOT NULL,
    educational_program integer NOT NULL,
    year date NOT NULL
);
    DROP TABLE public.curriculums;
       public         heap    postgres    false            �           0    0    TABLE curriculums    COMMENT     B   COMMENT ON TABLE public.curriculums IS 'Учебный план';
          public          postgres    false    217            �            1259    16677    curriculums_curriculum_id_seq    SEQUENCE     �   ALTER TABLE public.curriculums ALTER COLUMN curriculum_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.curriculums_curriculum_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    217            �            1259    16418 
   department    TABLE     �   CREATE TABLE public.department (
    department_id integer NOT NULL,
    name character varying(80) NOT NULL,
    university_building integer NOT NULL
);
    DROP TABLE public.department;
       public         heap    postgres    false            �            1259    16674    department_department_id_seq    SEQUENCE     �   ALTER TABLE public.department ALTER COLUMN department_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.department_department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            �            1259    16402    direction_of_preparation    TABLE     �   CREATE TABLE public.direction_of_preparation (
    direction_id integer NOT NULL,
    name character varying(120) NOT NULL,
    level_of_education character varying(20) NOT NULL
);
 ,   DROP TABLE public.direction_of_preparation;
       public         heap    postgres    false            �           0    0    TABLE direction_of_preparation    COMMENT     c   COMMENT ON TABLE public.direction_of_preparation IS 'Направление подготовки';
          public          postgres    false    214            �            1259    16675 )   direction_of_preparation_direction_id_seq    SEQUENCE     �   ALTER TABLE public.direction_of_preparation ALTER COLUMN direction_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.direction_of_preparation_direction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    214            �            1259    16503    disciplines    TABLE     �  CREATE TABLE public.disciplines (
    discipline_id integer NOT NULL,
    name character varying(120) NOT NULL,
    "study_hours_ALL" smallint DEFAULT '0'::smallint NOT NULL,
    study_hours_lectures smallint DEFAULT '0'::smallint NOT NULL,
    study_hours_pactices smallint DEFAULT '0'::smallint NOT NULL,
    study_hours_labs smallint DEFAULT '0'::smallint,
    practice character varying(80),
    control_type character varying(10) NOT NULL
);
    DROP TABLE public.disciplines;
       public         heap    postgres    false            �            1259    16676    disciplines_discipline_id_seq    SEQUENCE     �   ALTER TABLE public.disciplines ALTER COLUMN discipline_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.disciplines_discipline_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            �            1259    16407    educational_program    TABLE     �   CREATE TABLE public.educational_program (
    program_id integer NOT NULL,
    name character varying(120) NOT NULL,
    department integer NOT NULL,
    direction_of_preparation integer NOT NULL
);
 '   DROP TABLE public.educational_program;
       public         heap    postgres    false            �           0    0    TABLE educational_program    COMMENT     d   COMMENT ON TABLE public.educational_program IS 'Образовательная программа';
          public          postgres    false    215            �            1259    16678 "   educational_program_program_id_seq    SEQUENCE     �   ALTER TABLE public.educational_program ALTER COLUMN program_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.educational_program_program_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    215            �            1259    16540    group_distribution    TABLE     �   CREATE TABLE public.group_distribution (
    distribution_id integer NOT NULL,
    "group" integer NOT NULL,
    student integer NOT NULL,
    basis character varying(20) NOT NULL
);
 &   DROP TABLE public.group_distribution;
       public         heap    postgres    false            �            1259    16680 &   group_distribution_distribution_id_seq    SEQUENCE     �   ALTER TABLE public.group_distribution ALTER COLUMN distribution_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.group_distribution_distribution_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    227            �            1259    16529    groups    TABLE     �   CREATE TABLE public.groups (
    group_id integer NOT NULL,
    number character varying(8) NOT NULL,
    curriculum integer NOT NULL,
    date_on date NOT NULL,
    date_off date
);
    DROP TABLE public.groups;
       public         heap    postgres    false            �            1259    16673    groups_group_id_seq    SEQUENCE     �   ALTER TABLE public.groups ALTER COLUMN group_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.groups_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    226            �            1259    16585    midterm_examination    TABLE     3  CREATE TABLE public.midterm_examination (
    examination_id integer NOT NULL,
    curriculum_discipline integer NOT NULL,
    student integer NOT NULL,
    teacher integer NOT NULL,
    classroom integer NOT NULL,
    date date NOT NULL,
    number_try smallint NOT NULL,
    "grade " smallint NOT NULL
);
 '   DROP TABLE public.midterm_examination;
       public         heap    postgres    false            �            1259    16682 &   midterm_examination_examination_id_seq    SEQUENCE     �   ALTER TABLE public.midterm_examination ALTER COLUMN examination_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.midterm_examination_examination_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    229            �            1259    16474    scholarship    TABLE     �   CREATE TABLE public.scholarship (
    scholarship_id integer NOT NULL,
    student integer NOT NULL,
    scholarship_type integer NOT NULL,
    date_on date NOT NULL,
    date_off date NOT NULL
);
    DROP TABLE public.scholarship;
       public         heap    postgres    false            �            1259    16672    scholarship_scholarship_id_seq    SEQUENCE     �   ALTER TABLE public.scholarship ALTER COLUMN scholarship_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.scholarship_scholarship_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            �            1259    16469    scholarship_types    TABLE     �   CREATE TABLE public.scholarship_types (
    type_id integer NOT NULL,
    name character varying(120) NOT NULL,
    financing character varying(120) NOT NULL,
    distribution_type character varying(120) NOT NULL,
    budget integer NOT NULL
);
 %   DROP TABLE public.scholarship_types;
       public         heap    postgres    false            �            1259    16671    scholarship_types_type_id_seq    SEQUENCE     �   ALTER TABLE public.scholarship_types ALTER COLUMN type_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.scholarship_types_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    221            �            1259    16557    session_schedule    TABLE     H  CREATE TABLE public.session_schedule (
    schedule_id integer NOT NULL,
    classroom integer NOT NULL,
    "group" integer NOT NULL,
    curriculum_discipline integer NOT NULL,
    teacher integer NOT NULL,
    meeting_type character varying(15) NOT NULL,
    date date NOT NULL,
    "time" time without time zone NOT NULL
);
 $   DROP TABLE public.session_schedule;
       public         heap    postgres    false            �            1259    16670     session_schedule_schedule_id_seq    SEQUENCE     �   ALTER TABLE public.session_schedule ALTER COLUMN schedule_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.session_schedule_schedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    228            �            1259    16462    students    TABLE     �  CREATE TABLE public.students (
    student_id integer NOT NULL,
    name character varying(120) NOT NULL,
    surname character varying(120) NOT NULL,
    patronymic character varying(120),
    year_of_admission date NOT NULL,
    dob date NOT NULL,
    citizenship character varying(120) NOT NULL,
    passport bigint NOT NULL,
    additional_passport_data character varying(120),
    status character varying(80) NOT NULL
);
    DROP TABLE public.students;
       public         heap    postgres    false            �            1259    16669    students_student_id_seq    SEQUENCE     �   ALTER TABLE public.students ALTER COLUMN student_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.students_student_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220            �            1259    16455    teachers    TABLE     �  CREATE TABLE public.teachers (
    teacher_id integer NOT NULL,
    name character varying(120) NOT NULL,
    surname character varying(120) NOT NULL,
    patronymic character varying(120),
    post character varying(80) NOT NULL,
    academic_degree character varying(80),
    year_of_employment date NOT NULL,
    citizenship character varying(120) NOT NULL,
    passport bigint NOT NULL,
    additional_passport_data character varying(120)
);
    DROP TABLE public.teachers;
       public         heap    postgres    false            �            1259    16666    teachers_teacher_id_seq    SEQUENCE     �   ALTER TABLE public.teachers ALTER COLUMN teacher_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.teachers_teacher_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    219            �            1259    16444    university_buildings    TABLE     X  CREATE TABLE public.university_buildings (
    building_id integer NOT NULL,
    name character varying(120) NOT NULL,
    region character varying(80) NOT NULL,
    city character varying(80) NOT NULL,
    adress character varying(120) NOT NULL,
    time_open time without time zone NOT NULL,
    time_close time without time zone NOT NULL
);
 (   DROP TABLE public.university_buildings;
       public         heap    postgres    false            �            1259    16658 $   university_buildings_building_id_seq    SEQUENCE     �   ALTER TABLE public.university_buildings ALTER COLUMN building_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.university_buildings_building_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218            �          0    16491 
   classrooms 
   TABLE DATA                 public          postgres    false    223   ��       �          0    16512    curriculum_discipline 
   TABLE DATA                 public          postgres    false    225   ��       �          0    16433    curriculums 
   TABLE DATA                 public          postgres    false    217   &�       �          0    16418 
   department 
   TABLE DATA                 public          postgres    false    216   ��       �          0    16402    direction_of_preparation 
   TABLE DATA                 public          postgres    false    214   U�       �          0    16503    disciplines 
   TABLE DATA                 public          postgres    false    224   3�       �          0    16407    educational_program 
   TABLE DATA                 public          postgres    false    215   
�       �          0    16540    group_distribution 
   TABLE DATA                 public          postgres    false    227   3�       �          0    16529    groups 
   TABLE DATA                 public          postgres    false    226   �       �          0    16585    midterm_examination 
   TABLE DATA                 public          postgres    false    229   ��       �          0    16474    scholarship 
   TABLE DATA                 public          postgres    false    222   ��       �          0    16469    scholarship_types 
   TABLE DATA                 public          postgres    false    221   ��       �          0    16557    session_schedule 
   TABLE DATA                 public          postgres    false    228   ��       �          0    16462    students 
   TABLE DATA                 public          postgres    false    220   7�       �          0    16455    teachers 
   TABLE DATA                 public          postgres    false    219   X�       �          0    16444    university_buildings 
   TABLE DATA                 public          postgres    false    218   ��       �           0    0    classrooms_classroom_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.classrooms_classroom_id_seq', 5, true);
          public          postgres    false    242            �           0    0     curriculum_discipline_cur_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.curriculum_discipline_cur_id_seq', 7, true);
          public          postgres    false    244            �           0    0    curriculums_curriculum_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.curriculums_curriculum_id_seq', 22, true);
          public          postgres    false    240            �           0    0    department_department_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.department_department_id_seq', 12, true);
          public          postgres    false    237            �           0    0 )   direction_of_preparation_direction_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.direction_of_preparation_direction_id_seq', 4, true);
          public          postgres    false    238            �           0    0    disciplines_discipline_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.disciplines_discipline_id_seq', 5, true);
          public          postgres    false    239            �           0    0 "   educational_program_program_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.educational_program_program_id_seq', 26, true);
          public          postgres    false    241            �           0    0 &   group_distribution_distribution_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.group_distribution_distribution_id_seq', 14, true);
          public          postgres    false    243            �           0    0    groups_group_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.groups_group_id_seq', 12, true);
          public          postgres    false    236            �           0    0 &   midterm_examination_examination_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.midterm_examination_examination_id_seq', 10, true);
          public          postgres    false    245            �           0    0    scholarship_scholarship_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.scholarship_scholarship_id_seq', 10, true);
          public          postgres    false    235            �           0    0    scholarship_types_type_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.scholarship_types_type_id_seq', 10, true);
          public          postgres    false    234            �           0    0     session_schedule_schedule_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.session_schedule_schedule_id_seq', 26, true);
          public          postgres    false    233            �           0    0    students_student_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.students_student_id_seq', 10, true);
          public          postgres    false    232            �           0    0    teachers_teacher_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.teachers_teacher_id_seq', 11, true);
          public          postgres    false    231            �           0    0 $   university_buildings_building_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.university_buildings_building_id_seq', 13, true);
          public          postgres    false    230            �           2606    16497    classrooms Classrooms_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.classrooms
    ADD CONSTRAINT "Classrooms_pkey" PRIMARY KEY (classroom_id);
 F   ALTER TABLE ONLY public.classrooms DROP CONSTRAINT "Classrooms_pkey";
       public            postgres    false    223            �           2606    16516 0   curriculum_discipline Curriculum_discipline_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.curriculum_discipline
    ADD CONSTRAINT "Curriculum_discipline_pkey" PRIMARY KEY (cur_id);
 \   ALTER TABLE ONLY public.curriculum_discipline DROP CONSTRAINT "Curriculum_discipline_pkey";
       public            postgres    false    225            �           2606    16437    curriculums Curriculum_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.curriculums
    ADD CONSTRAINT "Curriculum_pkey" PRIMARY KEY (curriculum_id);
 G   ALTER TABLE ONLY public.curriculums DROP CONSTRAINT "Curriculum_pkey";
       public            postgres    false    217            �           2606    16422    department Department_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.department
    ADD CONSTRAINT "Department_pkey" PRIMARY KEY (department_id);
 F   ALTER TABLE ONLY public.department DROP CONSTRAINT "Department_pkey";
       public            postgres    false    216            �           2606    16406 6   direction_of_preparation Direction_of_preparation_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.direction_of_preparation
    ADD CONSTRAINT "Direction_of_preparation_pkey" PRIMARY KEY (direction_id);
 b   ALTER TABLE ONLY public.direction_of_preparation DROP CONSTRAINT "Direction_of_preparation_pkey";
       public            postgres    false    214            �           2606    16511    disciplines Disciplines_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.disciplines
    ADD CONSTRAINT "Disciplines_pkey" PRIMARY KEY (discipline_id);
 H   ALTER TABLE ONLY public.disciplines DROP CONSTRAINT "Disciplines_pkey";
       public            postgres    false    224            �           2606    16411 ,   educational_program Educational program_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.educational_program
    ADD CONSTRAINT "Educational program_pkey" PRIMARY KEY (program_id);
 X   ALTER TABLE ONLY public.educational_program DROP CONSTRAINT "Educational program_pkey";
       public            postgres    false    215            �           2606    16544 *   group_distribution Group_distribution_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.group_distribution
    ADD CONSTRAINT "Group_distribution_pkey" PRIMARY KEY (distribution_id);
 V   ALTER TABLE ONLY public.group_distribution DROP CONSTRAINT "Group_distribution_pkey";
       public            postgres    false    227            �           2606    16533    groups Groups_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.groups
    ADD CONSTRAINT "Groups_pkey" PRIMARY KEY (group_id);
 >   ALTER TABLE ONLY public.groups DROP CONSTRAINT "Groups_pkey";
       public            postgres    false    226                       2606    16589 ,   midterm_examination Midterm_examination_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.midterm_examination
    ADD CONSTRAINT "Midterm_examination_pkey" PRIMARY KEY (examination_id);
 X   ALTER TABLE ONLY public.midterm_examination DROP CONSTRAINT "Midterm_examination_pkey";
       public            postgres    false    229            �           2606    16478    scholarship Scholarship_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.scholarship
    ADD CONSTRAINT "Scholarship_pkey" PRIMARY KEY (scholarship_id);
 H   ALTER TABLE ONLY public.scholarship DROP CONSTRAINT "Scholarship_pkey";
       public            postgres    false    222            �           2606    16473 (   scholarship_types Scholarship_types_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.scholarship_types
    ADD CONSTRAINT "Scholarship_types_pkey" PRIMARY KEY (type_id);
 T   ALTER TABLE ONLY public.scholarship_types DROP CONSTRAINT "Scholarship_types_pkey";
       public            postgres    false    221            �           2606    16561 &   session_schedule Session_schedule_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.session_schedule
    ADD CONSTRAINT "Session_schedule_pkey" PRIMARY KEY (schedule_id);
 R   ALTER TABLE ONLY public.session_schedule DROP CONSTRAINT "Session_schedule_pkey";
       public            postgres    false    228            �           2606    16468    students Students_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.students
    ADD CONSTRAINT "Students_pkey" PRIMARY KEY (student_id);
 B   ALTER TABLE ONLY public.students DROP CONSTRAINT "Students_pkey";
       public            postgres    false    220            �           2606    16461    teachers Teachers_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT "Teachers_pkey" PRIMARY KEY (teacher_id);
 B   ALTER TABLE ONLY public.teachers DROP CONSTRAINT "Teachers_pkey";
       public            postgres    false    219            �           2606    16448 .   university_buildings University_buildings_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.university_buildings
    ADD CONSTRAINT "University_buildings_pkey" PRIMARY KEY (building_id);
 Z   ALTER TABLE ONLY public.university_buildings DROP CONSTRAINT "University_buildings_pkey";
       public            postgres    false    218            �           2606    16611    classrooms capacity    CHECK CONSTRAINT     �   ALTER TABLE public.classrooms
    ADD CONSTRAINT capacity CHECK (((capacity > (0)::numeric) AND (capacity < (3000)::numeric))) NOT VALID;
 8   ALTER TABLE public.classrooms DROP CONSTRAINT capacity;
       public          postgres    false    223    223            �           2606    16667    teachers chk_academic_degree    CHECK CONSTRAINT     �   ALTER TABLE public.teachers
    ADD CONSTRAINT chk_academic_degree CHECK (((academic_degree)::text ~ '^[а-яА-Я0-9 -]*$'::text)) NOT VALID;
 A   ALTER TABLE public.teachers DROP CONSTRAINT chk_academic_degree;
       public          postgres    false    219    219            �           2606    16664    university_buildings chk_adress    CHECK CONSTRAINT     �   ALTER TABLE public.university_buildings
    ADD CONSTRAINT chk_adress CHECK (((adress)::text ~ '^[а-яА-Я0-9,.|\/ -]*$'::text)) NOT VALID;
 D   ALTER TABLE public.university_buildings DROP CONSTRAINT chk_adress;
       public          postgres    false    218    218            �           2606    16622    group_distribution chk_basis    CHECK CONSTRAINT     �   ALTER TABLE public.group_distribution
    ADD CONSTRAINT chk_basis CHECK (((basis)::text = ANY (ARRAY[('бюджет'::character varying)::text, ('коммерция'::character varying)::text, ('контракт'::character varying)::text]))) NOT VALID;
 A   ALTER TABLE public.group_distribution DROP CONSTRAINT chk_basis;
       public          postgres    false    227    227            �           2606    16644    teachers chk_citizenship    CHECK CONSTRAINT     �   ALTER TABLE public.teachers
    ADD CONSTRAINT chk_citizenship CHECK (((citizenship)::text ~ '^[а-яА-Я0-9]*$'::text)) NOT VALID;
 =   ALTER TABLE public.teachers DROP CONSTRAINT chk_citizenship;
       public          postgres    false    219    219            �           2606    16665    university_buildings chk_city    CHECK CONSTRAINT     �   ALTER TABLE public.university_buildings
    ADD CONSTRAINT chk_city CHECK (((city)::text ~ '^[а-яА-Я0-9,.|\/ --_ ]*$'::text)) NOT VALID;
 B   ALTER TABLE public.university_buildings DROP CONSTRAINT chk_city;
       public          postgres    false    218    218            �           2606    16620    disciplines chk_control_type    CHECK CONSTRAINT       ALTER TABLE public.disciplines
    ADD CONSTRAINT chk_control_type CHECK (((control_type)::text = ANY (ARRAY[('зачёт'::character varying)::text, ('экзамен'::character varying)::text, ('дифюзачёт'::character varying)::text]))) NOT VALID;
 A   ALTER TABLE public.disciplines DROP CONSTRAINT chk_control_type;
       public          postgres    false    224    224            �           2606    16627    groups chk_date    CHECK CONSTRAINT     _   ALTER TABLE public.groups
    ADD CONSTRAINT chk_date CHECK ((date_on <= date_off)) NOT VALID;
 4   ALTER TABLE public.groups DROP CONSTRAINT chk_date;
       public          postgres    false    226    226    226    226            �           2606    16628    scholarship chk_date    CHECK CONSTRAINT     d   ALTER TABLE public.scholarship
    ADD CONSTRAINT chk_date CHECK ((date_on <= date_off)) NOT VALID;
 9   ALTER TABLE public.scholarship DROP CONSTRAINT chk_date;
       public          postgres    false    222    222    222    222            �           2606    16631    scholarship_types chk_dist_type    CHECK CONSTRAINT     �   ALTER TABLE public.scholarship_types
    ADD CONSTRAINT chk_dist_type CHECK (((distribution_type)::text ~ '^[а-яА-Я0-9]*$'::text)) NOT VALID;
 D   ALTER TABLE public.scholarship_types DROP CONSTRAINT chk_dist_type;
       public          postgres    false    221    221            �           2606    16630    scholarship_types chk_fin    CHECK CONSTRAINT     �   ALTER TABLE public.scholarship_types
    ADD CONSTRAINT chk_fin CHECK (((financing)::text ~ '^[а-яА-Я0-9]*$'::text)) NOT VALID;
 >   ALTER TABLE public.scholarship_types DROP CONSTRAINT chk_fin;
       public          postgres    false    221    221            �           2606    16615 "   direction_of_preparation chk_level    CHECK CONSTRAINT     (  ALTER TABLE public.direction_of_preparation
    ADD CONSTRAINT chk_level CHECK (((level_of_education)::text = ANY (ARRAY[('бакалавриат'::character varying)::text, ('магистратура'::character varying)::text, ('аспирантура'::character varying)::text]))) NOT VALID;
 G   ALTER TABLE public.direction_of_preparation DROP CONSTRAINT chk_level;
       public          postgres    false    214    214            �           2606    16632    session_schedule chk_meet    CHECK CONSTRAINT     �   ALTER TABLE public.session_schedule
    ADD CONSTRAINT chk_meet CHECK (((meeting_type)::text ~ '^[а-яА-Я0-9]*$'::text)) NOT VALID;
 >   ALTER TABLE public.session_schedule DROP CONSTRAINT chk_meet;
       public          postgres    false    228    228            �           2606    16613    department chk_name    CHECK CONSTRAINT     y   ALTER TABLE public.department
    ADD CONSTRAINT chk_name CHECK (((name)::text ~ '^[а-яА-Я0-9]*$'::text)) NOT VALID;
 8   ALTER TABLE public.department DROP CONSTRAINT chk_name;
       public          postgres    false    216    216            �           2606    16614 !   direction_of_preparation chk_name    CHECK CONSTRAINT     �   ALTER TABLE public.direction_of_preparation
    ADD CONSTRAINT chk_name CHECK (((name)::text ~ '^[а-яА-Я0-9]*$'::text)) NOT VALID;
 F   ALTER TABLE public.direction_of_preparation DROP CONSTRAINT chk_name;
       public          postgres    false    214    214            �           2606    16616    disciplines chk_name    CHECK CONSTRAINT     z   ALTER TABLE public.disciplines
    ADD CONSTRAINT chk_name CHECK (((name)::text ~ '^[а-яА-Я0-9]*$'::text)) NOT VALID;
 9   ALTER TABLE public.disciplines DROP CONSTRAINT chk_name;
       public          postgres    false    224    224            �           2606    16621    educational_program chk_name    CHECK CONSTRAINT     �   ALTER TABLE public.educational_program
    ADD CONSTRAINT chk_name CHECK (((name)::text ~ '^[а-яА-Я0-9]*$'::text)) NOT VALID;
 A   ALTER TABLE public.educational_program DROP CONSTRAINT chk_name;
       public          postgres    false    215    215            �           2606    16629    scholarship_types chk_name    CHECK CONSTRAINT     �   ALTER TABLE public.scholarship_types
    ADD CONSTRAINT chk_name CHECK (((name)::text ~ '^[а-яА-Я0-9]*$'::text)) NOT VALID;
 ?   ALTER TABLE public.scholarship_types DROP CONSTRAINT chk_name;
       public          postgres    false    221    221            �           2606    16633    students chk_name    CHECK CONSTRAINT     z   ALTER TABLE public.students
    ADD CONSTRAINT chk_name CHECK (((name)::text ~ '^[а-яА-Яa-zA-Z]*$'::text)) NOT VALID;
 6   ALTER TABLE public.students DROP CONSTRAINT chk_name;
       public          postgres    false    220    220            �           2606    16638    teachers chk_name    CHECK CONSTRAINT     z   ALTER TABLE public.teachers
    ADD CONSTRAINT chk_name CHECK (((name)::text ~ '^[а-яА-Яa-zA-Z]*$'::text)) NOT VALID;
 6   ALTER TABLE public.teachers DROP CONSTRAINT chk_name;
       public          postgres    false    219    219            �           2606    16663    university_buildings chk_name    CHECK CONSTRAINT     �   ALTER TABLE public.university_buildings
    ADD CONSTRAINT chk_name CHECK (((name)::text ~ '^[а-яА-Я0-9,.|\/  -]*$'::text)) NOT VALID;
 B   ALTER TABLE public.university_buildings DROP CONSTRAINT chk_name;
       public          postgres    false    218    218            �           2606    16626    groups chk_number    CHECK CONSTRAINT     y   ALTER TABLE public.groups
    ADD CONSTRAINT chk_number CHECK (((number)::text ~ '^[а-яА-Я0-9]*$'::text)) NOT VALID;
 6   ALTER TABLE public.groups DROP CONSTRAINT chk_number;
       public          postgres    false    226    226            �           2606    16635    students chk_patr    CHECK CONSTRAINT     �   ALTER TABLE public.students
    ADD CONSTRAINT chk_patr CHECK (((patronymic)::text ~ '^[а-яА-Яa-zA-Z]*$'::text)) NOT VALID;
 6   ALTER TABLE public.students DROP CONSTRAINT chk_patr;
       public          postgres    false    220    220            �           2606    16640    teachers chk_patr    CHECK CONSTRAINT     �   ALTER TABLE public.teachers
    ADD CONSTRAINT chk_patr CHECK (((patronymic)::text ~ '^[а-яА-Яa-zA-Z]*$'::text)) NOT VALID;
 6   ALTER TABLE public.teachers DROP CONSTRAINT chk_patr;
       public          postgres    false    219    219            �           2606    16668    teachers chk_post    CHECK CONSTRAINT     y   ALTER TABLE public.teachers
    ADD CONSTRAINT chk_post CHECK (((post)::text ~ '^[а-яА-Я0-9 -]*$'::text)) NOT VALID;
 6   ALTER TABLE public.teachers DROP CONSTRAINT chk_post;
       public          postgres    false    219    219            �           2606    16619    disciplines chk_practice    CHECK CONSTRAINT     I  ALTER TABLE public.disciplines
    ADD CONSTRAINT chk_practice CHECK (((practice)::text = ANY (ARRAY[('учебная'::character varying)::text, ('производственная'::character varying)::text, ('ознакомительная'::character varying)::text, ('научная'::character varying)::text]))) NOT VALID;
 =   ALTER TABLE public.disciplines DROP CONSTRAINT chk_practice;
       public          postgres    false    224    224            �           2606    16662    university_buildings chk_region    CHECK CONSTRAINT     �   ALTER TABLE public.university_buildings
    ADD CONSTRAINT chk_region CHECK (((region)::text ~ '^[а-яА-Я0-9,.|\/  -]*$'::text)) NOT VALID;
 D   ALTER TABLE public.university_buildings DROP CONSTRAINT chk_region;
       public          postgres    false    218    218            �           2606    16637    students chk_status    CHECK CONSTRAINT       ALTER TABLE public.students
    ADD CONSTRAINT chk_status CHECK (((status)::text = ANY (ARRAY[('стулент'::character varying)::text, ('отчислен'::character varying)::text, ('в академическом отпуске'::character varying)::text]))) NOT VALID;
 8   ALTER TABLE public.students DROP CONSTRAINT chk_status;
       public          postgres    false    220    220            �           2606    16634    students chk_surname    CHECK CONSTRAINT     �   ALTER TABLE public.students
    ADD CONSTRAINT chk_surname CHECK (((surname)::text ~ '^[а-яА-Яa-zA-Z]*$'::text)) NOT VALID;
 9   ALTER TABLE public.students DROP CONSTRAINT chk_surname;
       public          postgres    false    220    220            �           2606    16639    teachers chk_surname    CHECK CONSTRAINT     �   ALTER TABLE public.teachers
    ADD CONSTRAINT chk_surname CHECK (((surname)::text ~ '^[а-яА-Яa-zA-Z]*$'::text)) NOT VALID;
 9   ALTER TABLE public.teachers DROP CONSTRAINT chk_surname;
       public          postgres    false    219    219            �           2606    16657    university_buildings chk_time    CHECK CONSTRAINT     q   ALTER TABLE public.university_buildings
    ADD CONSTRAINT chk_time CHECK ((time_open <= time_close)) NOT VALID;
 B   ALTER TABLE public.university_buildings DROP CONSTRAINT chk_time;
       public          postgres    false    218    218    218    218            �           2606    16612    curriculums chk_year    CHECK CONSTRAINT     e   ALTER TABLE public.curriculums
    ADD CONSTRAINT chk_year CHECK ((year <= CURRENT_DATE)) NOT VALID;
 9   ALTER TABLE public.curriculums DROP CONSTRAINT chk_year;
       public          postgres    false    217    217            �           2606    16636    students chk_year    CHECK CONSTRAINT     n   ALTER TABLE public.students
    ADD CONSTRAINT chk_year CHECK ((year_of_admission < CURRENT_DATE)) NOT VALID;
 6   ALTER TABLE public.students DROP CONSTRAINT chk_year;
       public          postgres    false    220    220            �           2606    16643    teachers chk_year    CHECK CONSTRAINT     p   ALTER TABLE public.teachers
    ADD CONSTRAINT chk_year CHECK ((year_of_employment <= CURRENT_DATE)) NOT VALID;
 6   ALTER TABLE public.teachers DROP CONSTRAINT chk_year;
       public          postgres    false    219    219            �           1259    16454    fki_Building_key    INDEX     X   CREATE INDEX "fki_Building_key" ON public.department USING btree (university_building);
 &   DROP INDEX public."fki_Building_key";
       public            postgres    false    216                        1259    16584    fki_Classroom_key    INDEX     U   CREATE INDEX "fki_Classroom_key" ON public.session_schedule USING btree (classroom);
 '   DROP INDEX public."fki_Classroom_key";
       public            postgres    false    228            �           1259    16539    fki_Curriculum_key    INDEX     M   CREATE INDEX "fki_Curriculum_key" ON public.groups USING btree (curriculum);
 (   DROP INDEX public."fki_Curriculum_key";
       public            postgres    false    226            �           1259    16528    fki_Discipline_key    INDEX     _   CREATE INDEX "fki_Discipline_key" ON public.curriculum_discipline USING btree (discipline_id);
 (   DROP INDEX public."fki_Discipline_key";
       public            postgres    false    225            �           1259    16556    fki_Group_key    INDEX     Q   CREATE INDEX "fki_Group_key" ON public.group_distribution USING btree ("group");
 #   DROP INDEX public."fki_Group_key";
       public            postgres    false    227            �           1259    16484    fki_Scholarship_type_key    INDEX     ^   CREATE INDEX "fki_Scholarship_type_key" ON public.scholarship USING btree (scholarship_type);
 .   DROP INDEX public."fki_Scholarship_type_key";
       public            postgres    false    222            �           1259    16550    fki_Student_key    INDEX     S   CREATE INDEX "fki_Student_key" ON public.group_distribution USING btree (student);
 %   DROP INDEX public."fki_Student_key";
       public            postgres    false    227                       1259    16573    fki_Teacher_key    INDEX     Q   CREATE INDEX "fki_Teacher_key" ON public.session_schedule USING btree (teacher);
 %   DROP INDEX public."fki_Teacher_key";
       public            postgres    false    228            �           1259    16522    fki_curriculum_key    INDEX     ]   CREATE INDEX fki_curriculum_key ON public.curriculum_discipline USING btree (curriculum_id);
 &   DROP INDEX public.fki_curriculum_key;
       public            postgres    false    225            �           1259    16432    fki_department_key    INDEX     X   CREATE INDEX fki_department_key ON public.educational_program USING btree (department);
 &   DROP INDEX public.fki_department_key;
       public            postgres    false    215            �           1259    16417    fki_direction_key    INDEX     e   CREATE INDEX fki_direction_key ON public.educational_program USING btree (direction_of_preparation);
 %   DROP INDEX public.fki_direction_key;
       public            postgres    false    215                       1259    16567    fki_discipline_key    INDEX     `   CREATE INDEX fki_discipline_key ON public.session_schedule USING btree (curriculum_discipline);
 &   DROP INDEX public.fki_discipline_key;
       public            postgres    false    228            �           1259    16443    fki_program_key    INDEX     V   CREATE INDEX fki_program_key ON public.curriculums USING btree (educational_program);
 #   DROP INDEX public.fki_program_key;
       public            postgres    false    217            �           1259    16490    fki_student_key    INDEX     J   CREATE INDEX fki_student_key ON public.scholarship USING btree (student);
 #   DROP INDEX public.fki_student_key;
       public            postgres    false    222                       2606    16449    department Building_key    FK CONSTRAINT     �   ALTER TABLE ONLY public.department
    ADD CONSTRAINT "Building_key" FOREIGN KEY (university_building) REFERENCES public.university_buildings(building_id) NOT VALID;
 C   ALTER TABLE ONLY public.department DROP CONSTRAINT "Building_key";
       public          postgres    false    3300    216    218                       2606    16498    classrooms Building_key    FK CONSTRAINT     �   ALTER TABLE ONLY public.classrooms
    ADD CONSTRAINT "Building_key" FOREIGN KEY (building) REFERENCES public.university_buildings(building_id) NOT VALID;
 C   ALTER TABLE ONLY public.classrooms DROP CONSTRAINT "Building_key";
       public          postgres    false    223    218    3300                       2606    16579    session_schedule Classroom_key    FK CONSTRAINT     �   ALTER TABLE ONLY public.session_schedule
    ADD CONSTRAINT "Classroom_key" FOREIGN KEY (classroom) REFERENCES public.classrooms(classroom_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 J   ALTER TABLE ONLY public.session_schedule DROP CONSTRAINT "Classroom_key";
       public          postgres    false    223    3312    228                       2606    16605 !   midterm_examination Classroom_key    FK CONSTRAINT     �   ALTER TABLE ONLY public.midterm_examination
    ADD CONSTRAINT "Classroom_key" FOREIGN KEY (classroom) REFERENCES public.classrooms(classroom_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 M   ALTER TABLE ONLY public.midterm_examination DROP CONSTRAINT "Classroom_key";
       public          postgres    false    229    223    3312                       2606    16517 $   curriculum_discipline Curriculum_key    FK CONSTRAINT     �   ALTER TABLE ONLY public.curriculum_discipline
    ADD CONSTRAINT "Curriculum_key" FOREIGN KEY (curriculum_id) REFERENCES public.curriculums(curriculum_id) NOT VALID;
 P   ALTER TABLE ONLY public.curriculum_discipline DROP CONSTRAINT "Curriculum_key";
       public          postgres    false    225    217    3297                       2606    16534    groups Curriculum_key    FK CONSTRAINT     �   ALTER TABLE ONLY public.groups
    ADD CONSTRAINT "Curriculum_key" FOREIGN KEY (curriculum) REFERENCES public.curriculums(curriculum_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 A   ALTER TABLE ONLY public.groups DROP CONSTRAINT "Curriculum_key";
       public          postgres    false    226    3297    217                       2606    16523 $   curriculum_discipline Discipline_key    FK CONSTRAINT     �   ALTER TABLE ONLY public.curriculum_discipline
    ADD CONSTRAINT "Discipline_key" FOREIGN KEY (discipline_id) REFERENCES public.disciplines(discipline_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 P   ALTER TABLE ONLY public.curriculum_discipline DROP CONSTRAINT "Discipline_key";
       public          postgres    false    3314    225    224                       2606    16562    session_schedule Discipline_key    FK CONSTRAINT     �   ALTER TABLE ONLY public.session_schedule
    ADD CONSTRAINT "Discipline_key" FOREIGN KEY (curriculum_discipline) REFERENCES public.curriculum_discipline(cur_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 K   ALTER TABLE ONLY public.session_schedule DROP CONSTRAINT "Discipline_key";
       public          postgres    false    225    228    3316                       2606    16590 "   midterm_examination Discipline_key    FK CONSTRAINT     �   ALTER TABLE ONLY public.midterm_examination
    ADD CONSTRAINT "Discipline_key" FOREIGN KEY (curriculum_discipline) REFERENCES public.curriculum_discipline(cur_id) NOT VALID;
 N   ALTER TABLE ONLY public.midterm_examination DROP CONSTRAINT "Discipline_key";
       public          postgres    false    3316    229    225                       2606    16551    group_distribution Group_key    FK CONSTRAINT     �   ALTER TABLE ONLY public.group_distribution
    ADD CONSTRAINT "Group_key" FOREIGN KEY ("group") REFERENCES public.groups(group_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 H   ALTER TABLE ONLY public.group_distribution DROP CONSTRAINT "Group_key";
       public          postgres    false    3320    227    226                       2606    16574    session_schedule Group_key    FK CONSTRAINT     �   ALTER TABLE ONLY public.session_schedule
    ADD CONSTRAINT "Group_key" FOREIGN KEY ("group") REFERENCES public.groups(group_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 F   ALTER TABLE ONLY public.session_schedule DROP CONSTRAINT "Group_key";
       public          postgres    false    226    3320    228            	           2606    16485    scholarship Student_key    FK CONSTRAINT     �   ALTER TABLE ONLY public.scholarship
    ADD CONSTRAINT "Student_key" FOREIGN KEY (student) REFERENCES public.students(student_id) NOT VALID;
 C   ALTER TABLE ONLY public.scholarship DROP CONSTRAINT "Student_key";
       public          postgres    false    3304    222    220                       2606    16545    group_distribution Student_key    FK CONSTRAINT     �   ALTER TABLE ONLY public.group_distribution
    ADD CONSTRAINT "Student_key" FOREIGN KEY (student) REFERENCES public.students(student_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 J   ALTER TABLE ONLY public.group_distribution DROP CONSTRAINT "Student_key";
       public          postgres    false    3304    227    220                       2606    16595    midterm_examination Student_key    FK CONSTRAINT     �   ALTER TABLE ONLY public.midterm_examination
    ADD CONSTRAINT "Student_key" FOREIGN KEY (student) REFERENCES public.group_distribution(distribution_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 K   ALTER TABLE ONLY public.midterm_examination DROP CONSTRAINT "Student_key";
       public          postgres    false    229    227    3323                       2606    16568    session_schedule Teacher_key    FK CONSTRAINT     �   ALTER TABLE ONLY public.session_schedule
    ADD CONSTRAINT "Teacher_key" FOREIGN KEY (teacher) REFERENCES public.teachers(teacher_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 H   ALTER TABLE ONLY public.session_schedule DROP CONSTRAINT "Teacher_key";
       public          postgres    false    219    228    3302                       2606    16600    midterm_examination Teacher_key    FK CONSTRAINT     �   ALTER TABLE ONLY public.midterm_examination
    ADD CONSTRAINT "Teacher_key" FOREIGN KEY (teacher) REFERENCES public.teachers(teacher_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 K   ALTER TABLE ONLY public.midterm_examination DROP CONSTRAINT "Teacher_key";
       public          postgres    false    219    3302    229            
           2606    16479    scholarship Type_key    FK CONSTRAINT     �   ALTER TABLE ONLY public.scholarship
    ADD CONSTRAINT "Type_key" FOREIGN KEY (scholarship_type) REFERENCES public.scholarship_types(type_id) NOT VALID;
 @   ALTER TABLE ONLY public.scholarship DROP CONSTRAINT "Type_key";
       public          postgres    false    222    221    3306                       2606    16427 "   educational_program department_key    FK CONSTRAINT     �   ALTER TABLE ONLY public.educational_program
    ADD CONSTRAINT department_key FOREIGN KEY (department) REFERENCES public.department(department_id) NOT VALID;
 L   ALTER TABLE ONLY public.educational_program DROP CONSTRAINT department_key;
       public          postgres    false    215    216    3294                       2606    16412 !   educational_program direction_key    FK CONSTRAINT     �   ALTER TABLE ONLY public.educational_program
    ADD CONSTRAINT direction_key FOREIGN KEY (direction_of_preparation) REFERENCES public.direction_of_preparation(direction_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 K   ALTER TABLE ONLY public.educational_program DROP CONSTRAINT direction_key;
       public          postgres    false    215    214    3288                       2606    16438    curriculums program_key    FK CONSTRAINT     �   ALTER TABLE ONLY public.curriculums
    ADD CONSTRAINT program_key FOREIGN KEY (educational_program) REFERENCES public.educational_program(program_id) NOT VALID;
 A   ALTER TABLE ONLY public.curriculums DROP CONSTRAINT program_key;
       public          postgres    false    217    215    3290            �   �   x���v
Q���W((M��L�K�I,..���-V�s
�t��sW�q�Us�	u���
�:
�:
�Ɖ�:
F`NNjrIf~���5�'E�M7�nhdL}Ӎ��mP765K�n
6<1�r�M`�6619�j�6���\$s�� �&}�      �   �   x���v
Q���W((M��L�K.-*�L.�)͍O�,N�,���KU�s
�t��sW�q�Us�	u���
�:
F:
�f��\��2d �S�Lc���4�DGd�%5�4�Q kd@M3� fR�Lsp���� H��      �   �   x���v
Q���W((M��L�K.-*�L.�)�-V�s
�t��sW�q�Us�	u���
�f:
��:
�FFF������\��j��`DuC-�N5��j@=S-��Z@L5���F� 0����@S�n*0��L1L�� ���      �   �   x���v
Q���W((M��L�KI-H,*�M�+Q�s
�t��sW�q�Us�	u���
�:
�f\�ua�������5�'E��\xa1�� #�(7�d$ԅƔg2nЍs@�� ��f      �   �   x���v
Q���W((M��L�K�,JM.��ϋ�O�/(J-H,Jq��\��<]<���#�C\}�}B]!d��������M6\쾰��� �ņ�A2�"��$�	(�(פ�i��IE7�l�4�d��nc�M���l� �{���v\l��
 �*�n�k7�즋��.�۽�b��@���]؋l3 Xُ      �   �   x���v
Q���W((M��L�K�,N�,���K-V�s
�t��sW�q�Us�	u���
�:
�&^����`hb�� ¦@D~�>>@ً�v]�~aÅ=�^ث�i��I��F +�\�p�	l(���b�`r�����n�	��y@8�����,���¾��$��=v�������P؊�9 �\l�8�b�)\\ ���      �     x����J�@��y��U!HvZ��I0Ȃ��Ă'�U�Pm)�^<�!/�`K|����b�}�0���c����(	�d�`�x��GGO��Q�6��f���|�<�^`0�X^��
��$o`xq}�5���C��*Z�7UD��{��!�5���Y6���T�{�)|�1"�Y(L�,- ��8@[�]Fĩu�J��˙(;�%� �A��K�4絉�	�������ѽ�r��cڰ�M}�8���g�m-}�G�P5�j@�}D�����e���_�#��      �   �   x���v
Q���W((M��L�K/�/-�O�,.)�L*-���S�s
�t��sW�q�Us�	u���
�:
�:
@R��Ƌ}�\�va��&uMk.O��o6߈f���7���&`�Mhf�)�|S��o6ߌf曃�7���4N��46�Ѐ��:3/���.컰�b�ņ.좪-�,
+�X��^l��va��~*Z�� /Yഇ� @��K      �   �   x���v
Q���W((M��L�K/�/-(V�s
�t��sW�q�Us�	u���
�:
�f\Xljd���`h��X��Cx&�f����\�d[dh ���d��9�lC�L�b�!Ȧ���l�����@6M�0���d�%?qq �=p{      �   �   x����
�0E���٩�J�Mp%X$��*�_��U?ߚ���.w ��d�͊4/�f�n���:���8���鵫���Q]/�\�yn�6�A�)�t��|�b�0�uOr�B�2��s4��%`��#�H:�b�܍� ,�t��n�0��1�h�-��_$�X� c��P���XIs��źz(��t0�s^t��C�a:������kGÒ~1A������Д�4� x3�%�      �   �   x�����0���ߛ3��6�SЈA)8:�!I���ic;7xvy��>UhYՠ������v7��kx����ldU��*ΠﺖWh���\^�`ESLi�ɬ��x�p�=D�?5fm�	# ���e$I�n]���ԵG�h�ݻ��$��[� $L�@�u	B�$�dv]̛06�An[m�	4a��`3�՘y�߈���\�      �   @  x���v
Q���W((M��L�+N���I,*��,�/�,H-V�s
�t��sW�q�Us�	u���
�:
�^�w��.��sa���AⓁ��/l�4 YM6]�
��{a߅�`�z6��{.l�� b��@Ӛ˓n4�4���$�n����.�>�<��e	��@w4 m�	\�@qP�!�g�m�~�;ہ�5^�Eb(����oX�	u�g
Gp��d7Ж`��]�,%�e��V3|�e9�r�]e�=�`�=GP��r���Tv�%��=�h��'yr (��      �   (  x�͓�J�@��y��E!��I[���,h
I,x�E�лVЋ��C������9��JD<���������W�Ơ��w���p��&i:���H���x�@�:R�1D�Q�B���̯j[]�^Y��iNS������3
t[��Ba&�����>�T�w@^-���_��2�Ќrʖ���l��2����$����9L/��,�,n�,�@�!�jҰ䴠B?�G����~��]�5(֚���e�M
G���o�����/��/�b5�tk��W�a=�L���v��|      �     x���AKA���{[�03��n�$4���ĀW������MJ�A��� ���btq����7�����ncS����3;;�}�޼��z��D�������v�|px��f���Y�ԛ��U�x��6[����YYݨ�ߖ�$^:.�� �0qg�a
�ǐ�4'���f�%�U&�z�O�����ڏ8ҫT� �qz7P'pK�9\��,K.B�?�w0�&��X.E�@��ĸ�;�#͌�!	&mHO
^�Z�G�>��	�uJ� ������T���`'<Y2��êP��fDi��N��0�"�<�}&��<c�a��8��:V�:	�L�{<4`��+�f�1�b`Aˏ�(�7����q�ӺDw#�c�x��!�InA3XXZ`��S�~.�+!sv���
2ѳO�4*���k������5����o��ۈ��m<�;�̳�˼�Aqp��\�IV����ZfE9�j��N*x�ٚ��+O��32�Ӳ���|������/��M�=�[U�zKn1\��T��b�0      �   j  x����J�@��y��U���h��I0H@Shj�G-��=�����x/���`���f���M\k1P�K���c;�U�3۩W�����Q�t��o�O�X�a�j���l3��֭]���ٳҷ˖�WX��!�S6$Л�!�{A��}���T��j�H�QC��0�	�sQ�"��
d[��}d��wЗ�c\��1���K����eE�&�A�5�5唯)��!�1�Vs�C,%b0�(x.��Ocy��˯wH�R*ޔ�$�JcҐ�)�,�;��B��:&��`B%RpOR�?��y�QΝǪ>��\ȝ���� ���E���Kv�0>I���d�}>�"�����O�^������      �   P  x�Ւ�J�@��y��U!J�z�z��X�I��JkoM
^<x���/�m$�I^a�����z���ev��??ִ�v���\�ݞw������w}{���ޙ׿@�mض�oZ�t�8����Q���5j��sd8Ō�c�b·X�j�=�3�i���(��G�'"�<�2��2Ly���QʄJq&��d�1��T��E�B8�ZP7JWa�)��M�%l��m��*�_�KU����1�ԙ��/�l�"z5���_*�r��V@�]֒,�N,#�%LJ$�H� iT#y�i�4e"�\*�$Y����^�W>����!SAח�P�/_D$M     
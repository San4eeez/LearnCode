CREATE TABLE public.lessons (
    id integer NOT NULL,
    topic_id integer,
    title character varying(100) NOT NULL,
    content text NOT NULL,
    example_code text,
    difficulty integer DEFAULT 1,
    video_link text
);
ALTER TABLE public.lessons OWNER TO postgres;
CREATE SEQUENCE public.lessons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.lessons_id_seq OWNER TO postgres;
ALTER SEQUENCE public.lessons_id_seq OWNED BY public.lessons.id;
CREATE TABLE public.programming_languages (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);
ALTER TABLE public.programming_languages OWNER TO postgres;
CREATE SEQUENCE public.programming_languages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.programming_languages_id_seq OWNER TO postgres;
ALTER SEQUENCE public.programming_languages_id_seq OWNED BY public.programming_languages.id;
CREATE TABLE public.topics (
    id integer NOT NULL,
    language_id integer,
    title character varying(100) NOT NULL,
    description text
);
ALTER TABLE public.topics OWNER TO postgres;
CREATE SEQUENCE public.topics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.topics_id_seq OWNER TO postgres;
ALTER SEQUENCE public.topics_id_seq OWNED BY public.topics.id;
CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    password_hash character varying(255) NOT NULL,
    email character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
ALTER TABLE public.users OWNER TO postgres;
CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.users_id_seq OWNER TO postgres;
ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
ALTER TABLE ONLY public.lessons ALTER COLUMN id SET DEFAULT nextval('public.lessons_id_seq'::regclass);
ALTER TABLE ONLY public.programming_languages ALTER COLUMN id SET DEFAULT nextval('public.programming_languages_id_seq'::regclass);
ALTER TABLE ONLY public.topics ALTER COLUMN id SET DEFAULT nextval('public.topics_id_seq'::regclass);
ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
INSERT INTO public.lessons VALUES (4, 1, 'Игра на открытых струнах', 'Игра на открытых струнах гитары. Открытые струны - это струны, которые звучат без нажатия на гриф. Это основа для многих аккордов и мелодий.', 'C: x02010\nG: 320003\nD: xx0232', 1);
INSERT INTO public.lessons VALUES (5, 1, 'Простые аккорды', 'Игра простых аккордов на гитаре. Начните с изучения основных аккордов, таких как C, G, D, и E. Практикуйте переходы между ними для улучшения навыков.', 'C: x32010\nG: 320003\nD: xx0232\nE: 022100', 1);
INSERT INTO public.lessons VALUES (6, 1, 'Перебор струн', 'Техника перебора струн на гитаре. Перебор - это техника игры, при которой пальцы правой руки поочередно бьют по струнам. Практикуйте различные ритмы и паттерны для улучшения координации.', 'p i m a i m\np i m a m i\np i m a i m a', 2);
INSERT INTO public.lessons VALUES (7, 2, 'Бой медиатором', 'Техника игры медиатором. Медиатор - это инструмент, который помогает создавать четкий и ритмичный звук. Практикуйте различные ритмы и паттерны для улучшения навыков.', 'Вниз-вверх-вниз-вверх\nВниз-вверх-вверх-вниз\nВниз-вниз-вверх-вверх', 1);
INSERT INTO public.lessons VALUES (8, 2, 'Сложные аккорды', 'Игра сложных аккордов на гитаре. Сложные аккорды требуют больше пальцев и могут быть сложнее для исполнения. Практикуйте переходы между ними для улучшения навыков.', 'F: 133211\nB7: x21202\nC7: x32010\nG7: 320001', 2);
INSERT INTO public.lessons VALUES (9, 2, 'Арпеджио', 'Техника игры арпеджио на гитаре. Арпеджио - это техника игры, при которой ноты аккорда играются поочередно. Практикуйте различные паттерны и ритмы для улучшения навыков.', 'p i m a m i\np i m a i m\np i m a m i a', 2);
INSERT INTO public.lessons VALUES (10, 4, 'Игра на открытых струнах', 'Игра на открытых струнах скрипки. Открытые струны - это струны, которые звучат без нажатия на гриф. Это основа для многих аккордов и мелодий.', 'G D A E\nA E G D\nD G A E', 1);
INSERT INTO public.lessons VALUES (11, 4, 'Простые мелодии', 'Игра простых мелодий на скрипке. Начните с изучения простых мелодий, таких как "Twinkle, Twinkle, Little Star" и "Mary Had a Little Lamb". Практикуйте переходы между нотами для улучшения навыков.', 'G A B C D E F# G\nC D E F G A B C', 1);
INSERT INTO public.lessons VALUES (12, 4, 'Вибрато', 'Техника вибрато на скрипке. Вибрато - это техника игры, при которой палец колеблется на ноте, создавая вибрационный эффект. Практикуйте различные скорости и амплитуды для улучшения навыков.', 'Колебание пальца на ноте\nМедленное вибрато\nБыстрое вибрато', 2);
INSERT INTO public.lessons VALUES (13, 7, 'Простые ритмы', 'Игра простых ритмов на барабанах. Начните с изучения основных ритмов, таких как 4/4 и 3/4. Практикуйте различные ритмы и паттерны для улучшения навыков.', 'Бас-барабан, малый барабан\nБас-малый-бас-малый\nБас-малый-малый-бас', 1);
INSERT INTO public.lessons VALUES (14, 7, 'Дробь', 'Техника игры дроби на барабанах. Дробь - это техника игры, при которой барабаны играются в быстром темпе. Практикуйте различные ритмы и паттерны для улучшения навыков.', 'Басс-малый-басс-малый\nБасс-малый-малый-басс\nБасс-малый-басс-малый-малый', 1);
INSERT INTO public.lessons VALUES (15, 7, 'Синкопированный ритм', 'Игра синкопированных ритмов на барабанах. Синкопированный ритм - это ритм, в котором акцент смещен с сильной доли. Практикуйте различные ритмы и паттерны для улучшения навыков.', 'Смещение акцента с сильной доли\nСинкопированный ритм 1\nСинкопированный ритм 2', 2);
INSERT INTO public.lessons VALUES (16, 8, 'Простые мелодии', 'Игра простых мелодий на флейте. Начните с изучения простых мелодий, таких как "Twinkle, Twinkle, Little Star" и "Mary Had a Little Lamb". Практикуйте переходы между нотами для улучшения навыков.', 'C D E F G A B C\nG A B C D E F# G', 1);
INSERT INTO public.lessons VALUES (17, 8, 'Стаккато', 'Техника игры стаккато на флейте. Стаккато - это техника игры, при которой ноты играются коротко и отрывисто. Практикуйте различные ритмы и паттерны для улучшения навыков.', 'Короткие отрывистые ноты\nСтаккато 1\nСтаккато 2', 2);
INSERT INTO public.lessons VALUES (18, 8, 'Тремоло', 'Техника игры тремоло на флейте. Тремоло - это техника игры, при которой ноты повторяются быстро. Практикуйте различные скорости и ритмы для улучшения навыков.', 'Быстрое повторение ноты\nТремоло 1\nТремоло 2', 2);
INSERT INTO public.lessons VALUES (19, 11, 'Простые мелодии', 'Игра простых мелодий на трубе. Начните с изучения простых мелодий, таких как "Twinkle, Twinkle, Little Star" и "Mary Had a Little Lamb". Практикуйте переходы между нотами для улучшения навыков.', 'C D E F G\nG A B C D E F# G', 1);
INSERT INTO public.lessons VALUES (20, 11, 'Глиссандо', 'Техника игры глиссандо на трубе. Глиссандо - это техника игры, при которой ноты скользят между собой. Практикуйте различные скорости и ритмы для улучшения навыков.', 'Скольжение между нотами\nГлиссандо 1\nГлиссандо 2', 2);
INSERT INTO public.lessons VALUES (21, 11, 'Дубль-стаккато', 'Техника игры дубль-стаккато на трубе. Дубль-стаккато - это техника игры, при которой ноты играются очень коротко и отрывисто. Практикуйте различные ритмы и паттерны для улучшения навыков.', 'Очень короткие отрывистые ноты\nДубль-стаккато 1\nДубль-стаккато 2', 2);
INSERT INTO public.lessons VALUES (22, 14, 'Простые мелодии', 'Игра простых мелодий на кларнете. Начните с изучения простых мелодий, таких как "Twinkle, Twinkle, Little Star" и "Mary Had a Little Lamb". Практикуйте переходы между нотами для улучшения навыков.', 'C D E F G A B C\nG A B C D E F# G', 1);
INSERT INTO public.lessons VALUES (23, 14, 'Флажолеты', 'Техника игры флажолетов на кларнете. Флажолеты - это свистковые обертоны, которые создаются при игре на кларнете. Практикуйте различные ноты и ритмы для улучшения навыков.', 'Свистковые обертоны\nФлажолеты 1\nФлажолеты 2', 2);
INSERT INTO public.lessons VALUES (24, 14, 'Мультифоникс', 'Техника игры мультифониксов на кларнете. Мультифоникс - это техника игры, при которой несколько нот звучат одновременно. Практикуйте различные комбинации и ритмы для улучшения навыков.', 'Одновременное звучание нескольких нот\nМультифоникс 1\nМультифоникс 2', 2);
INSERT INTO public.lessons VALUES (25, 3, 'Простые ритмы', 'Игра простых ритмов на ударных. Начните с изучения основных ритмов, таких как 4/4 и 3/4. Практикуйте различные ритмы и паттерны для улучшения навыков.', 'Басс-малый-басс-малый\nБасс-малый-малый-бас\nБасс-малый-бас-малый', 1);
INSERT INTO public.lessons VALUES (26, 3, 'Рулли', 'Техника игры рулли на ударных. Рулли - это техника игры, при которой две палочки быстро чередуются. Практикуйте различные ритмы и паттерны для улучшения навыков.', 'Быстрое чередование двух палочек\nРулли 1\nРулли 2', 1);
INSERT INTO public.lessons VALUES (27, 3, 'Фламы', 'Техника игры фламов на ударных. Фламы - это техника игры, при которой две палочки ударяют одновременно с небольшой задержкой. Практикуйте различные ритмы и паттерны для улучшения навыков.', 'Одновременный удар двух палочек с небольшой задержкой\nФламы 1\nФламы 2', 2);
INSERT INTO public.lessons VALUES (28, 5, 'Простые мелодии', 'Игра простых мелодий на саксофоне. Начните с изучения простых мелодий, таких как "Twinkle, Twinkle, Little Star" и "Mary Had a Little Lamb". Практикуйте переходы между нотами для улучшения навыков.', 'C D E F G A B C\nG A B C D E F# G', 1);
INSERT INTO public.lessons VALUES (29, 5, 'Гроулинг', 'Техника игры гроулинга на саксофоне. Гроулинг - это техника игры, при которой создаются низкие рычащие звуки. Практикуйте различные ритмы и паттерны для улучшения навыков.', 'Низкие рычащие звуки\nГроулинг 1\nГроулинг 2', 1);
INSERT INTO public.lessons VALUES (30, 5, 'Оверблоуинг', 'Техника игры оверблоуинга на саксофоне. Оверблоуинг - это техника игры, при которой высота звука повышается без изменения аппликатуры. Практикуйте различные ритмы и паттерны для улучшения навыков.', 'Повышение высоты звука без изменения аппликатуры\nОверблоуинг 1\nОверблоуинг 2', 2);
INSERT INTO public.lessons VALUES (31, 6, 'Простые мелодии', 'Игра простых мелодий на фортепиано. Начните с изучения простых мелодий, таких как "Twinkle, Twinkle, Little Star" и "Mary Had a Little Lamb". Практикуйте переходы между нотами для улучшения навыков.', 'C D E F G A B C\nG A B C D E F# G', 1);
INSERT INTO public.lessons VALUES (32, 6, 'Аккорды', 'Игра аккордов на фортепиано. Начните с изучения основных аккордов, таких как C, G, D, и E. Практикуйте переходы между ними для улучшения навыков.', 'C: C E G\nG: G B D\nD: D F A\nE: E G# B', 2);
INSERT INTO public.lessons VALUES (33, 6, 'Арпеджио', 'Техника игры арпеджио на фортепиано. Арпеджио - это техника игры, при которой ноты аккорда играются поочередно. Практикуйте различные паттерны и ритмы для улучшения навыков.', 'Последовательное звучание нот аккорда\nАрпеджио 1\nАрпеджио 2', 2);
INSERT INTO public.lessons VALUES (34, 8, 'Простые мелодии', 'Игра простых мелодий на гобое. Начните с изучения простых мелодий, таких как "Twinkle, Twinkle, Little Star" и "Mary Had a Little Lamb". Практикуйте переходы между нотами для улучшения навыков.', 'C D E F G A B C\nG A B C D E F# G', 1);
INSERT INTO public.lessons VALUES (35, 8, 'Стаккато', 'Техника игры стаккато на гобое. Стаккато - это техника игры, при которой ноты играются коротко и отрывисто. Практикуйте различные ритмы и паттерны для улучшения навыков.', 'Короткие отрывистые ноты\nСтаккато 1\nСтаккато 2', 1);
INSERT INTO public.lessons VALUES (36, 8, 'Легато', 'Техника игры легато на гобое. Легато - это техника игры, при которой ноты играются плавно. Практикуйте различные ритмы и паттерны для улучшения навыков.', 'Плавное звучание нот\nЛегато 1\nЛегато 2', 1);
INSERT INTO public.lessons VALUES (37, 9, 'Простые мелодии', 'Игра простых мелодий на фаготе. Начните с изучения простых мелодий, таких как "Twinkle, Twinkle, Little Star" и "Mary Had a Little Lamb". Практикуйте переходы между нотами для улучшения навыков.', 'C D E F G A B C\nG A B C D E F# G', 1);
INSERT INTO public.lessons VALUES (38, 9, 'Стаккато', 'Техника игры стаккато на фаготе. Стаккато - это техника игры, при которой ноты играются коротко и отрывисто. Практикуйте различные ритмы и паттерны для улучшения навыков.', 'Короткие отрывистые ноты\nСтаккато 1\nСтаккато 2', 1);
INSERT INTO public.lessons VALUES (39, 9, 'Тремоло', 'Техника игры тремоло на фаготе. Тремоло - это техника игры, при которой ноты повторяются быстро. Практикуйте различные скорости и ритмы для улучшения навыков.', 'Быстрое повторение ноты\nТремоло 1\nТремоло 2', 1);
INSERT INTO public.lessons VALUES (40, 11, 'Простые мелодии', 'Игра простых мелодий на тромбоне. Начните с изучения простых мелодий, таких как "Twinkle, Twinkle, Little Star" и "Mary Had a Little Lamb". Практикуйте переходы между нотами для улучшения навыков.', 'C D E F G A B C\nG A B C D E F# G', 1);
INSERT INTO public.lessons VALUES (41, 11, 'Глиссандо', 'Техника игры глиссандо на тромбоне. Глиссандо - это техника игры, при которой ноты скользят между собой. Практикуйте различные скорости и ритмы для улучшения навыков.', 'Скольжение между нотами\nГлиссандо 1\nГлиссандо 2', 1);
INSERT INTO public.lessons VALUES (42, 11, 'Стаккато', 'Техника игры стаккато на тромбоне. Стаккато - это техника игры, при которой ноты играются коротко и отрывисто. Практикуйте различные ритмы и паттерны для улучшения навыков.', 'Короткие отрывистые ноты\nСтаккато 1\nСтаккато 2', 2);
INSERT INTO public.lessons VALUES (43, 12, 'Простые мелодии', 'Игра простых мелодий на валторне. Начните с изучения простых мелодий, таких как "Twinkle, Twinkle, Little Star" и "Mary Had a Little Lamb". Практикуйте переходы между нотами для улучшения навыков.', 'C D E F G A B C\nG A B C D E F# G', 1);
INSERT INTO public.lessons VALUES (44, 12, 'Стаккато', 'Техника игры стаккато на валторне. Стаккато - это техника игры, при которой ноты играются коротко и отрывисто. Практикуйте различные ритмы и паттерны для улучшения навыков.', 'Короткие отрывистые ноты\nСтаккато 1\nСтаккато 2', 2);
INSERT INTO public.lessons VALUES (45, 12, 'Легато', 'Техника игры легато на валторне. Легато - это техника игры, при которой ноты играются плавно. Практикуйте различные ритмы и паттерны для улучшения навыков.', 'Плавное звучание нот\nЛегато 1\nЛегато 2', 2);
INSERT INTO public.lessons VALUES (46, 14, 'Простые мелодии', 'Игра простых мелодий на тубе. Начните с изучения простых мелодий, таких как "Twinkle, Twinkle, Little Star" и "Mary Had a Little Lamb". Практикуйте переходы между нотами для улучшения навыков.', 'C D E F G A B C\nG A B C D E F# G', 1);
INSERT INTO public.lessons VALUES (47, 14, 'Стаккато', 'Техника игры стаккато на тубе. Стаккато - это техника игры, при которой ноты играются коротко и отрывисто. Практикуйте различные ритмы и паттерны для улучшения навыков.', 'Короткие отрывистые ноты\nСтаккато 1\nСтаккато 2', 1);
INSERT INTO public.lessons VALUES (48, 14, 'Глиссандо', 'Техника игры глиссандо на тубе. Глиссандо - это техника игры, при которой ноты скользят между собой. Практикуйте различные скорости и ритмы для улучшения навыков.', 'Скольжение между нотами\nГлиссандо 1\nГлиссандо 2', 2);
INSERT INTO public.lessons VALUES (49, 15, 'Простые мелодии', 'Игра простых мелодий на виолончели. Начните с изучения простых мелодий, таких как "Twinkle, Twinkle, Little Star" и "Mary Had a Little Lamb". Практикуйте переходы между нотами для улучшения навыков.', 'C D E F G A B C\nG A B C D E F# G', 1);
INSERT INTO public.lessons VALUES (50, 15, 'Вибрато', 'Техника игры вибрато на виолончели. Вибрато - это техника игры, при которой палец колеблется на ноте, создавая вибрационный эффект. Практикуйте различные скорости и амплитуды для улучшения навыков.', 'Колебание пальца на ноте\nМедленное вибрато\nБыстрое вибрато', 1);
INSERT INTO public.lessons VALUES (51, 15, 'Пиццикато', 'Техника игры пиццикато на виолончели. Пиццикато - это техника игры, при которой струна щипается. Практикуйте различные ритмы и паттерны для улучшения навыков.', 'Щипок струны\nПиццикато 1\nПиццикато 2', 2);
INSERT INTO public.lessons VALUES (52, 17, 'Простые мелодии', 'Игра простых мелодий на арфе. Начните с изучения простых мелодий, таких как "Twinkle, Twinkle, Little Star" и "Mary Had a Little Lamb". Практикуйте переходы между нотами для улучшения навыков.', 'C D E F G A B C\nG A B C D E F# G', 1);
INSERT INTO public.lessons VALUES (53, 17, 'Глиссандо', 'Техника игры глиссандо на арфе. Глиссандо - это техника игры, при которой ноты скользят между собой. Практикуйте различные скорости и ритмы для улучшения навыков.', 'Скольжение между нотами\nГлиссандо 1\nГлиссандо 2', 1);
INSERT INTO public.lessons VALUES (54, 17, 'Арпеджио', 'Техника игры арпеджио на арфе. Арпеджио - это техника игры, при которой ноты аккорда играются поочередно. Практикуйте различные паттерны и ритмы для улучшения навыков.', 'Последовательное звучание нот аккорда\nАрпеджио 1\nАрпеджио 2', 2);
INSERT INTO public.lessons VALUES (55, 18, 'Простые мелодии', 'Игра простых мелодий на аккордеоне. Начните с изучения простых мелодий, таких как "Twinkle, Twinkle, Little Star" и "Mary Had a Little Lamb". Практикуйте переходы между нотами для улучшения навыков.', 'C D E F G A B C\nG A B C D E F# G', 2);
INSERT INTO public.lessons VALUES (56, 18, 'Басы', 'Техника игры басов на аккордеоне. Басы - это техника игры, при которой левая рука играет на басовых кнопках. Практикуйте различные ритмы и паттерны для улучшения навыков.', 'Левая рука на басовых кнопках\nБасы 1\nБасы 2', 2);
INSERT INTO public.lessons VALUES (57, 18, 'Мелодия и аккомпанемент', 'Игра мелодии и аккомпанемента на аккордеоне. Мелодия и аккомпанемент - это техника игры, при которой правая рука играет мелодию, а левая рука играет аккомпанемент. Практикуйте различные ритмы и паттерны для улучшения навыков.', 'Правая рука на клавиатуре, левая на басах\nМелодия и аккомпанемент 1\nМелодия и аккомпанемент 2', 2);
INSERT INTO public.lessons VALUES (58, 13, 'Простые мелодии', 'Игра простых мелодий на флейте. Начните с изучения простых мелодий, таких как "Twinkle, Twinkle, Little Star" и "Mary Had a Little Lamb". Практикуйте переходы между нотами для улучшения навыков.', 'C D E F G A B C\nG A B C D E F# G', 1);
INSERT INTO public.lessons VALUES (59, 13, 'Стаккато', 'Техника игры стаккато на флейте. Стаккато - это техника игры, при которой ноты играются коротко и отрывисто. Практикуйте различные ритмы и паттерны для улучшения навыков.', 'Короткие отрывистые ноты\nСтаккато 1\nСтаккато 2', 1);
INSERT INTO public.lessons VALUES (60, 13, 'Легато', 'Техника игры легато на флейте. Легато - это техника игры, при которой ноты играются плавно. Практикуйте различные ритмы и паттерны для улучшения навыков.', 'Плавное звучание нот\nЛегато 1\nЛегато 2', 1);
INSERT INTO public.lessons VALUES (61, 13, 'Вибрато', 'Техника игры вибрато на флейте. Вибрато - это техника игры, при которой палец колеблется на ноте, создавая вибрационный эффект. Практикуйте различные скорости и амплитуды для улучшения навыков.', 'Колебание пальца на ноте\nМедленное вибрато\nБыстрое вибрато', 2);
INSERT INTO public.lessons VALUES (62, 13, 'Тремоло', 'Техника игры тремоло на флейте. Тремоло - это техника игры, при которой ноты повторяются быстро. Практикуйте различные скорости и ритмы для улучшения навыков.', 'Быстрое повторение ноты\nТремоло 1\nТремоло 2', 2);
INSERT INTO public.lessons VALUES (63, 13, 'Флажолеты', 'Техника игры флажолетов на флейте. Флажолеты - это свистковые обертоны, которые создаются при игре на флейте. Практикуйте различные ноты и ритмы для улучшения навыков.', 'Свистковые обертоны\nФлажолеты 1\nФлажолеты 2', 2);
INSERT INTO public.lessons VALUES (64, 10, 'Простые мелодии', 'Игра простых мелодий на кларнете. Начните с изучения простых мелодий, таких как "Twinkle, Twinkle, Little Star" и "Mary Had a Little Lamb". Практикуйте переходы между нотами для улучшения навыков.', 'C D E F G A B C\nG A B C D E F# G', 1);
INSERT INTO public.lessons VALUES (65, 10, 'Стаккато', 'Техника игры стаккато на кларнете. Стаккато - это техника игры, при которой ноты играются коротко и отрывисто. Практикуйте различные ритмы и паттерны для улучшения навыков.', 'Короткие отрывистые ноты\nСтаккато 1\nСтаккато 2', 1);
INSERT INTO public.lessons VALUES (66, 10, 'Легато', 'Техника игры легато на кларнете. Легато - это техника игры, при которой ноты играются плавно. Практикуйте различные ритмы и паттерны для улучшения навыков.', 'Плавное звучание нот\nЛегато 1\nЛегато 2', 1);
INSERT INTO public.lessons VALUES (67, 10, 'Вибрато', 'Техника игры вибрато на кларнете. Вибрато - это техника игры, при которой палец колеблется на ноте, создавая вибрационный эффект. Практикуйте различные скорости и амплитуды для улучшения навыков.', 'Колебание пальца на ноте\nМедленное вибрато\nБыстрое вибрато', 2);
INSERT INTO public.lessons VALUES (68, 10, 'Тремоло', 'Техника игры тремоло на кларнете. Тремоло - это техника игры, при которой ноты повторяются быстро. Практикуйте различные скорости и ритмы для улучшения навыков.', 'Быстрое повторение ноты\nТремоло 1\nТремоло 2', 2);
INSERT INTO public.lessons VALUES (69, 10, 'Флажолеты', 'Техника игры флажолетов на кларнете. Флажолеты - это свистковые обертоны, которые создаются при игре на кларнете. Практикуйте различные ноты и ритмы для улучшения навыков.', 'Свистковые обертоны\nФлажолеты 1\nФлажолеты 2', 2);
INSERT INTO public.lessons VALUES (70, 16, 'Простые мелодии', 'Игра простых мелодий на саксофоне. Начните с изучения простых мелодий, таких как "Twinkle, Twinkle, Little Star" и "Mary Had a Little Lamb". Практикуйте переходы между нотами для улучшения навыков.', 'C D E F G A B C\nG A B C D E F# G', 1);
INSERT INTO public.lessons VALUES (71, 16, 'Стаккато', 'Техника игры стаккато на саксофоне. Стаккато - это техника игры, при которой ноты играются коротко и отрывисто. Практикуйте различные ритмы и паттерны для улучшения навыков.', 'Короткие отрывистые ноты\nСтаккато 1\nСтаккато 2', 1);
INSERT INTO public.lessons VALUES (72, 16, 'Легато', 'Техника игры легато на саксофоне. Легато - это техника игры, при которой ноты играются плавно. Практикуйте различные ритмы и паттерны для улучшения навыков.', 'Плавное звучание нот\nЛегато 1\nЛегато 2', 1);
INSERT INTO public.lessons VALUES (73, 16, 'Вибрато', 'Техника игры вибрато на саксофоне. Вибрато - это техника игры, при которой палец колеблется на ноте, создавая вибрационный эффект. Практикуйте различные скорости и амплитуды для улучшения навыков.', 'Колебание пальца на ноте\nМедленное вибрато\nБыстрое вибрато', 2);
INSERT INTO public.lessons VALUES (74, 16, 'Тремоло', 'Техника игры тремоло на саксофоне. Тремоло - это техника игры, при которой ноты повторяются быстро. Практикуйте различные скорости и ритмы для улучшения навыков.', 'Быстрое повторение ноты\nТремоло 1\nТремоло 2', 2);
INSERT INTO public.lessons VALUES (75, 16, 'Флажолеты', 'Техника игры флажолетов на саксофоне. Флажолеты - это свистковые обертоны, которые создаются при игре на саксофоне. Практикуйте различные ноты и ритмы для улучшения навыков.', 'Свистковые обертоны\nФлажолеты 1\nФлажолеты 2', 2);
INSERT INTO public.programming_languages VALUES (1, 'Гитара', 'Струнный инструмент');
INSERT INTO public.programming_languages VALUES (2, 'Скрипка', 'Струнный смычковый инструмент');
INSERT INTO public.programming_languages VALUES (3, 'Барабаны', 'Ударные инструменты');
INSERT INTO public.programming_languages VALUES (4, 'Флейта', 'Деревянный духовой инструмент');
INSERT INTO public.programming_languages VALUES (5, 'Труба', 'Медный духовой инструмент');
INSERT INTO public.programming_languages VALUES (6, 'Фортепиано', 'Клавишный инструмент');
INSERT INTO public.topics VALUES (1, 1, 'Основы игры', 'Основы игры на гитаре');
INSERT INTO public.topics VALUES (2, 1, 'Техники игры', 'Различные техники игры на гитаре');
INSERT INTO public.topics VALUES (3, 1, 'Аккорды', 'Игра аккордов на гитаре');
INSERT INTO public.topics VALUES (4, 2, 'Основы игры', 'Основы игры на скрипке');
INSERT INTO public.topics VALUES (5, 2, 'Техники игры', 'Различные техники игры на скрипке');
INSERT INTO public.topics VALUES (6, 2, 'Мелодии', 'Игра мелодий на скрипке');
INSERT INTO public.topics VALUES (7, 3, 'Основы игры', 'Основы игры на барабанах');
INSERT INTO public.topics VALUES (8, 3, 'Ритмы', 'Игра ритмов на барабанах');
INSERT INTO public.topics VALUES (9, 3, 'Техники игры', 'Различные техники игры на барабанах');
INSERT INTO public.topics VALUES (10, 4, 'Основы игры', 'Основы игры на флейте');
INSERT INTO public.topics VALUES (11, 4, 'Техники игры', 'Различные техники игры на флейте');
INSERT INTO public.topics VALUES (12, 4, 'Мелодии', 'Игра мелодий на флейте');
INSERT INTO public.topics VALUES (13, 5, 'Основы игры', 'Основы игры на трубе');
INSERT INTO public.topics VALUES (14, 5, 'Техники игры', 'Техники игры на трубе');
INSERT INTO public.topics VALUES (15, 5, 'Мелодии', 'Игра мелодий на трубе');
INSERT INTO public.topics VALUES (16, 6, 'Основы игры', 'Основы игры на фортепиано');
INSERT INTO public.topics VALUES (17, 6, 'Техники игры', 'Различные техники игры на фортепиано');
INSERT INTO public.topics VALUES (18, 6, 'Мелодии', 'Игра мелодий на фортепиано');
INSERT INTO public.users VALUES (3, '123', '$2b$12$2cb2Wnx6MySf3cQo9HpH9ONqiSVYfOtZdgGMAQgqcgEqBkKDt6toq', '123@123.a', '2025-04-18 17:33:28.260148');
INSERT INTO public.users VALUES (4, 'he', '$2b$12$ja/carQD9FN4Bt2MWjNhtOQRxpFKGdElyqH4H5upcnfaGSkN4Iuqe', 'era@123.ru', '2025-04-18 19:19:12.101443');
INSERT INTO public.users VALUES (5, '1', '$2a$12$AuLv9InZoN/fB9E2TdRGXemU0.9trOvSgJTHkd0D5t4HRW42n8jh2', '1tralalellotralala@crocodilo.bombardilo', '2025-04-18 19:19:12.101443');

SELECT pg_catalog.setval('public.lessons_id_seq', 75, true);
SELECT pg_catalog.setval('public.programming_languages_id_seq', 6, true);
SELECT pg_catalog.setval('public.topics_id_seq', 18, true);
SELECT pg_catalog.setval('public.users_id_seq', 4, true);
ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.programming_languages
    ADD CONSTRAINT programming_languages_name_key UNIQUE (name);
ALTER TABLE ONLY public.programming_languages
    ADD CONSTRAINT programming_languages_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_language_id_title_key UNIQUE (language_id, title);
ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_topic_id_fkey FOREIGN KEY (topic_id) REFERENCES public.topics(id);
ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_language_id_fkey FOREIGN KEY (language_id) REFERENCES public.programming_languages(id);

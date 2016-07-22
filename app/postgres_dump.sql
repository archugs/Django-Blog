--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: blog_blog; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE blog_blog (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    author character varying(100) NOT NULL,
    publication_date date NOT NULL,
    category character varying(100) NOT NULL,
    image character varying(100) NOT NULL,
    optional_image character varying(100) NOT NULL,
    body text NOT NULL,
    slug character varying(50) NOT NULL
);


ALTER TABLE public.blog_blog OWNER TO postgres;

--
-- Name: blog_blog_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE blog_blog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_blog_id_seq OWNER TO postgres;

--
-- Name: blog_blog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE blog_blog_id_seq OWNED BY blog_blog.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_blog ALTER COLUMN id SET DEFAULT nextval('blog_blog_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add blog	7	add_blog
20	Can change blog	7	change_blog
21	Can delete blog	7	delete_blog
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 21, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$24000$25AaMO8cEito$kl/eeGbTvvflk3E4tVWGGCEHPgTVSP0mawVKmdKnfMM=	2016-07-14 11:04:43.66063+05:30	t	admin				t	t	2016-07-14 11:04:35.372665+05:30
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: blog_blog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blog_blog (id, title, author, publication_date, category, image, optional_image, body, slug) FROM stdin;
1	Hair care tips	Archana	2016-07-14	Hair care	1.jpg	1.jpg	The first step in hair-care is your diet and the two most important things in your diet are iron and protein. The hair cells are the fastest growing cells in the body but they are also the first ones to be affected you don't eat right or suffer with deficiencies because they are not required for survival.\r\n\r\nTry and include iron-rich foods like leafy vegetables, fish, pumpkin seeds, beans, chickpea, soybeans and cereals in your diet. Doctors suggest that you consume around  12 mg of iron daily. You also need protein because that's what strengthens your hair. Include complete proteins which are also rich in amino acids: like cheese, milk, soy, lentils, peas, quinoa and yogurt.\r\n\r\nYour hair is your crowning glory so if you fall prey to brittle and lifeless hair, it can affect your entire look and your mood as well. So make sure you do everything under the sun to inject some life into your tresses. Gentle care and a few lifestyle measures should do the trick and some damage control too. \r\n\r\nTrim regularly\r\n\r\nThe first repercussion of dry, damaged hair is split ends and the one way to solve that is regular trimming. If however you are daring enough to go chop-chop on the length then you can rid yourself of damaged hair in a sweep.\r\n\r\nStay in good health\r\n\r\nJust like your skin, your hair too is affected by what you drink, eat and how you treat your body. The math is simple; you have to ensure that your hair is getting its fair share of nutrition too. Drink plenty of water and include in your diet essential vitamins and nutrients from fresh fruits, veggies and meats like salmon and fatty acid rich foods like kale, carrots and avocados.\r\n\r\nA reliable hair care routine\r\n\r\nWe cannot stress enough on the dire need to use a good shampoo and conditioner that you can trust. Our favourite? The Dove Damage Solution Hair Fall Rescue Shampoo & Conditioner for dry and damaged hair. It is enriched with Nutrilock actives that nourish hair right up to the roots and strengthen and protect it against hair fall.\r\n\r\nLet your hair down\r\n\r\nAnother answer to, how to treat damaged hair is letting your hair be. If you are the kind that keeps pulling your hair back into a ponytail or a bun then it is time to relieve your hair and give it a break. Don’t tie your hair too tight for too long and never sleep with any hair accessory on as they can cause hair breakage and weakening.\r\n\r\nPick a comb over a brush\r\n\r\nTry and use a comb with wide teeth and avoid the brush if you have dry, damaged and brittle hair. Also make sure you don’t comb your hair when still wet because that’s when it is at its weakest.	hair-care-tips
2	How to get long thick hair	Archana	2016-07-05	Hair care	2.jpg	2.jpg	Individual’s aim cannot be restricted when they are in the verge of getting something may it be success, a product or beauty care treatment. Similarly, people are continuously looking out for getting long and thick hair as always. Good texture and length of hair is an important consideration for making a person look beautiful and attractive. You can easily get enhancement over the physical appearance with attractive looking hair. But, due to climatic condition and adulteration in food habit hair fall has become a usual thing to people. Falling 2 to 3 hairs while combing hair will be alright but, if you can see extraction of your hair strands one after another, this can become a serious case altogether. You can also get bald hair if excessive hair fall takes place.\r\n\r\nA long hair Indian woman is the symbol for the beauty. Long curly thick hair women attract the men easily and tie the men with their black long hair. The Indian women enhance their beauty with the long hair. Long hair adds the more beauty to the women. Long black hair indicates for the good health. If women have the long hair then she must be healthy in all the aspects.\r\n\r\n    Tips to make your hair thicker\r\n\r\nIn India naturally coconut oil is used as hair oil. The soap nuts are used to wash their hair. A special natural smoking powder (Dhoop powder) is used to dry their hair. All these are the natural nature ingredients. These natural ingredients’ helps in the long black hair.\r\nTips to get Long hair\r\n\r\n    Coconut hair oil only makes the hair free from frizzy. But it not helps in growing the hair. This hair oil is just as the conditioner for the hair.\r\n\r\n    Almond oil is really beneficial to the hair. Apply the oils at night time makes your hair smooth and shiny to the next morning.\r\n\r\n    Other oils like castor oil and mustard oil are also enhancing the hair and keep your hair scalp smooth.\r\n\r\n    Tea oil is the best applicant for the hair. it makes the hair glow and shiny.\r\n\r\n    Mixture of lemon , curd, tea extracts are widely used for the hair masks and conditioners.\r\n\r\n    Apple cider vinegar helps for the bouncy hair. Apply the vinegar mix with hot water on the hair makes your hair bouncy.\r\n\r\n    Bottle gourd juices is good for the hair .Apply the bottle gourd juice on the hair and wash after 3o minutes gives the best results.\r\n\r\n    Olive oil is best for the split ends. Apply the olive oil at the split ends of the hair.\r\n\r\n    Amla powder, castor oil and egg mix all of them and make as smooth paste. Apply if before going to hair bath.\r\n\r\n    Avoid the hot water baths. Hot water makes your hair dry and brittle.\r\n\r\n    For the hair fall take the henna, lemon juice and egg white mix all these. Apply this paste on the hair and hair scalp. Wash after 20 minutes.\r\n\r\n    Do not coming the wet hair, it will fetch the hair from the roots.\r\n\r\n    Take the proper diet in the food.\r\n\r\n    Make your hair clean. Take hair bath 2-3 times in a week is good for the healthy hair.\r\n\r\n    Stay hydrated in the day time.\r\n\r\n    Avoid the hair exposure towards the sun, pollution.\r\n\r\nBest hair care tips to get long and thick hair\r\nHair care with avocado\r\n\r\n    Hair benefits of using henna\r\n\r\nThis is one of the fruits which have number of health benefits with regards to hair and skin. If your hair has become thinner in appearance proper moisturizing will be essential. Avocado is such a natural product available with the Mother Nature which contains vitamin E and is really great for thickening hair. There is also a procedure of applying it on hair. First of all you have to take an avocado and take out the soft portion of the fruit. Now take that in a container, add a small banana in mashed form and 2 spoons of olive oil. Mix it well and apply it over your hair covering every strand and leave the same for the period of 30 minutes.  By this time, all the nutrients will get absorbed by your hair and scalp. Wash it away with a mild shampoo.\r\nEggs for long hair\r\n\r\nYour hair must be supplied with adequate amount of protein so that it can grow long and thick. Like our body, hair also requires good amount of protein which can be supplied with the help of eggs.  If your hair is long, you would require 2 eggs but people with short hair can manage with a single egg. Just beat the egg in a container, beat it well till the entire solution becomes pale yellow in color and the white portion becomes extinct. Now apply it with either brush or your hand using a glove on your hair by taking every strand from the root to tip. You need to keep it for half and hour and then remove with by using a mild shampoo and Luke warm water.\r\nHow to get long thick hair with fenugreek seeds\r\n\r\nYou can completely depend on fenugreek seeds for your hair care. The naturally obtained Fenugreek seeds are really great when you wish to stop hair fall and replace the same with newly growing hair. For this treatment you need to take few teaspoon of such seed and soak the same in water overnight. Now, you have to make paste out of the seed with the help of a grinder. Now take it in a container and put 2 teaspoon of coconut milk in it.  Mix it with a spoon really well and then apply the same over your hair along with the scalp for 30 minutes. After the time is over, you have to wash your hair properly with Luke warm water. This will give you very attractive and thick hair for a long time.\r\nThick hair with castor oil\r\n\r\nYou must have heard about castor oil and its benefits in daily life. This might be a thick and sticky liquid but its working over your hair will be wonderful. You can take some castor oil and heat it in flame so that the thickness gets diluted and you can get an ease in applying the same. It is having good amount of Vitamin E and fatty acid which works wonderfully to make your hair thick and dense. Take the castor oil in your hand, rub it across your palm and apply it over your hair so that it reaches  each root easily. You also need to massage your hair in a circular motion with the help of your finger tips and hands. Now cover it with a towel. You have to keep it inside your towel for one hour and then remove it with the help of good quality shampoo. Wash your hair well so that the stickiness does not remain.\r\n\r\n[ Hindi version ]\r\nIndian gooseberry\r\n\r\n    Best amazing hair care tips\r\n\r\nFor years Indian gooseberry has proved to be a wonderful remedy for hairs. In order to get long and strong hair, Indian Gooseberry is always preferred. It is also having anti inflammatory and anti bacterial properties which will help keep your scalp free from all types of problems. This will also enhance the hair growth rate. You have to make a solution where you need to take a small container. The ingredients to be mixed here are two tablespoon of coconut oil and a teaspoon of Indian Gooseberry. Now, you have to heat the mixture and let it cool till it is Luke warm. Now apply the mixture in such a way that it reaches the root of each hair. You can keep it overnight and use shampoo in the next day.\r\nHenna\r\n\r\nYou must have heard about henna in many occasions. This is a herbal powder that is having a mixture of all ingredients such as henna leaves, amla, reetha, shikakai and much more. The mixture of all these herbs gives rise to a wonderful product that keeps your hair thick, strong and attractive. You have to mix henna powder in hot water and soak it overnight. Next morning you must apply the paste all over your hair. You can also add egg and yogurt to it and make a wonderful paste. This paste is very effective in bringing health to your hair. Wash your hair after an hour or two once it is dry.\r\nAloe vera gel\r\n\r\nFor years Aloe Vera gel is used to create a wonderful effect on human skin and hair. But many people are still not aware of the fact. But, you must actually try applying the Aloe Vera gel that is rightly available in your kitchen garden. Take a long leave and cut it from the middle. Now extract the aloe Vera gel and apply it over your hair. This helps in restoring the Ph balance in your scalp. You have to wait for 30 minutes after applying this aloe Vera gel over your hair. You can also mix coconut oil with Aloe Vera gel and a wonderful result in treating your hair. You can grow Aloe Vera plant at your kitchen garden and get effective remedy. Your hair will be free from dandruff and hair fall. But you have to use it regularly.\r\nHealthy diet\r\n\r\nHealthy diet is another important consideration when you are going to see your hair grow in a considerable way. You have to eat a lot of vegetables, fibrous food, protein as well as vitamins. The mineral rich food is also another effective way to keep your hair strong and long. The growth of your hair will never be restricted with such healthy diet. You need to have good amount of eggs, milk and yogurt. The food items such as nuts, beans, fatty fish etch are really effective in keeping your skin and hair active. The whole grains and fresh vegetables are really effective in getting a long and strong hair.	how-get-long-thick-hair
3	Top tan removal packs available in market	Archugurus	2016-07-12	Skin Care	3.jpg	3.jpg	People are constantly thinking about the remedies to remove tan layer from the skin which might not be possible without proper review of each product in the market. Some people might be availing some home remedies but that might not give you quick result always. If you are thinking about only sunscreen lotion to prevent tan layer from skin, then you are not totally in right track. The Tan removal face packs Available in the market would work really well in cleaning your dark tone of your skin totally from the root.\r\n\r\nWith the supply of different products that beautifies ones skin tone, tan removal is not at all a very big deal. The natural ingredients are always good to treat your skin. But, if you want to get a quick result, the products available in the market can easily help you out. Let us find out the best among variety of tan removal products available in the market. You can get those products both in the departmental stores and also in the Ecommerce websites. If you want to shop in your home comfort, Ecommerce websites will be best.\r\nTop tan removal packs available in market\r\nLotus herbal safe sun De-Tan after sun face packLotus herbal safe sun De-Tan after sun face pack\r\n\r\n[Buy it online]\r\n\r\nThe branded product Lotus has manufactured the de tan sun face pack with Liquorices extract which works in a wonderful way in suppressing melanin production over the skin. If you can apply this de tan face pack over your skin on a regular basis, this will effectively create a soothing effect on your skin with wonderful toning effect of skin. The antioxidant present in the product works really well in removing all oxidants from your skin with the richness of Vitamin A.\r\nVLCC clear Tan Fruits Face PackVLCC clear Tan Fruits Face Pack\r\n\r\n[Buy it online]\r\n\r\nImpurities inside your skin must be eradicated from inside so that your skin does not only looks white from outside, rather it should be clean and purified from inside. After applying this fruit face pack over your skin it cleans your skin from inside. The pack also contains the skin lightening properties which helps in improving skin complexion. Not only this, the fact pack will also keep your skin supple and radiant for a long time.\r\nFab India Lemon and mint face packFab India Lemon and mint face pack\r\n\r\nYou must have heard about Fab India. This is the particular brand that is not only dealing with beauty and hair care products, rather it has varied range of garments and other accessories. You can now get this product packed in a round pot made up of clay along with a wooden lid. If you can use it on a regular basis, removing sun tan can be quite easy. The pack is made up of the fragrance of mint and lemon which gives a strong fragrance that helps in giving a refreshing feel. After applying this face pack your skin will not feel parched, rather it cleansers your skin from inside and creates lighter tone of your skin. You can get the pack with a good quantity which will easily last for a longer period of time. If you are suffering from tanned skin repeatedly, this will be an ideal face mask for you.\r\nNature’s essence Aromatherapy Lacto clean Sun tan removalNature’s essence Aromatherapy Lacto clean Sun tan removal\r\n\r\n[Buy it online]\r\n\r\nNature’s essence is one of the wonderful brands in manufacturing variety of herbal products which does not have side effects. This particular product is made from the natural extract of honey and milk which helps in making your face very soft and supple. Milk is a wonderful natural cleanser and the honey is the moisturizer in a natural form. Thus, the face tan pack that is made with a wonderful combination of milk and honey will  easily give you lighter tone of skin with brightness and glow over your skin tone.\r\nAroma Magic anti tan Combo packAroma Magic anti tan Combo pack\r\n\r\n[Buy it online]\r\n\r\nIf you are facing exposed sun in the day light on a regular basis, simple sunscreen lotion is not enough, rather you require extra protection. Thus, Aroma Magic anti tan combo pack must be a wonderful combination that will remove tan or excess melanin level over your skin.  Apart from removing tan layer from your skin, the particular product will also create brightness over your skin for a longer duration of time.  Aroma Magic also works as an excellent exfoliate that helps in treating sun burns from your face and other parts of skin. Your skin can get repaired with luminous upgrade and lighter complexion. You can use this twice or thrice in a week to get excellent result.\r\nLuster Lacto D-Tan Face Pack (Tan Removal)\r\n\r\nLuster Lacto D-Tan Face Pack (Tan Removal)\r\n\r\n[Buy it online]\r\n\r\nDifferent types of companies are working hard to provide the best to their customers. This is one of the new varieties which you can trust. You can look at the product review and rating of the product and decide whether you wish to go for it. Both the users and critics gives full marks to this product. Thus, you can trust and get it.\r\nSara Cosmetics Oxy Pack De-Tan Specific Treatment\r\n\r\nSara Cosmetics Oxy Pack De-Tan Specific Treatment\r\n\r\n[Buy it online]\r\n\r\nYou must have heard about the oxy packs. It is basically those packs that have the goodness of water and minerals content in it. The particular face treatment product removes the tan layer from your skin with variety of benefits. You get soothing of your skin which will give you benefit of lightening and brightening. Try it after getting from the online shopping store and enjoy its benefits.\r\nNature’s Lacto Tan Clear 100gm\r\n\r\nNature's Lacto Tan Clear 100gm\r\n\r\n[Buy it online]\r\n\r\nIf you want to try one tan clear face remedy product, this is the particular one you can try. The 100 gm packs are not very expensive. Thus, you can try it out without any hesitation. The product has its main ingredients as vitamin E and milk.  You can now order it online and get the benefit. Use it on a regular basis and enjoy being beautiful always. Even the customer review of this product is really impressive. As compared to other products, it is really affordable. Getting it online is also easy.	top-tan-removal-packs-available-market
4	Benefits of orange peels for skin care, hair care, beauty care	Archugurus	2016-07-15	Beauty	4.jpg	4.jpg	When we buy orange from the market we get it for consumption either in the form of fruit or juice. While taking the inner juice part of the orange, we generally overlook the effectiveness of orange peel. Most of us also throw it in dust bin. But, today, you can easily get some fact about the beauty benefits of orange peel for skin, hair and other parts of body. If you want to get a glowing and beautiful skin, orange peel will provide you with wonderful benefit. You can also get reduction in acne with the help of orange peel off mask. Even for your health, this orange peel will be very advantageous.\r\n\r\nEveryone wishes to look beautiful irrespective of age and lifestyle. Today, you can easily make your skin and hair healthy without going to the beauty parlor of using costly cosmetic products. The orange peels that you throw away after eating the fruit can make wonder to your skin and hair. If you are eating oranges, stop throwing its peel and create a wonderful homemade solution for your skin. Orange being rich in Vitamin C is also beneficial in making your immune system active. But, if you want to remove some pigmentation and spots that appears externally, orange peels can be used.\r\nWays of using orange peels for skin, hair, beauty and health\r\nNatural bleach for skin\r\n\r\n    Homemade orange face packs for beautiful skin\r\n\r\nIf you want to bleach your skin naturally, orange peels the one of the effective ways. You have to take peels from two large oranges and smash it in a mixer. Now take the mixed peels in a container and add some milk. Mix both the ingredients very well and apply this on your skin. Leave this on your skin for a period of 20-25 minutes and wash it away with cold water after it dries out completely. You can make a routine and apply this on your face to get healthy skin.\r\nBathing\r\n\r\nWhen you take bath, you can add some orange peel powder and get instant glowing naturally smooth skin. This will give a silky smooth touch to your skin and revitalize it.\r\nFace wash\r\n\r\nThe orange peel can also work effectively like the face wash. You can extract the juices from the same, apply it directly on your face and wash it away. You can save money by not purchasing expensive face wash and using the orange peel to wash your face effectively and make it glowing and beautiful.\r\nIncreasing smoothness of skin\r\n\r\nSince the orange is rich in vitamin C, it increases smoothness and softness in your skin and make the glow stable for long time. The pores in your skin which has become enlarged can be reduced with the extract of orange peel.\r\nWrinkle relief\r\n\r\n    How to use multani mitti for skin care\r\n\r\nFor most of the women who had crossed 35 years of age have a common problem known as wrinkles. Orange peels works effectively in reducing wrinkles from your face and skin. One of the reasons behind the wrinkles is antioxidants. But, orange peels are very effective in reducing oxidants from your body and replenishing the same with natural wrinkle free skins.\r\nUseful for hairs\r\n\r\nIf you want to get natural shine in your hair, smash some orange juice and mix it with a single teaspoon of honey. Apply this on your hair after putting shampoo. Keep this natural ingredient for a period of 5 to 10 minutes and wash it with Luke warm water. Your hair will glow like never before.\r\nFreshening air\r\n\r\nAlong with making your hair and skin glow, it is also equally important to make your environment healthy so that you and your family can be healthier. You can boil orange peels, cardamom and cinnamon in water and make your home refreshed.\r\nBenefits of orange peel\r\nItchy skin reduction\r\n\r\nIf you are suffering from variety of skin problems such as itchy skin, there must be some disruption in your calcium level.  Researchers have found out that every 100 grams of orange peel is associated with 161 milligrams of calcium which is ideal for daily calcium consumption of individuals. You can also try this remedy for itchy skin.\r\nFights with free radicals\r\n\r\n    Best hair oils for hair fall control\r\n\r\nVitamin C is an effective nutrient that is really essential for human health. If you are lagging in any amount, variety of skin problem can come and affect your body. You can now get 136 milligrams of Vitamin C in just 100 grams of orange peels. If your body contains free radicals, this orange peel in pulp form will ideally include the strength to fight with free radicals and drive them away. Even it has been found out that orange peels are very beneficial to stay as a wonderful beauty product.\r\nSkin complexion improvement\r\n\r\nSince orange include dietary fiber, it will provide you good remedy for improving your bowel movement and also a boost over your skin complexion.  It has also been proved that drying the orange peel and consumption can help increasing pectin production.  Thus, you can stay far away from the effect of the blood sugar level.  Most of the vitamin supplements do not contain fiber but this will be ideal for getting a brighter complexion of skin.\r\nSkin whitening\r\n\r\nMany ladies have intention of getting fair skin but hardly few of them could get it from birth. But, it is now possible to get a wonderful skin without using any artificial creams and moisturizers. Yes, the orange peels can serve as a wonderful remedy to make your skin bright and fair. Since orange peel is also known as a natural bleach, dark spots and tan layer from your skin will be ideally eradicated.  Even you can stay away from the harmful UV rays that inculcates effectively.\r\nReduces blackheads\r\n\r\n    Best health benefits of Oranges\r\n\r\nYou can see the appearance of some black heads throughout the surrounding of your nose and even the chin. These are really unattractive when you are out with your friends or within social gatherings.  Now, with the help of orange peel extract it will be really wonderful to get a very polished and smooth skin without the blackheads appearing over the face. For this you need to make a peel with the ingredients like yogurt, and orange peel in dried and powdered form. Now, you need to mix both the ingredients really well to form a thick paste and apply it over your face.  You need to use your finger tips while applying the mask and move your finger in circular direction.  Just need to keep for 15 minutes and then remove it with Luke warm water. Regardless of other cosmetic remedies, this is the most natural remedy to extract the unwanted black heads from your skin layer ideally. This is also a wonderful deal of eradicating excess dirt and oil that covers the pores.\r\nSkin toning\r\n\r\nToning of your skin is equally important when you are in an aim of getting dirt less skin and opening pores effectively. Your skin will get a good scope to breathe if toning takes place.  Since the orange peel contain good amount of vitamin C and antioxidants, your skin will never become too dry or oily.  All the dead skin will be eradicated with the toning treatment of your skin. Antioxidants will ideally make your skin glowing and effective.\r\n\r\n[ Benefits of orange peels for beauty care in Hindi ]\r\nBenefits of orange peels for skin care\r\nReduce blemishes\r\n\r\nThese days most of us suffer from the blemish problem especially when we have oily skin and pimples gets develop all over the face. But, the orange peels are really effective in treating those blemishes. Presence of vitamin C in orange is really beneficial to treat variety of skin problems. You need to dry them under the sun and apply by making a paste with water.\r\nDrying acne\r\n\r\n    Beauty tips for glowing skin\r\n\r\nIf you are facing the vigorous problem of acne, the orange peels provide a wonderful remedy through which you can dry acne easily. Since orange contains citric acid, you can get benefit in drying away the acne placed over your skin. Acne development has an inner reason, i.e excessive deposition of harmful waste inside the body. But, this orange peel helps in eliminating such harmful waste that has propped up as toxin and waste in the body.\r\nHair care benefits\r\nWorks as conditioner\r\n\r\nOrange peels are not only beneficial to skin, rather they provides a wonderful heal to hair. The juice extracted from the orange peel works really well in acting as a conditioner to hair. Just grind the orange peels and take out juice out of it. Now, add a spoon of honey and water to make a paste as a natural conditioner. This mixture must be used after you have provided shampoo to your hair. Just keep for 5-10 minutes and wash away. You get healthy, beautiful and shinny hair.\r\nTreating dandruff\r\n\r\nAs soon as your skin becomes dry, there is a tendency that it gives an attack of dandruff as your scalp also become excessively dry. Even after using variety of dandruff shampoo and cosmetic variation, you might not have developed a better quality of scalp without a tinge of dandruff over your skin. You need to clean the scalp and apply the juicy paste of the orange peel. Once your scalp is dried, you can remove it easily with the wash of water. This will be a effective remedy to remove dandruff naturally from hair and scalp.	benefits-orange-peels-skin-care-hair-care-beauty-c
5	Best perfumes in summer	Archugs	2016-07-19	Beauty	5.jpg	5.jpg	Perfumes are one of the tools that are kept within the vanity bag of ladies along with other makeup and necessary items. People are really cautious about cleanliness andhealth with proper cleaning product and if required a very appealing fragrance so that individuals can have a good impression about them. During summers people sweats too much which gives rise to excessive perspiration and odors. Since the bacteria breeds within the places where sweating takes place it gives rise to a very unpleasant smell. In order to avoid such smell, you need to use a perfume. Some people use body sprays. But, if you are going to spend the entire day with a spray of deodorant, that might not be a very good idea. Rather, you must go for perfumes that stay for a long time. Let us have a look at some summer perfumes which will last for a long time.\r\n\r\nSummer arrives and brings bright day light with heart full of energy. But, at the same time we sweat a lot and become stinky. The best way to stay away from bad odor is the summer perfume. The refreshing nature of the summer perfume will make you stand among the mass. You don’t have to think about the un-healthy odor or sweat that can take place during hot summer days. The online sites can give you the list of the best perfumes in summer. Let us discuss them in this article.\r\nBest summer perfumes\r\nBlueberry summer EDT for women\r\n\r\nBlueberry summer EDT for women\r\n\r\nThe product is specially designed for summer season as during this season you tend to sweat too much which gives rise to bad odor. But this summer perfume for summer has a flavor of blueberry and gives to retain the peaceful atmosphere. Since, it has a fresh scent which will remind you about the floral, green and fruit fragrance.  The ingredients with which this perfume is made include the flowers like lily, rose, orange and green leaves. You can also get a great smell of sandalwood as well.\r\nBoss orange (summer perfume) – by Hugo boss\r\n\r\nBoss orange (summer perfume) – by Hugo boss\r\n\r\n[Buy it online]\r\n\r\nDuring summer, people get a soothing environment around with fruity smell especially the citrus fruit. This Boss orange is one among such smell that will give you a soothing atmosphere. Instead of buying the local perfumes, it will be better to go with this perfume brand as Hugo Boss.  This is a wonderful perfume that also maintains great quality. You should check the labeling and logo in order to differentiate the same and get the best product. This product is readily available online you can get it today.\r\n212 Summer by Carolina Herrera for women\r\n\r\n212 Summer by Carolina Herrera for women\r\n\r\n[Buy it online]\r\n\r\nThe product is used my many people around the nation due to its very sweet and wonderful fragrance. The perfume is suitable for all occasions and all situations according to your need.  It is a fresh shower of lemon with mandarian and bergamot notes. You can also get the fresh fragrance of Jasmine along with the sweetness of raspberry. Lady can get a sensual view with this perfume.\r\nKriti creation summer garden – Fragrance Reed Diffuser\r\n\r\nKriti creation summer garden – Fragrance Reed Diffuser\r\n\r\n[Buy it online]\r\n\r\nThis perfume is ideal to enhance your work and home environment.  An individual getting this perfume over their dress can get a soothing aroma which can also delights the senses.  This will give you a splendid fragrance which can give rise to enhancement every day. This will also absorb excess oil from your body and give you a soothing and delightful aroma that will be liked by you and people around you.\r\nAzzaro Chrome Summer Edt\r\n\r\nAzzaro Chrome Summer Edt\r\n\r\n[Buy it online]\r\n\r\nThe perfume is an export quality product that is really good in quality. Instead of getting the local product from the market, this is a quality product that suites the need of every individual. This will be for both casual and formal wear. If you can order it today online, same can be delivered in 1 to 3 weeks.\r\nEternity summer by Calvin Klein Eau De Parfum spray\r\n\r\nEternity summer by Calvin Klein Eau De Parfum spray\r\n\r\n[Buy it online]\r\n\r\nThe branded perfume company is very well known by the people staying around the world. You must apply this while going to a casual or formal occasion. If you order this today, you can easily receive the same in 3-6 days. Just visit the online site and order it today.\r\nSignature summer for her Eau De Toilette spray\r\n\r\nSignature summer for her Eau De Toilette spray\r\n\r\n[Buy it online]\r\n\r\nThis particular signature perfume by Beckham with the floral fragrance which also has inspiration from Victoria times. You can get a sweet, exotic and warm feeling after applying this fragrance on your body. This has the ingredients like the top notes of violet, water lily and freesia along with vanilla, frangipani base and the Madonna lily. Since it has limited edition, hurry up and get the perfume right away. You can also get the delivery of the perfume at home.\r\nAcqua Di Gio Giorgio Armani for Women\r\n\r\nAcqua Di Gio Giorgio Armani for Women\r\n\r\n[Buy it online]\r\n\r\nAs the name suggests, the particular summer women perfume is made with aqua based or water based. But this will provide you with a great sophistication with the essence. The delicacy of the essence includes the head notes of crushed mint, Limone Primo and much more. This is now available in various online shopping sites. This can be delivered right at your place.\r\nECLAT D`ARPEGE LANVIN FOR WOMEN\r\n\r\nECLAT D`ARPEGE LANVIN FOR WOMEN\r\n\r\n[Buy it online]\r\n\r\nHere comes another good collection of the summer perfume. You can now use this nice fragrance during the summer days. The imported variety of the women perfume is little expensive. But if you go for the quality and can’t afford so much, the online websites have provided the EMI facility to you. This is the best way you can get the perfume in your budget. You can order it today and make the seller informed. They will give you a great deal of offers and discount.\r\nVictoria’s secret Aqua kiss body mist\r\n\r\nVictoria’s secret Aqua kiss body mist\r\n\r\n[Buy it online]\r\n\r\nThe brand name, Victoria secret is really popular in the market. The quality of the brand is really appreciable. You can now get the best deal of perfume in the affordable price. The particular Aqua mist is will give you really fresh feeling when you are outside home and even have got burnt with the heat of sunlight. You must choose this particular essence for yourself and surprise your guests. Get it online right away and feel the difference.\r\nEngage Cologne spray G1 for women\r\n\r\nEngage Cologne spray G1 for women\r\n\r\n[Buy it online]\r\n\r\nThe cologne spray is very light and is made to be applied especially for summer days. It won’t make the people around you smell a loud smell. At the same time it will be ideal to suppress your bad odor. You can also try this particular spray when you have a morning party. Usually during the morning hours we don’t wish to a very dense perfume. Thus the particular spray cologne will be ideal. Another advantage of the spray is the fact that it can be used both for the body and on clothes. You can use it anywhere according to your likes.	best-perfumes-summer
6	Oily skin care tips	Archugs	2016-07-17	Skin Care	6.jpg	6.jpg	Oily skin can be really frustrating when excess oil accumulates with sweat during summer. Some people have a habit of sweating over their hand palms. This becomes really irritated when in the corporate world anyone extends their hands for a shake. The sweaty hand won’t be really impressive in this regard. But, you can now get some natural remedy to stay away from the oily skin. Sometimes the food that you eat also plays a vital role in creating oil balance in your body. This article will discuss such remedies one after another. After availing such remedy you will feel like loving your oily skin tone instead of hating it.\r\n\r\nOily skin is shiny, thick and dull colored and a pain to deal. The excess oil accumulated on the outer layer of the skin leads to the development of blackheads, whiteheads, pimples and skin irritation. It has large pores and the skin has a coarse look. On the other hand, oily skin tends to age in a better manner and there are fewer wrinkles on it as compared to dry or normal skin. So it is not all that bad. But it is true that it is difficult to maintain an oily skin.\r\nTop reasons for oily skin and face\r\n\r\n    Skin care tips for oily skin\r\n\r\nFollow these natural beauty tips for oily skin and be ready to flaunt your flawless and smooth skin.\r\n\r\n    Clean your skin at least twice a day with a good face wash to remove the dirt and oil from your face. This will avert clogging up of the pores & keep your skin supple and smooth.\r\n    Remove all make-up before hitting the bed.\r\n    Include food that is rich in protein, in your daily diet.\r\n    Add lots of leafy vegetables and fruits in your daily diet.\r\n    Vitamin B2 assists in preventing excess production of oil on the skin, thus, include food like kernels, beans and nuts that are rich in vitamin B2.\r\n    Reduce intake of sugar and fat\r\n    Also, do not crave for comfort foods like chocolate, deep-fried food, alcohol based beverages etc.\r\n    Genetics is the main cause of an oily skin. When oily skin runs in the family, chances of all family members to have an oily skin are unavoidable. A genetically oily is more likely to include clogged pores and breakouts.\r\n    Overuse use of skin care products for cleansing, exfoliating or scrubbing for a smooth, clear skin can also lead to an oily skin.\r\n    Seasonal changes – The level of oil production on the skin increases with the rise of heat and humidity in summer. In winter when the skin becomes dry the skin gets dehydrated and there are chances of excess oil  to compensate the loss\r\n    Medications. Hormonal birth control and hormone replacement medications also cause an increase in oil production.\r\n    Hormonal changes in women, during pregnancy, post and pre-menopause can kick sebaceous glands to produce more oil.\r\n    Stress – During stress the body produces more androgen hormones which lead to more oil production.\r\n    Sun tanning– Sun tanning may temporarily dry out the skin, but it actually causes the sebaceous glands to surge the production of oil in order to protect the skin’s surface.\r\n\r\n    Fairness tips for oily skin\r\n\r\nNatural home remedies to treat oily skin\r\n\r\n    It is difficult to manage oily skin, but there are several solutions to handle this problem. There is no need use expensive, chemical based skin care products. Some simple homemade remedies are found to be effective to deal with oily skin.\r\n    Egg Whites can effectively dry out skin blemishes and tone and tighten up oily skin. Apply a stiffly whipped egg white on the face and allow it to dry. Wash it off with water. Alternatively, make a mixture of egg white and lemon juice and apply it on the face. Leave it on for 15 before rinsing it with warm water.\r\n    Yogurt helps to gently exfoliate the skin and absorbs excess oil from the face. Apply plain yogurt on the face. Leave it for 15 minutes before washing it off with cool water. Alternately mix oatmeal and honey with yogurt and apply this mixture on the face. Wash it off after 15 minutes with warm water\r\n    Tomatoes are great for oily skin due to its properties of cooling and clearing. The natural oil-absorbing acids in tomatoes also help get rid of excess oil. Rub a cut tomato on the skin till the juice soaks the skin. Rinse after 15 minutes with cold water.\r\n    Cucumbers also help to manage oily skin due to their cooling, astringent, and soothing properties. Higher vitamin and mineral content, magnesium, and potassium, are good for oily skin. Rub a slice of cucumber before going to bed. Wash it in the morning with warm water. Alternatively, make a mixture of cucumber juice and lime juice and apply it on the face and hands. This remedy can also be used to lighten freckles and reduce sunburn.\r\n\r\n    Make up kit for oily skin\r\n\r\nSimple tips to remove oily skin\r\n\r\n    Regular cleaning with mild soap will help to keep oily skin under control. Make it a routine to wash the face and neck after coming in from outdoors\r\n    Next, apply an astringent or toner to remove the dirt and close the pores on the skin.\r\n    People with oily skin must use water based moisturizer in order to retain the moisture content in the body.\r\n    Sunscreen lotion must be applied before going out in the sun, as the sun plays havoc on the skin and makes the sebaceous glands secrete excess oil.\r\n    Fried food and fatty food must be avoided or limited as they lead to excess oil secretion on the skin. Consumption of  high calorie or sweet food items also increases the chances of excess oil and pimple formation\r\n    Intake of fresh fruits and vegetables and lightly cooked are of great help to maintain a healthy looking skin.\r\n    Caffeinated drinks must be limited as they heat up the system and cause the production of excess oil.\r\n    Carbonated drinks are high in sugar content and are said to form pimples on oily skin.\r\n    It is a myth that oily skin need not be hydrated. Understand that Oil is not moisture. Keep your skin hydrated by consuming lots of water. Use a good moisturizer, the one which matches your oily skin, so that your  skin continues to be hydrated.\r\n\r\n    Best soaps for oily skin\r\n\r\nNatural beauty tips to get rid of oily skin\r\n\r\n    Lemon juice: Mix a tablespoon of lemon juice with cold water & massage it on your skin. After ten to fifteen minutes, wash it off with a good face wash. This remedy will make your skin oil free.\r\n    Lemon juice, Honey and Milk: Mix a tablespoon of lemon juice with half a spoon of honey & a tablespoon of milk. Apply this paste on your face and leave it on for ten to fifteen minutes before taking washing it off with cold water. This acts as a natural bleaching remedy and also helps in preventing excess oil production in the skin\r\n    Almond Honey Scrub: Blend few almonds with honey. Massage softly (don’t scrub) the paste up on your skin. After 10-15 minutes, cleanse your face with cold water.\r\n    Oatmeal & Aloe Vera Scrub: Mix oatmeal with aloe Vera. Rub gently upon your skin. After 10-15 minutes, cleanse with water.\r\n    Do not use overhead to scrub, in case you have acne problem, as this can aggravate your currently irritated skin.\r\n    AVOID damp makeups as it directs to clogging up of pores.\r\n    AVOID heavy and oily products that boasts of providing  nourishment.\r\n    Aloe Vera: Wash your face thoroughly and apply aloe vera gel on your face & let it dry. You may refrigerate the gel to get a refreshing and cooling effect. You can apply aloe Vera gel on your face two to three times a day as per your convenience.\r\n    Apple Facial: To convert your oily skin in to glowing skin, peel, apple & cut it into small pieces. Rub these apple pieces on your face. After one hour clean your face with cold water. This will make your skin oil free & glowing.\r\n    Multani mitti: Mix multani mitti also known as fullers earth with water to make a smooth paste. Apply this paste on your oily skin. Wash it off after it dries completely.\r\n    Multani mitti, Lemon or Orange juice extract: Mix one teaspoon of multani mitti with half a teaspoon of lemon or orange juice. Apply this paste on your face & let it dry. After fifteen minutes, wash it off thoroughly.\r\n\r\nFace packs to get rid of oily skin\r\n\r\n    Best fairness creams for oily skin\r\n\r\nOily skin looks dull and unattractive and it requires special nourishment and proper care. Select the right kind of skin care that maintains oily skin. Oily skin easily catches dirt from the surroundings. It makes the skin look dull and lifeless.\r\n\r\nGreat ways to treat oily skin with fruits are here. These face packs help you to get rid of oily skin.\r\n\r\nBanana face pack: Take a ripe banana that helps in treating oily skin. Mash a ripe banana, add a tablespoon of honey and a few drops of lemon into it. Mix them well and apply this fruit mask to your face and neck. Leave it for about 20 minutes. Rinse it off with lukewarm water. Repeat it once a week to get rid of oily skin and helps to cure acne.\r\n\r\nStrawberry face pack: Strawberries are great to treat oily skin. Mash few strawberries and add a few drops of lemon juice into it. Mix them well and apply this paste on your face. Leave until it dries. Rinse it off with cold water. This helps to keep her oily skin smooth. It also prevents wrinkles and other signs of ageing.\r\n\r\nOrange face pack: Oranges are rich in vitamin C. It helps to eliminate the oiliness of the skin, fights against ageing. It also improves the extra texture of the skin. Orange gives a fair younger looking skin. Apply orange juice on your skin directly, or you can mix it with other ingredients also.\r\n\r\n    face packs to get rid of oily skin\r\n\r\nLemon face pack: Lemon acts as a natural bleaching agent and is used as a prime ingredient in all face packs. The citrus property of lemon deeply cleanses skin and reduces oil secretion. It eliminates dead skin cells. Mix lemon juice with turmeric or any other ingredients that helps in skin recovery results good.\r\n\r\nCucumber face pack: Cucumber is the best facial mask to treat oily skin. It helps to prevent blemishes, and reduces dark spots. It also provides a radiant looking skin. Blend cucumber juice and add a few drops of lemon juice into it. If you want, you can also add a pinch of turmeric into it. Mix them well and apply it on your skin. Let it dry for some time and rinse it off with water.\r\n\r\nMultani mitti: Multani mitti is the best suited face pack for oily skin. It helps to remove acne prone skin. Prepare a paste of Multani mitti with the required amount of rosewater. You can also add a pinch of turmeric into it. Apply this solution on the skin. Leave it to dry and rinse it off with lukewarm water.\r\n\r\n[ Hindi tips for oily skin face ]\r\nTips for oily skin care\r\nHoney and almond\r\n\r\n    Best scrubs for oily skin\r\n\r\nA natural remedy to care your oily skin is here. For this you need 2-3 almonds and honey. You need to grind the almonds and make smaller grains of it. Also take 2-3 tablespoon of honey. Mix both the ingredients well and apply over your face. This is a scrub that needs to be applied over the face. The paste needs to be massaged on your skin and then wash away. This will remove excess oil from your skin.\r\nFuller earth remedy\r\n\r\nFuller earth is easily available in stone as well as powdered form. In order to make a pack, the powdered fuller earth will be the best. Just take two spoons of fuller earth and mix it with plain water till it becomes a smooth paste. Make sure there is no lump. You can use a spoon to make paste. Once this is done apply it over your face so that it covers all portions. Wait till it is dry and wash with plain water.\r\nLuke warm water remedy\r\n\r\nLuke warm water is use to clean the oil and fats from the utensils as well as clothes. The same concept is placed over here. If you have oily skin, Luke warm water must be used to clean your face. The warm water will open your clogged pores of the skin and remove excess oil from your skin. Use a cotton ball dipped in warm water and rub over your skin to remove excess oil.	oily-skin-care-tips
7	Amazing sun tanning oils for your skin care	Archana	2016-07-13	Skin Care	7.jpg	7.jpg	Sun tanning oils are widely-used to enhance a suntan. Essentially the most natural solutions to have radiantly gorgeous skin should be to bask in the sun and enjoy its pure vitamin D benefits. Through summer as well as spring, one of the best ways to heat your skin following the long winter should be to have that sun-kissed look. You may well not always stay beneath the sun, and if you do, it might not be for a longer time. Make use of pure tanning oils that might help in attaining that perfect sun tanned glowing skin very easily and quickly.\r\n\r\nRegardless of the skin tone, it is significant to firstly cleanse as well as exfoliate your skin before applying any lotion or perhaps oil. By doing this, the products gets absorbed easily and quickly and help sin getting better results. This will even give your skin layer a base to protect it from very harsh sun rays.\r\n\r\nSun tanning is specially done by all those people who do not receive enough sunlight. This may be effective for all those people who stays in western part of the world where sunlight hardly reaches. They come to Asia and lie down in beaches to get where sunrays are very wide and effective. They take vitamin D so that enough of melanin in the body is captured.  Sunlight can make their white skin dark but, this can be a positive impact for eradicating variety of cell related diseases. People staying in Asian countries get sunlight so ample that they hate staying long in sun rays. They think their complexion will become dark due to the effect of sunlight. But, little sunlight must be taken every day in order to stay healthy. Your skin will remain elastic if sunrays penetrate through your skin with a protective layer. Thus, sun tanning oils have gained wider popularity in the market.\r\n\r\nIf you want to have a spectacular skin care, sun tanning oil will be a wonderful mechanism to proceed. Some people do not like white color of the skin. They wish to make it darker tone. You can now get variety of such tan oils that can make your skin tone attractive along with the tanning solution. Only darker skin is not what tanning provides. The direct exposure to sun provides vitamin D that has skin enhancing benefits. The natural oil will make your skin glowing and attractive in looks. Let us explore some of the skin tanning oil that is best for your skin.\r\nAmazing sun tanning oils for your skin care\r\nCoconut oil\r\n\r\n    How to remove tan on hands\r\n\r\nIf you’ve got sensitive skin, then coconut oil is superb natural sun tanning oil for you. Some skin oils — while natural – could have adverse effects on your skin. Thus aggravating your skin’s condition rather than improving their color or perhaps quality. Coconut oil does not any such adverse effect.\r\nHazelnut oil\r\n\r\nWith their natural Vitamin E antioxidant components, Hazelnut oil is one of the best pure tanning oils available i the market today. It can also be one of those oils that gets absorbed in the skin very easily and at the same time reaps amazing results.\r\nExtra virgin olive oil\r\n\r\nAnother natural technique for tanning your skin layer is by using extra virgin olive oil. It offers natural soothing Vitamin E antioxidant that aids in moisturizing your skin and while doing so, ensure that you will have that golden color that you are interested in. Mix essential olive oil with several drops of carrot veggie juice if you are interested in a dark tan, and tincture of iodine to counteract your pores and skin from sunburn.\r\nWheat-germ oil\r\n\r\nSmoothing your skin layer as it provides you with a little color, Wheat-germ oil offers a golden light tan that looks natural as well as subtle. This oil also consists of vitamins  D & A that helps in improving the actual elasticity of one’s skin and forestall it from the harmful effects of the sun, similar to wrinkles, good and dried out lines, as well as pigmentation.\r\nAvocado oil\r\n\r\n    Best moisturizing oils during winter\r\n\r\nUnrefined, cold-pressed avocado oil does wonders for your dry skin with its natural vitamins and lecithin combined with unsaturated fatty acids that are easy to be assimilated.\r\nSunflower oil\r\n\r\nBesides being known for its pure moisturizing effect, Sunflower oil can also be a good remedy for getting natural tan. It helps to ensure that the skin’s pure elasticity is rightly maintained. It is also known for effectively taking out the unsafe effects of the sun, similar to fine lines, freckles, aging spots and wrinkles.\r\nGreen tea herb extracts\r\n\r\nEssentially the most effective remedy for preventing your skin layer from getting sun-burnt, due to over tanning, is by using the Green tea herb extracts. It soothes and helps to ensure that with the color you obtain, you may not suffer the actual harmful effects of UV rays. Mix this ingredient with some other oils in order to easily ingest and neutralize the actual UV radiation.\r\nSesame oil\r\n\r\nIt is one of the sun tanning oil available in the market that is quite thick and strong scented in nature. You must be careful and use it sparingly.  Along with sun tanning effect, it is also having SPF which will protect you from harmful effects of the sunlight. If you don’t want to sue coconut oil, this oil will complement it really well.\r\nAloe vera extracts oil\r\n\r\n    Summer tan removal scrubs for hands\r\n\r\nAlong with sun tanning, it is also important to prevent the effect of sun burn. This will be only possible if the oil has the effect of anti oxidant.  For years Aloe Vera has proved to provide healthy skin to people.  This will easily keep you away from sun burning effect. Neutralization of UV effect can be easily done with the help of Aloe Vera extract oil.\r\nAloe body oil\r\n\r\nYou must have heard about Aloe Vera and also its skin benefits. But, you will be happy to know that it also have natural oils which has many more benefits to the skin. You can apply this oil all over your body, massage it and rest under the sun. You will definitely get the adequate sun tan without damage to your skin. Moisturized skin will be in your platter.\r\nMexitan tropical sands dark tanning oil\r\n\r\nThis oil is natural and has a very good coconut smell. You can apply it just like other variety of tan oil over the skin. Since it is totally natural and do not have any chemicals, people will definitely prefer this for a long time. Even you have an extra advantage to remove the sun burn risk as it is made up of tea tree extract. Try this today and feel the wonder.\r\nPineapple and olive oil\r\n\r\nYou can make a punch with pine apple juice along with the olive oil. Combine both the ingredients really well and apply over the portions in your body where you want to create sun tanning effect. The goodness of pine apple juice along with the olive oil will work in a great way. The tanning effect of this combination will work well and make a wonderful deal. It has a good smell and will stay for an extended period of time with spectacular view.\r\nTips for safe tanning\r\n\r\n    Face packs to protect skin from tan\r\n\r\nPeople might go for the process of tanning but they might not know how to go ahead with tanning procedure in a safe way. Following are some of the tips through which you can get safe tanning experience.\r\nKeep it regular\r\n\r\nIf you have started sun bathing for tanning of your skin, it will be important go ahead with regular sun bathing program. You cannot expect the fruitful result in just two to three weeks of vacation period.\r\nTrack the time\r\n\r\nIt is important to keep a stop watch when you are carrying on with the tanning of your skin in beaches.  Just a period of 20 minutes of sun tan experience will be ideal to get enough Vitamin D and sun tan. Once you can with stand the sun rays of 20 minutes, the time can be increased.\r\nKeep it cool and early\r\n\r\nIf you want to go for sunbathe, early in the morning will be the best time. Since the sun rays is very mild in the morning, taking sun rays for a long time during this period will be ideally possible. Choose a time when the temperature is less than 64 degree Fahrenheit  where the chances of overheating is less.	amazing-sun-tanning-oils-your-skin-care
8	Neem for dandruff – neem hair packs	Archugurus	2016-07-20	Hair care	8.jpg	8.jpg	Hair is an expression of internal health and most important thing when it comes to describing one’s good looks. One can hold and cheer up one’s personality by having quality hair. That’s why each person craves for healthy, lustrous locks and smooth hair. No matter what type of hair you are blessed with; you can still have quality hair. Neem and neem products are gaining an importance in the market. Neem has an old relation with, health, wellness, and beauty sector.\r\n\r\nNeem with the presence of vitamin C which is offering the amazing benefits for cleaning the face also provides huge advantages to hair. Its anti-bacterial and anti- septic properties removes the dandruff, improves the overall hair health and strengthens the roots.\r\nHomemade neem hair packs\r\nNeem, fenugreek and moong dal hair pack to remove dandruff\r\n\r\n    Ayurvedic hair packs for hair growth\r\n\r\nIngredients\r\n\r\n    Neem leaves\r\n    Hibiscus flowers\r\n    Moong dal\r\n    Fenugreek seeds\r\n    Curd\r\n\r\nHow to make\r\n\r\n\r\nSoak the moong dal and fenugreek seeds in water for a whole night and in the next morning  make a fine of it. Add this paste to neem juice. (Take 8 to 10 neem leaves and grind it with water to extract the juice from it) and hibiscus leaves paste (Get a handful of hibiscus leaves and grind them to a thick paste ). Mix all of them together and apply it over the scalp and hair, allow it to dry for 15 to 20 minutes and then rinse off with tepid water.\r\nIt stands as one of the best hair packs with its amazing benefits. The ingredient neem helps to remove the dandruff, hair lice, and turns the dull and dry hair to soft and smooth. Moong dal also has the property to diminish dandruff and to promote hair growth. You will get the shine and slippery coat from fenugreek seeds and it also helps to run out the dandruff problem. Curd treats itchiness, provides soft and shiny hair and offers natural milk proteins to the hair and scalp. Whereas Hibiscus helps to turn the hair strong and works as natural conditioner, apart from that it stops the split ends and fuels the hair growth.\r\nNeem treatment to control hair fall and dandruff\r\n\r\n    Natural hair packs with fenugreek seeds\r\n\r\nIngredients\r\n\r\n    Neem leaves\r\n    Water\r\n\r\nHow to make\r\n\r\n\r\nDue to the formation of bacteria and fungus in the scalp, dandruff will raises. It can be treated with the anti-fungal, anti-bacterial and anti-septic agent neem. Take a handful of neem leaves and boil them in two cups of water until water turns green in color. You can use this as a final rinse, after the completion of shampoo to the hair makes use of it as a last step. This treatment is an ideal way to flush out the dandruff and to stimulate the hair strength.\r\nNeem treatment for the frizzy hair\r\n\r\n    How to use multani mitti for hair care\r\n\r\nIngredients\r\n\r\n\r\nTake a half cup of neem leaves and boil them in water for two to three minutes, take them out and make paste along with two table spoons of honey. Apply this paste to the hair for 15 to 20 minutes and then rinse off with plain water. This pack will gives you frizzy free hair and dulls the hair dryness.\r\n\r\n    Neem with henna\r\n    Ingredients required are\r\n    Neem powder\r\n    Henna powder\r\n    Yogurt\r\n    Black tea\r\n    Coffee\r\n    Lemon\r\n\r\nHow to make\r\n\r\n\r\nTo your normal henna powder add three to four table spoons of neem powder, two table spoons of curd, one table spoon of coffee, black tea and lemon extract. Mix them well and apply this pack to scalp and hair thoroughly. Leave it for 30 or more and then wash your hair by following your regular process.\r\n\r\nHomemade neem hair packs is an old conception and its magic has made it a selection of people till today. Below are the three natural homemade neem hair packs for Hair Care:\r\nRevitalizing hair pack for dull and dry hair\r\n\r\n    Hair packs to make hair black and shiny\r\n\r\nIngredients\r\n\r\nThis is a direct and simple pack and it does not engage much complications.All you require is Neem leaves, amla, Hibiscus, Fenugreek, egg, honey, castor oil, Moong Dal and Curd. You will also require one third cup apple cider vinegar.\r\n\r\nDirection\r\n\r\nAs said above this is a simple and easy homemade hair pack which can be used by men and women both. Mix 1 egg yolk, 1 tbsp honey 1 tbsp castor oil, 1 tbsp beer, with little bit of curd and moong dal. Prepare paste out of all this ingredients. Once the paste is done, apply it to your hair from root to tip. It is advised to putt on a plastic shower cap and cover your head with a towel. After 20 to 25 min wash your hair and do a final wash with apple cider vinegar.\r\n\r\nResults\r\n\r\nThis is the easiest and the simplest way of making neem hair pack. This pack works well in case you are suffering from boils on your scalp. It has the antibacterial properties of neem and goodness of amla, which will fight dandruff as well asit will also make your hair look shiny, long and healthy. Using this mask thrice a week gives amazing results.\r\nNeem (Lilac) hair packs\r\n\r\n    Top best hair packs at home\r\n\r\nIngredients\r\n\r\nThis treatment is best suited for girls who have curly and frizzy hair. For this solution you will need 1 cup of neem powder and 1 cup of henna powder, 1 spoon curd, half cup tea, half cup coffee and 12 tablespoon lemon Neem with henna. You can also add a little bit of honey, this will help in giving you excellent shine to your hair.\r\n\r\nDirection\r\n\r\nThe directions and the steps in the making of the hair pack is easy and simple. All the ingredients should be mixed one after the other till it becomes a smooth paste.. You must take care that the ingredients are mixed well or they can form unwanted lumps making it complicated for you to apply the pack in time.Mix them properly and apply this paste to the hair and scalp thoroughly. Leave it for more than 30 minutes and then wash your hair with shampoo and cold water.\r\n\r\nResults\r\n\r\nThe Neem lilac hair pack is very effective. They help in promoting the hair growth and it surely prevents dandruff. You can use this natural homemade neem hair pack at least twice a week to see the positive results. Its anti- septic and anti-bacterial stuffs removes all dandruff, strengthens the roots and recovers hair health.\r\nGooseberry & neem hair mask to fight dandruff\r\n\r\n    Top homemade winter hair packs\r\n\r\nIngredients\r\n\r\nFor this you need a equal amount aloe vera, neem powder amla, shikakai and Gooseberry you can also include one spoon curd (optional) and camphor powder(optional) for curing baldness.Mix all these ingredients them very well and make a thick paste out of it.\r\n\r\nDirection\r\n\r\nOnce the above ingredients are mixed well you can apply it on your scalp for 20 minutes. Rinse the hair with warm water, in which, rosemary leaves and geranium are boiled,Gooseberry and neem hair Mask is a good natural remedy for curing hair loss at home and improves overall disorder of the scalp.\r\n\r\nResult\r\n\r\nThe antiseptic and antibacterial properties of neem are very helpful while working on scalp conditions. They also help in fighting dandruff and improves hair growth.This Homemade neem hair pack works very fine for dry hair and cures the problem of hair fall, that too naturally.\r\n\r\n[ Hindi tips for dandruff with Neem ]\r\nNeem and aloe vera hair pack for gorgeous hair\r\n\r\n    Best tips for long hair\r\n\r\nThe specialty of this Neem, Aloe Vera hair pack lies in the fact that at one hand the neem cures scalp infections promoting a better scalp health and on the other hand the Aloe Vera nourishes your scalp and hairs, repairing dull and damaged hair strands.\r\n\r\nTo make this hair pack, collect 20-25 fresh neem leaves. Soak them in water for 10 minutes and then grind them in a mixer to make a paste.  Collect some fresh Aloe Vera leaves slit it open and scrape out the pulp. Now grind the Aloe Vera pulp along with the neem leaf paste to form a homogenous mixture. Apply the resulting pack onto your scalp and hairs. Let it set for 30 minutes, covering with a shower cap and then wash off with water.\r\nNeem with fuller’s earth for problem free scalp\r\n\r\nFuller’s earth or multanimitti is natural clay filled with a bunch of minerals in their natural form. Multanimitti is highly effective in promoting a better scalp health and also nourishes the hairs.\r\n\r\nCollect 25-30 neem leaves, wash them clean, grind and then squeeze out the extract. Now soak 4-5 spoons of multanimitti powder in excess of this neem leaf extract.  Leave it for 10-15 minutes tilll the multanimitti softens. Nowpaste it with your hands and apply directly onto your scalp and hairs. Leave on for 30 minutes covering with a shower cap and then wash off with plenty of water.\r\nNeem with fenugreek and olive oil for hair growth\r\n\r\n    Top hair care tips\r\n\r\nThis neem pack is ideal for use by people suffering from hair fall. Neem cures scalp problems, while the fenugreek promotes hair growth and olive oil nourishes the hairs preventing hair breakage and dryness.  Here is how to make and use this pack.\r\n\r\nSoak 2 spoons of Fenugreek seeds in water overnight. In the morning, grind the soaked up seeds to make a smooth paste. Collect 20 number of neem leaves, grind them to make a paste and mix with the fenugreek seeds. Finally add 2 spoons of olive oil to the pack and mix all the ingredients in a mixer to come up with a homogenous pack. Apply this pack onto your scalp and hairs and leave on for 30-40 minutes covering your head with a shower cap. Wash off with plenty of water.\r\nNeem with jojoba flowers for beautiful hairs\r\n\r\nNeem cures scalp problems, while jojoba helps in promoting hair growth and also nourishes the hairs. Collect 20 numbers of fresh neem leaves and 15 numbers of jojoba flowers, wash them clean and grind in a mixer to make a paste. Apply the resulting pack directly onto your scalp and hairs and leave on for 30 minutes at least, without letting the pack get dry. Wash off with plenty of water.\r\nNeem and coconut oil for dandruff\r\n\r\n    How to use coconut milk for hair care\r\n\r\nIf you are tired of dandruff, you can easily prepare a neem and coconut oil concoction which will help you to get rid of dandruff with regular use. Collect 30-40 fresh neem leaves. Heat 2 cups of coconut oil in a pan and then add the neem leaves into the oil. Let it boil in low flame for ten minutes. Remove the pan from the heat and let it cool down. Finally strain the leaves and store the oil in an airtight container. Use this oil to massage your scalp on alternate nights and wash off with a mild shampoo in the morning. This treatment will not only cure dandruff permanently with regular use but will also promote a better scalp and hair health.	neem-dandruff-neem-hair-packs
9	Top summer juices to beat the heat in summer	Archugs	2016-07-21	Health	9.jpg	9.jpg	During summer, juices and cold liquids with or without alcohol gives you great pleasure as it not provides you an initial cooling effect but also makes a healthy meal consideration especially when you are looking for quenching thirst during the heat of scorching sunrays during summer. Apart from some common and conventional variety of drinks, you can also get some innovative drinks made from some healthy fruits extracted from the Mother Nature. You must try out some among these delicious and healthy dishes to keep yourself refreshed during summer.\r\n\r\nSummer is here and its time to beat the heat with some traditional summer drinks. These drinks not just helps beat the heat but also aids in controlling and preventing loads of health related issues. Mentioned below are the top 5 fruit juice that will come handy during the summer time. Its advisable that you indulge yourself in these tasty and nutritional drinks and enjoy your summer without any health hassles. Glucose and fructose are the two sugar components which are essential for the body mainly during summer. Most of the people usually love to drink fruit juice than to get rid from fiber. But its recommended to have juice with fiber. Lets see some of the fruit juices which beat the heat in summer.\r\n\r\nWhen summer approaches juices is one of the wonderful remedies that will keep your hydrated and refreshed. There is variety of juices that you can create with great combinations. Naturally obtained herbs, juices extracted from fruits and cold beverages can provide you great form of relaxation. Top summer juices can now be easily portrayed with the help of this particular article. This will help you beat the heat of summer. The hot summer day will no more be irritating for you if you can actually get wonderful remedy through these summer juices.\r\nTop fresh fruit juices for summer\r\n\r\n    Best fruits in summer\r\n\r\n1. Lemon juice – Lemon juice together with ginger offers good anti melanoma properties. This fruit juice is high in vitamin C which is best for stomach related problems. Lemon ginger juice can also be beneficiary for skin, hair and nicotine gum problems.\r\n\r\n2. Water melons juice — Tasty melons are best t beat the heat this summer.  It helps in reducing the risk of Kidney problems, particularly formation of kidney stones. This fruit juice is also perfect for skin problems like zits. Peel and also grind the actual fruit to get the juice extract. It’s best to take this juice without sugar.\r\n\r\n3. Musk melons juice – This nutritious fruit juice contains high fiber content, vitamins, anti oxidants, beta carotene etc that helps in controlling heart related ailments, ulcer and also urinary system infections. The juice can also be best for weight reduction.\r\n\r\n4. Mango juice – The king of fruits is available during summertime and is considered to be the best to helps control health issues. This fruit juice is high in vitamins, minerals and iron which is much required in the hot summer season. Its considered to be a pressure buster as it offers good anti melanoma properties, aids in controlling and preventing heart and tummy related problems.\r\n\r\n    Top fruits to gain weight\r\n\r\n5. Papaya juice – This summer papaya juice is the better medicine for fighting any stomach related ailments. Papaya is a rich source of proteolytic digestive enzymes which makes it possible to digest the food easily and in a healthy way. Papaya rejuvenates one’s body during summer which is in turn good for your heart.\r\n\r\n6. Sugarcane juice: Sugar cane juice prevents the heat stroke in the summer. It helps in fighting the common infections and gives instant energy. It is rich in antioxidants, glucose, magnesium, calcium and potassium. If you want to gain instant hydration then drink sugarcane juice.\r\n\r\n7. Mango juice: King of fruits is the mango. It consists of several health benefits that increases the immunity levels, prevents anemia, controls blood pressure and many more. If mango is mixed with curd or milk it will become still nutritious and delicious to have. Mango juice is the popular seasonal juice in summer. Have this when you effected with heatstroke.\r\n\r\n8. Mosambi juice: Mosambi is also known as sweet lime juice that consists of pocketful of benefits. There is not acidic in the mosambi juice. Vitamin C, iron and copper are good source you gain after drinking the juice. If you have digestion problem, skin pigmentation, pimple, constipation and spots can be cured by consuming this juice. It helps the skin in fighting with the sun tan.\r\n\r\n    Top summer health care tips\r\n\r\n9. Tender coconut water:  Tender coconut will cool the digestive system. Normally during summer body’s immune system tends to function low. Sugar water and low fat provides nutrients and oxygen to the body cells and keep the body hydrated. Tender coconut helps to recover from diarrhea, reduces risk of kidney stones and adds a glow in skin.\r\n\r\n10. Cucumber sangria: To make this wonderful drink, you need some melon cut in halves. But, you also need to remove rind and seeds from melon. Now take a large jar and place the lime slices, melon as well as cucumber sliced thinly in round shapes. You also need to add few mint leaves in it. Now, you need to take a small container and make a mixture with honey as well as lime juice. Now this particular liquid should be poured in the jar where you have already made mixture with melon, lemon and cucumber. Pour the refreshing juice in along juice glass and garnish with sliced melon.\r\n\r\n11. Blackberry with lemonade juice: To make very tasty lemonade juice with blackberry, you would require ¾ oz of lemon juice, chilled sprinkling lemonade, fresh blackberries and rosemary syrup. Take a bowl and combine 2/3rd cup of lemon juice, blackberry rosemary syrup and along with it you also need to add chilled sparkling lemonade of 4 cups. If you have a shaking container, shake them all well and serve in a long glass with frozen blackberries as its garnish.\r\n\r\n12. Pisco sour: You would require the ingredients like guava nectar, lime juice, lime wedge, mint leaves, white rum, superfine sugar, angostura bitters etc. First of all you need to take a glass pitcher where the ingredients like two teaspoon of sugar, a cup of white rum, a cup of guava nectar and 1/4th cup of lime juice needs to be put and combined.  You also need to add few shakes of Angostura bitters and stir really well. Once the drink is ready serve it into 4 glasses in equal portion and serve your guests on a hot summer day. You can also garnish it with lime wedges and fresh mint.\r\n\r\n    Best fruits to eat in summer\r\n\r\n13. Mint ice tea: In order to make ice tea with mint, the ingredients required are 2 cups of sugar, 8 springs fresh mint, 2 cups of orange juice, ice cubes, water, tea bags, lemon juice. First of all, you need to take a large bowl or a saucepan. Now add 7 cups of water and mix sugar of around 2 cups quantity. Boil it and see whether the sugar gets dissolved. Now, keep it to cool down. Once it is cooled down, you need to add fresh mint leaves as well as tea bags. Now, just cover the saucepan with a lid for 5 minutes. Then remove tea bags and serve the juice in glasses with mint leaves over it to make it present well.\r\n\r\n14. Strawberry coconut cream soda: Now, this variety is not just a juice that will quench your thirst, rather this will give you a tasty treat when you are with your friends or partner. You need strawberries of around 3 cups which is sliced. Coconut milk of around 3/4th cup will be required as well. Sugar, soda as well as carbonated water are also required.  To make it, you need to take a medium size bowl and put the strawberries as well as sugar in it. Now, you need to use a blender so that the strawberries can get mashed. You also need to pour coconut milk and cub soda and again blend the solution well. Serve it in glasses with strawberries at the top.\r\n\r\n15. Pina colada smoothie: To make this delicious drink on a summer day, you require fresh coconut milk, banana, vanilla, yogurt, pineapple chunks and honey. Take a blender and combine all these fruits and ingredients in a quantity according to your serving. Keep on blending it repeatedly till it is smooth. Now serve it in glasses with straw in it.\r\n\r\nThese top fruit juices are classified as the best medicines for a lot of health associated problems. Preparing the fruit juice doesn’t take much time and are tasty for you to relish. Enjoy this summer with these top fruit juices.\r\nTop summer juices to beat heat\r\nSweet lassi\r\n\r\n    Tips for drinking water in summer\r\n\r\nLassi is a wonderful drink that makes you refreshed in a hot summer day. This is basically made up of yogurt, salt and sugar. It is a famous drink in north India which is also available in other parts of the country. You can also add flavor according to your wish in this special drink.\r\nNimbu pani\r\n\r\nThis is nothing but a wonderful form of Indian lemonade that is vigorously consumed by individuals on a hot summer day. This is really effective in keeping you healthy and refreshed on a hot summer day. This can be associated with flavor along with the roasted cumin, black salt and so on.\r\nPiyush\r\n\r\nA juicy fluid to be taken on a hot summer day and is available in Maharashtra is named as Piyush. This is one among the gujarati cuisine that will keep you refreshed during the entire summer day. You can also try this and quench your thirst on a hot summer day. These days people staying in many parts of the country are availing this juice.\r\nAam panna\r\n\r\nThis refreshing drink during summer is made with the raw mango. The raw mango is burned and then boiled. It is then smashed and made juice out of it. The sour tasting juice is really wonderful when you are too tired and dehydrated on a summer day. You can add salt and sugar to remove the extremely sour taste of the drink. This can be consumed during the day when you are willing to taste something different.	top-summer-juices-beat-heat-summer
10	Tips for drinking water in summer	Archana	2016-07-18	Health	10.jpg	10.jpg	During summer when the temperature hits high there is fluid loss from the body. One feels thirsty too often and also gets dehydrated in the heat.  Exercises done in the heat leads to low blood sodium which dilutes the blood and can lead to serious diseases. Water is the best solution to quench thirst, prevent fluid loss after exercise and dehydration. It is difficult to live without water.\r\n\r\nWater is life as we can’t stay without drinking water. Especially on a hot summer days this becomes a necessity. Summer is the season when we sweat too much due to humidity in the air. This brings sweat to us. Thus, we become exhausted very easily. Drinking water is a necessity in such a situation. You should stay hydrated during the summer. The individuals carrying on with workout on a regular basis also gets exhausted. They need to replenish their water inside their body with normal water or juices. Also consuming juicy fruits will keep them stay healthy.\r\nLoss of water\r\n\r\n    Best health & beauty benefits of drinking water\r\n\r\nThe body loses water daily in the normal processes like passing of urine, in chemical reactions, sweating and a small amount while exhaling.  It is essential to maintain the total balance of water. Shortage of water in the body tends to slow down the updating process of the body and the metabolites fail to discharge the impurities. The poisonous substances will remain in the body and cell will be left unclean. They will soon get polluted and will be destroyed. Loss of water can result in serious tiredness and cardiovascular problems.  Loss of water is possible while exercising, when the temperature is very high and the weather is hot. The need of water differs from person to person depending on the speed of sweating, temperature of the environment, the clothes worn and the humidity in the atmosphere.\r\nTips for drinking water\r\n\r\nIt is advisable to drink at least 10-12 glasses of water every day. Drinking water early in the morning helps to clear the stomach and intestines. Water should be taken slowly and at short intervals when the weather is hot. The internal organs of the body must be adapted to the temperature of the body by keeping a mouthful of water for some time. Water should not be taken two hours before sleeping as it leads to the puffiness of the eyes.  Fruits and vegetables containing water must be taken regularly.  It is essential to carry water when going out in the heat. Flavours can be added to water to increase the intake of water. Always fix an amount of water and other liquids that must be taken during summer and met the target daily.\r\nStay hydrated\r\n\r\nWater must always be taken before and after doing exercises and playing vigorous games. Alcohol must not be taken a day before a long vigorous exercise to prevent dehydration. Five cups of raw fruits and vegetables must be taken daily to supply the optimum amount of nutrients to the body. In cases of loss of sodium during games and exercise, intake of salt must be increased.\r\n\r\n    Top summer health care tips\r\n\r\nAfter strenuous exercise it is necessary to take more protein and carbohydrates to build and repair the muscles to keep the body hydrated. Low fat chocolate milk will fulfil this requirement. Soups and vegetable juices that contain salt and potassium also help to replace the loss of sodium and fluids. Dried fruits and nut mixtures along with water are good supplement of food during long hikes. They are rich in sodium, potassium, carbohydrates and contain high calories.\r\nImportance of water in the body\r\n\r\nThe body is made up of two thirds of water. Water is an essential element in our life and is most effective for the health of the body. Water detoxifies the body. Water is the solvent for many nutrients\r\n\r\nWater helps to maintain the elasticity of the skin and prevent the premature formation of wrinkles. It also helps to maintain the body temperature, especially after exercising in the heat. Water maintains the proper circulation of the blood in the body. It carries away the heat from the internal organs to prevent serious problems like heat stroke. It also lubricates the joints, protects the spinal cord and many other delicate tissues.\r\n\r\nIt is advised by experts that fruits and cold drinks must be replaced by water. Fruits do give instant energy but they can be harmful to the body. Most fruits contain high calories and lead to weight gain. Fruits and fruit juices tend to increase the level of glucose in the blood and urine which can cause certain diseases like diabetes. Coffee tea and soda are liquids which contain caffeine. These are more of diuretics that lead to loss of water instead of being an agent for hydrating the body. The intake of these items must be minimized especially during the summer.\r\nTips for drinking water in summer\r\nPrevent thirst\r\n\r\n    Best skin care tips in summer\r\n\r\nIf you are thirsty, don’t suppress your thirst due to work pressure. Even you should not delay water drinking process. Immediately drink water whenever you are thirsty. This will keep you highly satisfied. You can easily quench your thirst whenever you require.\r\nCarry a water bottle\r\n\r\nPeople in all season have to go out and work. It is not possible to sit at home just because it is hot outside. But, you can always get some protection. Carry a water bottle with you whenever you are out for your office or you are shopping household goods. Even when you are travelling, just carry a water bottle and drink water frequently.\r\nJuicy fruits\r\n\r\nIf you are not in a habit of drinking water vigorously, the juicy fruits will replace it. Yes, the fruits like, orange, lemon, apple grapes etc will keep your hydrated during summer and also the vitamins content in it will help you to stay healthy and sound in all season.\r\nHealthy soups with vegetables\r\n\r\nIn order to replenish water inside your body, liquid food can also work. Some people are very fond of soups. If you are among them, you can definitely have such soups on a daily basis along with your meals to replenish water inside your body. This can also help you stay hydrated for a long time. Try this today and see the result. The nutrients in vegetables included in soups also have wonderful benefit for your body.	tips-drinking-water-summer
11	Best carrot face packs and masks for glowing face	Archugs	2016-08-25	Skin Care	11.jpg	11.jpg	Carrots are rich in β-carotene, which is metabolized in the body as Vitamin A.They are also rich in Vitamin C, Vitamin K and dietary fibers. All these nutrients of carrot make the face brighter, keep the skin glowing and help combat acne Carrots also beneficial for the skin when it is used as face masks and face packs.  The packs made from carrots leave the skin looking beautiful, young and fresh. They are great for oily skin and they also revitalize dull and tired skin cells.  They help in cleaning out toxins and accumulated dirt on skin and hair in a very effective way\r\n\r\nIn case you have rough skin, and you want it to be moist and supple then why not try experimenting with carrot face pack? This may turn out as one of the best facial mask available for you. Carrot face mask is an effective to help yo improve your complexion, make you feel fresh, to make your skin firm and glowing. Carrot contains glucose, birdwatcher, iodine, potassium, carotene and many other nutrients.\r\n\r\nDo you have carrots in your meal on a regular basis? This vegetable is better for arranging salads apart from including in curries. It has good amount of vitamins if you can consume it raw. Now, you can also get wonderful beauty benefits with the pack made up of carrot face mask. Different combinations of carrot and other ingredients will give you a boost in glowing skin tone. Carrot has beta carotene which is effective to get proper metabolism of your body just like the use of vitamin A. Other vitamins that are included in carrot are vitamin C and vitamin K. You can easily get fair and attractive skin tone.\r\nBelow mentioned are few carrot masks for your face\r\n\r\n    Multani mitti face packs for pimples\r\n\r\n    In case you have dry skin color then take carrots, squeeze out and make juice from that. Mix 1 tbsp cucumber paste and 1 tbsp of sour cream and apply it on your face and neck.  Leave it for about 15-20 minutes and wash it off with normal water. This mask makes skin soft, supplies natural nutrition on the skin and makes it glow.\r\n\r\n    Take carrot juice, lemon juice, gram flour(besan) and curdled milk( buttermilk) in equivalent quantity and mix all of them together. Put the mask for an hour on your face and wash it off with normal water. This is an anti aging mask and may be used 2-3 times a week. It helps get a glow on your face and makes it look young and beautiful.\r\n\r\n    Combine 1 tbsp of carrot juice, 1 tbsp of egg white, one huge spoon of yogurt and 1 spoon of organic olive oil. Mix all in a bowl. Beat the particular mask thoroughly and apply it on your face and neck. Leave it for 25 minutes then wash it with warm water. Carrot helps attain beautiful color on your face and also contain robust antioxidants that reverse the skin damage due to the age factor and sun’s rays.\r\n\r\n    Take grated carrot, milk powder and sugar  mix them properly and rub it on the face. Leave it for 15-20 minutes and wash it off with warm water. Apply this scrub once a week to get a beautiful glow on the face.\r\n\r\n    Take Orange juice and mix carrot juice in it. Massage the mixture on the face before applying makeup. This will enhance your makeup.\r\n\r\nHomemade masks made from carrots are most appropriate for people with normal to oily skin types. Other ingredients can also be included to suit one’s needs. For example extra virgin oil or mashed avocado can be included to make it a hydrating mask.\r\nCarrot face packs and masks for glowing face\r\n\r\n    Best homemade flower face packs\r\n\r\n    Carrot face pack with papaya is useful for getting a fair skinin a natural manner. Prepare the pack by making a paste of carrot, papaya and milk. Apply it on the face for 20 minutes andthen washthe face mildly with tepid water.Carrot-face-pack-with-papaya\r\n    Carrot juice face pack with honey is a natural moisturizer for dull, dry skin.Make a carrot face pack with one teaspoonful of carrot juice and one teaspoonful of honey. Apply on the face and washit off after 15 minutes.Carrot-juice-face-pack-with-honey\r\n    Carrot face pack with cinnamon, honey is an ideal pack for acne and pimples. It also adds a glow to the skin. Mix some carrot juice with a teaspoonful of honey and 2 pinches of cinnamon powderand applyit evenly on the clean face. Wash it after 20 minutesCarrot-face-pack-with-cinnamon\r\n    Carrot face pack with banana, egg white for anti-aging– Vitamin A and Vitamin C found in carrots are good for anti-aging skin care. It is an incredible pack for sagging skin. A pack can be prepared with somebanana pulp, egg white and few drops of lime juice.Spread this face pack in circular motion on the face and remove with water after 20 minutesCarrot-face-pack-with-banana\r\n    Carrot face mask with yogurt, turmeric, besan is helpful for skin tan and exfoliation. It exfoliates the skin gently, reveals younger skin and makesthe skinsmooth. This pack can be made by mixing some carrot paste with a teaspoonful of yogurt, 1 teaspoonful of besan and 3 pinches of turmeric powder. Apply it liberally on the face and wash off the face pack after 20 minutes.Carrot-face-mask-with-yoghurt\r\n\r\n    Homemade face packs for beauty care\r\n\r\n    Carrot peel off mask —Peel off masks are great because they lift off dirt, oil and dead skin from your face. Try this mask by combining 1 tsp gelatine,½ cup carrot juice and ½ tsp. lemon juice in a microwave bowl and heat it until the gelatine dissolves. Stir and keep the mixture in the fridge for 30 minutes or until it becomes thick and firm.Apply the mixture evenly on the face and let it set until it is dried. Peel off carefully and thenwash the face.Splash the face with cold water to tighten pores.Carrot-Peel-Off-Mask\r\n    Carrot and avocado make an ideal moisturizingmask especiallyfordry, elbows, knees, ankles and feet. Mix 1 mashed avocado, 1 gratedcarrot, 2 tablespoons extra virgin olive oil, and 1 tablespoon Epsom salt. Rub the mixture in a circular motion on affected areas.. Let the mask set for 20 minutes and rinse away with warm water.Carrot-and-Avocado\r\n    Carrot and oatmeal mask for glowing skin—Peel, steam and make a paste of some carrots. Add some oatmeal to thicken the paste and some honey. Just leave it on for 10-15 minutes and then wash off with lukewarm water.Carrot-and-oatmeal\r\n\r\nConclusion\r\n\r\nCarrots are packed with antioxidants and are rich in Beta Carotene. They are a natural source of vitamin A which has numerous benefits for our skin.\r\nBenefits of carrot in packs and masks\r\n\r\n    Benefits of curd for skin care\r\n\r\n    Antioxidants of carrot slow down the skin’s aging process.\r\n    Carrots help to maintain the skin’s moisture.\r\n    It also helps to speed up  the renewal process of skin cells\r\n    It is an effective treatment for acne.  It also helps to heal wounds and pimples.\r\n    It works as an  antiseptic that   strengthens the immune system and prevents infections\r\n\r\n[ Hindi tips for face packs & masks ]\r\nBest carrot face packs and masks for glowing face\r\nCarrot with cucumber\r\n\r\nYou must be aware that cucumber works in making the skin tone better with its extensive clearing technique. Combination of carrot and cucumber can do wonder. Since carrot is loaded with vitamins, it will work well in rejuvenating your skin. You need to cut the carrot in small pieces. Also get the pieces of cucumber done. Now, add both the ingredients in a mixer grinder. Make a pulp and apply over your face. This will help removing dark spots from face.\r\nCarrot with besan\r\n\r\nAnother wonderful kitchen product that helps in making your skin glowing is besan or gram flour. The combination of carrot and gram flour will work well. You have to make carrot pulp and keep aside. Now take a small container and add two spoons of gram flour. Also add a spoon of carrot pulp in it. Mix it well and if required add little milk in it. Once it receives the good consistency apply it over your face. Leave this for 10-20 minutes till it is dry. There after wash it with luke warm water.\r\nYogurt and lemon\r\n\r\nApplying yogurt on your skin can also help you get a natural glow. Take a spoon of yogurt in a container and add a spoon of carrot pulp. Now, mix both the ingredients and apply over your face. Let it set on your face till the pack is completely dry. Then you can wash with cold water.	best-carrot-face-packs-and-masks-glowing-face
\.


--
-- Name: blog_blog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('blog_blog_id_seq', 11, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2016-07-14 11:05:35.933349+05:30	1	Hair care tips	1	Added.	7	1
2	2016-07-22 13:12:45.492161+05:30	1	Hair care tips	2	Changed body.	7	1
3	2016-07-22 13:31:51.771471+05:30	2	How to get long thick hair	1	Added.	7	1
4	2016-07-22 13:35:03.640692+05:30	3	Top tan removal packs available in market	1	Added.	7	1
5	2016-07-22 13:39:18.840198+05:30	4	Benefits of orange peels for skin care, hair care, beauty care	1	Added.	7	1
6	2016-07-22 13:40:35.457851+05:30	5	Best perfumes in summer	1	Added.	7	1
7	2016-07-22 13:43:06.190526+05:30	6	Oily skin care tips	1	Added.	7	1
8	2016-07-22 13:45:34.827028+05:30	7	Amazing sun tanning oils for your skin care	1	Added.	7	1
9	2016-07-22 13:49:51.008388+05:30	8	Neem for dandruff – neem hair packs	1	Added.	7	1
10	2016-07-22 13:51:31.606125+05:30	9	Top summer juices to beat the heat in summer	1	Added.	7	1
11	2016-07-22 13:55:36.977377+05:30	10	Tips for drinking water in summer	1	Added.	7	1
12	2016-07-22 13:57:57.038667+05:30	11	Best carrot face packs and masks for glowing face	1	Added.	7	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 12, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	blog	blog
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 7, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2016-07-14 11:03:27.706304+05:30
2	auth	0001_initial	2016-07-14 11:03:28.674612+05:30
3	admin	0001_initial	2016-07-14 11:03:28.885338+05:30
4	admin	0002_logentry_remove_auto_add	2016-07-14 11:03:28.930259+05:30
5	contenttypes	0002_remove_content_type_name	2016-07-14 11:03:29.006642+05:30
6	auth	0002_alter_permission_name_max_length	2016-07-14 11:03:29.185235+05:30
7	auth	0003_alter_user_email_max_length	2016-07-14 11:03:29.358762+05:30
8	auth	0004_alter_user_username_opts	2016-07-14 11:03:29.384755+05:30
9	auth	0005_alter_user_last_login_null	2016-07-14 11:03:29.425459+05:30
10	auth	0006_require_contenttypes_0002	2016-07-14 11:03:29.436959+05:30
11	auth	0007_alter_validators_add_error_messages	2016-07-14 11:03:29.469942+05:30
12	blog	0001_initial	2016-07-14 11:03:29.898287+05:30
13	blog	0002_auto_20160714_0411	2016-07-14 11:03:29.918536+05:30
14	sessions	0001_initial	2016-07-14 11:03:30.107796+05:30
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 14, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
wo4f8nv4ubwl2icfoob87vakhhsulau4	ZjM1ZGJkOWJiMTJjZTk0MDJhMTVhZDA5M2UxZjljNGVlNmRlM2E5OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjcyN2NjM2Y4MjBlMTI5NzdhOGI2MTY0Y2M5ODgyMTcyNWI4ODI0MDEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-07-28 11:04:43.67262+05:30
\.


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: blog_blog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY blog_blog
    ADD CONSTRAINT blog_blog_pkey PRIMARY KEY (id);


--
-- Name: blog_blog_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY blog_blog
    ADD CONSTRAINT blog_blog_slug_key UNIQUE (slug);


--
-- Name: blog_blog_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY blog_blog
    ADD CONSTRAINT blog_blog_title_key UNIQUE (title);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: blog_blog_02bd92fa; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX blog_blog_02bd92fa ON blog_blog USING btree (author);


--
-- Name: blog_blog_93b83098; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX blog_blog_93b83098 ON blog_blog USING btree (publication_date);


--
-- Name: blog_blog_author_d3170a87_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX blog_blog_author_d3170a87_like ON blog_blog USING btree (author varchar_pattern_ops);


--
-- Name: blog_blog_slug_4812aa2c_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX blog_blog_slug_4812aa2c_like ON blog_blog USING btree (slug varchar_pattern_ops);


--
-- Name: blog_blog_title_942d8a1e_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX blog_blog_title_942d8a1e_like ON blog_blog USING btree (title varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


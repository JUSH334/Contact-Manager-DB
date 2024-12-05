--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
    addressid integer NOT NULL,
    contactid integer,
    street character varying(255),
    city character varying(100),
    state character varying(100),
    postalcode character varying(20),
    type character varying(50),
    CONSTRAINT address_type_check CHECK (((type)::text = ANY ((ARRAY['Home'::character varying, 'Office'::character varying, 'Mailing'::character varying])::text[])))
);


ALTER TABLE public.address OWNER TO postgres;

--
-- Name: address_addressid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.address_addressid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.address_addressid_seq OWNER TO postgres;

--
-- Name: address_addressid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.address_addressid_seq OWNED BY public.address.addressid;


--
-- Name: contact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact (
    contactid integer NOT NULL,
    firstname character varying(100) NOT NULL,
    lastname character varying(100) NOT NULL,
    salutation character varying(50),
    jobtitle character varying(100),
    primaryemail character varying(255) NOT NULL,
    personalcomments text,
    employerid integer
);


ALTER TABLE public.contact OWNER TO postgres;

--
-- Name: contact_contactid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contact_contactid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contact_contactid_seq OWNER TO postgres;

--
-- Name: contact_contactid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contact_contactid_seq OWNED BY public.contact.contactid;


--
-- Name: employer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employer (
    employerid integer NOT NULL,
    companyname character varying(255) NOT NULL,
    industry character varying(255),
    location character varying(255)
);


ALTER TABLE public.employer OWNER TO postgres;

--
-- Name: employer_employerid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employer_employerid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employer_employerid_seq OWNER TO postgres;

--
-- Name: employer_employerid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employer_employerid_seq OWNED BY public.employer.employerid;


--
-- Name: eventtype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.eventtype (
    eventtypeid integer NOT NULL,
    eventid integer,
    type character varying(50),
    CONSTRAINT eventtype_type_check CHECK (((type)::text = ANY ((ARRAY['Phone Call'::character varying, 'Email'::character varying, 'Postal Mail'::character varying])::text[])))
);


ALTER TABLE public.eventtype OWNER TO postgres;

--
-- Name: eventtype_eventtypeid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.eventtype_eventtypeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.eventtype_eventtypeid_seq OWNER TO postgres;

--
-- Name: eventtype_eventtypeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.eventtype_eventtypeid_seq OWNED BY public.eventtype.eventtypeid;


--
-- Name: interactionevent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.interactionevent (
    eventid integer NOT NULL,
    contactid integer,
    eventdate date NOT NULL,
    eventcomments text
);


ALTER TABLE public.interactionevent OWNER TO postgres;

--
-- Name: interactionevent_eventid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.interactionevent_eventid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.interactionevent_eventid_seq OWNER TO postgres;

--
-- Name: interactionevent_eventid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.interactionevent_eventid_seq OWNED BY public.interactionevent.eventid;


--
-- Name: managersubordinate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.managersubordinate (
    managerid integer NOT NULL,
    subordinateid integer NOT NULL,
    CONSTRAINT managersubordinate_check CHECK ((managerid <> subordinateid))
);


ALTER TABLE public.managersubordinate OWNER TO postgres;

--
-- Name: phonenumber; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.phonenumber (
    phoneid integer NOT NULL,
    contactid integer,
    phonenumber character varying(20) NOT NULL,
    type character varying(50),
    CONSTRAINT phonenumber_type_check CHECK (((type)::text = ANY ((ARRAY['Home'::character varying, 'Office'::character varying, 'Mobile'::character varying, 'Fax'::character varying])::text[])))
);


ALTER TABLE public.phonenumber OWNER TO postgres;

--
-- Name: phonenumber_phoneid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.phonenumber_phoneid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.phonenumber_phoneid_seq OWNER TO postgres;

--
-- Name: phonenumber_phoneid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.phonenumber_phoneid_seq OWNED BY public.phonenumber.phoneid;


--
-- Name: address addressid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address ALTER COLUMN addressid SET DEFAULT nextval('public.address_addressid_seq'::regclass);


--
-- Name: contact contactid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact ALTER COLUMN contactid SET DEFAULT nextval('public.contact_contactid_seq'::regclass);


--
-- Name: employer employerid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employer ALTER COLUMN employerid SET DEFAULT nextval('public.employer_employerid_seq'::regclass);


--
-- Name: eventtype eventtypeid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eventtype ALTER COLUMN eventtypeid SET DEFAULT nextval('public.eventtype_eventtypeid_seq'::regclass);


--
-- Name: interactionevent eventid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interactionevent ALTER COLUMN eventid SET DEFAULT nextval('public.interactionevent_eventid_seq'::regclass);


--
-- Name: phonenumber phoneid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phonenumber ALTER COLUMN phoneid SET DEFAULT nextval('public.phonenumber_phoneid_seq'::regclass);


--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.address (addressid, contactid, street, city, state, postalcode, type) FROM stdin;
1	1	123 Main St	New York	NY	10001	Office
2	2	456 Elm St	San Francisco	CA	94105	Home
3	3	789 Oak St	Chicago	IL	60610	Office
4	4	101 Pine St	San Francisco	CA	94107	Home
5	1	123 Main St	New York	NY	10001	Home
6	1	456 Office Rd	New York	NY	10002	Office
7	2	789 Elm St	San Francisco	CA	94105	Home
8	2	101 Pine Ave	San Francisco	CA	94107	Office
\.


--
-- Data for Name: contact; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact (contactid, firstname, lastname, salutation, jobtitle, primaryemail, personalcomments, employerid) FROM stdin;
1	John	Smith	Mr.	Software Engineer	john.smith@example.com	Important client contact.	1
2	Jane	Doe	Ms.	Manager	jane.doe@example.com	Works closely with Company ABC.	1
3	Alice	Brown	Dr.	Doctor	alice.brown@example.com	Key contact for healthcare.	3
4	Bob	Johnson	Mr.	Analyst	bob.johnson@example.com	Focuses on finance.	2
5	Tom	Hanks	Mr.	Director	tom.hanks@example.com	Occasional contact for creative projects.	2
6	Emily	Clark	Ms.	Consultant	emily.clark@example.com	Key stakeholder in new initiatives.	1
7	Mark	Twain	Mr.	Author	mark.twain@example.com	Specialized in technical documentation.	3
\.


--
-- Data for Name: employer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employer (employerid, companyname, industry, location) FROM stdin;
1	Company ABC	Technology	New York
2	Company XYZ	Finance	San Francisco
3	Company 123	Healthcare	Chicago
\.


--
-- Data for Name: eventtype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.eventtype (eventtypeid, eventid, type) FROM stdin;
1	1	Phone Call
2	2	Email
3	3	Postal Mail
4	4	Phone Call
5	5	Phone Call
6	6	Phone Call
7	7	Phone Call
8	8	Phone Call
9	9	Phone Call
10	10	Phone Call
11	11	Phone Call
\.


--
-- Data for Name: interactionevent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.interactionevent (eventid, contactid, eventdate, eventcomments) FROM stdin;
1	1	2022-01-15	Discussed project timelines.
2	1	2022-03-20	Followed up on project updates.
3	2	2022-05-10	Negotiated new contract terms.
4	3	2022-09-25	Reviewed healthcare report.
5	1	2022-09-01	Initial consultation.
6	1	2022-09-15	Followed up on project status.
7	1	2022-09-20	Discussed budget changes.
8	2	2022-09-05	Updated client on new features.
9	3	2022-09-10	Shared healthcare policy updates.
10	3	2022-09-25	Discussed healthcare report.
11	4	2022-09-30	Completed finance review.
\.


--
-- Data for Name: managersubordinate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.managersubordinate (managerid, subordinateid) FROM stdin;
2	1
2	4
1	5
2	6
3	7
\.


--
-- Data for Name: phonenumber; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.phonenumber (phoneid, contactid, phonenumber, type) FROM stdin;
1	1	123-456-7890	Office
2	2	987-654-3210	Mobile
3	3	555-555-5555	Fax
4	4	111-222-3333	Office
5	1	222-333-4444	Mobile
6	2	444-555-6666	Office
7	3	333-222-1111	Mobile
8	4	111-333-5555	Home
9	1	123-456-7890	Home
10	1	555-555-5555	Office
11	2	987-654-3210	Mobile
12	2	444-333-2222	Office
\.


--
-- Name: address_addressid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.address_addressid_seq', 8, true);


--
-- Name: contact_contactid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_contactid_seq', 7, true);


--
-- Name: employer_employerid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employer_employerid_seq', 3, true);


--
-- Name: eventtype_eventtypeid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.eventtype_eventtypeid_seq', 11, true);


--
-- Name: interactionevent_eventid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.interactionevent_eventid_seq', 11, true);


--
-- Name: phonenumber_phoneid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.phonenumber_phoneid_seq', 12, true);


--
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (addressid);


--
-- Name: contact contact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (contactid);


--
-- Name: contact contact_primaryemail_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_primaryemail_key UNIQUE (primaryemail);


--
-- Name: employer employer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employer
    ADD CONSTRAINT employer_pkey PRIMARY KEY (employerid);


--
-- Name: eventtype eventtype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eventtype
    ADD CONSTRAINT eventtype_pkey PRIMARY KEY (eventtypeid);


--
-- Name: interactionevent interactionevent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interactionevent
    ADD CONSTRAINT interactionevent_pkey PRIMARY KEY (eventid);


--
-- Name: managersubordinate managersubordinate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.managersubordinate
    ADD CONSTRAINT managersubordinate_pkey PRIMARY KEY (managerid, subordinateid);


--
-- Name: phonenumber phonenumber_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phonenumber
    ADD CONSTRAINT phonenumber_pkey PRIMARY KEY (phoneid);


--
-- Name: idx_address_contact; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_address_contact ON public.address USING btree (contactid);


--
-- Name: idx_contact_employer; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_contact_employer ON public.contact USING btree (employerid);


--
-- Name: idx_event_contact; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_event_contact ON public.interactionevent USING btree (contactid);


--
-- Name: idx_phone_contact; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_phone_contact ON public.phonenumber USING btree (contactid);


--
-- Name: address address_contactid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_contactid_fkey FOREIGN KEY (contactid) REFERENCES public.contact(contactid) ON DELETE CASCADE;


--
-- Name: contact contact_employerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_employerid_fkey FOREIGN KEY (employerid) REFERENCES public.employer(employerid) ON DELETE SET NULL;


--
-- Name: eventtype eventtype_eventid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eventtype
    ADD CONSTRAINT eventtype_eventid_fkey FOREIGN KEY (eventid) REFERENCES public.interactionevent(eventid) ON DELETE CASCADE;


--
-- Name: interactionevent interactionevent_contactid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interactionevent
    ADD CONSTRAINT interactionevent_contactid_fkey FOREIGN KEY (contactid) REFERENCES public.contact(contactid) ON DELETE CASCADE;


--
-- Name: managersubordinate managersubordinate_managerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.managersubordinate
    ADD CONSTRAINT managersubordinate_managerid_fkey FOREIGN KEY (managerid) REFERENCES public.contact(contactid) ON DELETE CASCADE;


--
-- Name: managersubordinate managersubordinate_subordinateid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.managersubordinate
    ADD CONSTRAINT managersubordinate_subordinateid_fkey FOREIGN KEY (subordinateid) REFERENCES public.contact(contactid) ON DELETE CASCADE;


--
-- Name: phonenumber phonenumber_contactid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phonenumber
    ADD CONSTRAINT phonenumber_contactid_fkey FOREIGN KEY (contactid) REFERENCES public.contact(contactid) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--




-- Insert data into Employer table
INSERT INTO Employer (CompanyName, Industry, Location) VALUES
('Company ABC', 'Technology', 'New York'),
('Company XYZ', 'Finance', 'San Francisco');

-- Insert data into Contact table
INSERT INTO Contact (FirstName, LastName, Salutation, JobTitle, PrimaryEmail, EmployerID) VALUES
('John', 'Smith', 'Mr.', 'Engineer', 'john.smith@example.com', 1),
('Jane', 'Doe', 'Ms.', 'Manager', 'jane.doe@example.com', 1),
('Alice', 'Brown', 'Dr.', 'Doctor', 'alice.brown@example.com', 2);

-- Insert data into Address table
INSERT INTO Address (ContactID, Street, City, State, PostalCode, Type) VALUES
(1, '123 Main St', 'New York', 'NY', '10001', 'Home'),
(2, '456 Elm St', 'San Francisco', 'CA', '94105', 'Home');

-- Insert data into PhoneNumber table
INSERT INTO PhoneNumber (ContactID, PhoneNumber, Type) VALUES
(1, '123-456-7890', 'Home'),
(2, '987-654-3210', 'Mobile');

-- Insert data into InteractionEvent table
INSERT INTO InteractionEvent (ContactID, EventDate, EventComments) VALUES
(1, '2022-01-15', 'Initial meeting.'),
(2, '2022-06-10', 'Contract renewal discussion.');

-- Insert data into EventType table
INSERT INTO EventType (EventID, Type) VALUES
(1, 'Phone Call'),
(2, 'Email');

-- Insert data into ManagerSubordinate table
INSERT INTO ManagerSubordinate (ManagerID, SubordinateID) VALUES
(2, 1); -- Jane Doe manages John Smith



-- Query 8: Contacts with greater than three interaction events
SELECT c.FirstName, c.LastName, COUNT(e.EventID) AS InteractionCount
FROM Contact c
JOIN InteractionEvent e ON c.ContactID = e.ContactID
GROUP BY c.ContactID
HAVING COUNT(e.EventID) > 3;

-- Query 9: Total number of interaction events by type
SELECT t.Type, COUNT(e.EventID) AS EventCount
FROM EventType t
JOIN InteractionEvent e ON t.EventID = e.EventID
GROUP BY t.Type;

-- Query 10: Contacts with a home address in a particular city (e.g., New York)
SELECT c.FirstName, c.LastName, a.Street, a.City
FROM Contact c
JOIN Address a ON c.ContactID = a.ContactID
WHERE a.City = 'New York' AND a.Type = 'Home';

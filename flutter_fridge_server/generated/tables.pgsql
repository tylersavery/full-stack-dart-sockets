--
-- Class Magnet as table magnet
--

CREATE TABLE "magnet" (
  "id" serial,
  "identifier" text NOT NULL,
  "x" integer NOT NULL,
  "y" integer NOT NULL,
  "color" text NOT NULL,
  "text" text NOT NULL,
  "createdAt" timestamp without time zone NOT NULL
);

ALTER TABLE ONLY "magnet"
  ADD CONSTRAINT magnet_pkey PRIMARY KEY (id);



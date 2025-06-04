-- Create "category" table
CREATE TABLE "public"."category" (
    "id" uuid NOT NULL DEFAULT public.uuid_generate_v7(),
    "user_id" uuid NOT NULL,
    "name" character varying(255) NOT NULL,
    "created_date" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id"),
    CONSTRAINT "category_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);
-- Create "payment_method" table
CREATE TABLE "public"."payment_method" (
    "id" uuid NOT NULL DEFAULT public.uuid_generate_v7(),
    "user_id" uuid NOT NULL,
    "name" character varying(255) NOT NULL,
    "created_date" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id"),
    CONSTRAINT "payment_method_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);
-- Create "subcategory" table
CREATE TABLE "public"."subcategory" (
    "id" uuid NOT NULL DEFAULT public.uuid_generate_v7(),
    "category_id" uuid NOT NULL,
    "name" character varying(255) NOT NULL,
    "created_date" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id"),
    CONSTRAINT "subcategory_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "public"."category" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);
-- Create "installements_expense" table
CREATE TABLE "public"."installements_expense" (
    "id" uuid NOT NULL DEFAULT public.uuid_generate_v7(),
    "user_id" uuid NOT NULL,
    "description" character varying(255) NOT NULL,
    "payment_method_id" uuid NOT NULL,
    "ars_amount" numeric(10,2) NULL,
    "usd_amount" numeric(10,2) NULL,
    "category_id" uuid NOT NULL,
    "subcategory_id" uuid NULL,
    "start_date" timestamptz NOT NULL,
    "end_date" timestamptz NOT NULL,
    "created_date" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id"),
    CONSTRAINT "installements_expense_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "public"."category" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT "installements_expense_payment_method_id_fkey" FOREIGN KEY ("payment_method_id") REFERENCES "public"."payment_method" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT "installements_expense_subcategory_id_fkey" FOREIGN KEY ("subcategory_id") REFERENCES "public"."subcategory" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT "installements_expense_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT "check_ammounts" CHECK ((ars_amount IS NULL) OR (usd_amount IS NULL))
);
-- Create "recurrent_expense" table
CREATE TABLE "public"."recurrent_expense" (
    "id" uuid NOT NULL DEFAULT public.uuid_generate_v7(),
    "user_id" uuid NOT NULL,
    "description" character varying(255) NOT NULL,
    "payment_method_id" uuid NOT NULL,
    "ars_amount" numeric(10,2) NULL,
    "usd_amount" numeric(10,2) NULL,
    "category_id" uuid NOT NULL,
    "subcategory_id" uuid NULL,
    "start_date" timestamptz NOT NULL,
    "end_date" timestamptz NULL,
    "created_date" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id"),
    CONSTRAINT "recurrent_expense_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "public"."category" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT "recurrent_expense_payment_method_id_fkey" FOREIGN KEY ("payment_method_id") REFERENCES "public"."payment_method" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT "recurrent_expense_subcategory_id_fkey" FOREIGN KEY ("subcategory_id") REFERENCES "public"."subcategory" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT "recurrent_expense_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT "check_ammounts" CHECK ((ars_amount IS NULL) OR (usd_amount IS NULL))
);
-- Create "expense" table
CREATE TABLE "public"."expense" (
    "id" uuid NOT NULL DEFAULT public.uuid_generate_v7(),
    "user_id" uuid NOT NULL,
    "description" character varying(255) NOT NULL,
    "payment_method_id" uuid NOT NULL,
    "ars_amount" numeric(10,2) NOT NULL,
    "usd_amount" numeric(10,2) NOT NULL,
    "category_id" uuid NOT NULL,
    "subcategory_id" uuid NULL,
    "installements_expense_id" uuid NULL,
    "recurrent_expense_id" uuid NULL,
    "created_date" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id"),
    CONSTRAINT "expense_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "public"."category" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT "expense_installements_expense_id_fkey" FOREIGN KEY ("installements_expense_id") REFERENCES "public"."installements_expense" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT "expense_payment_method_id_fkey" FOREIGN KEY ("payment_method_id") REFERENCES "public"."payment_method" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT "expense_recurrent_expense_id_fkey" FOREIGN KEY ("recurrent_expense_id") REFERENCES "public"."recurrent_expense" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT "expense_subcategory_id_fkey" FOREIGN KEY ("subcategory_id") REFERENCES "public"."subcategory" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT "expense_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT "check_ammounts" CHECK ((installements_expense_id IS NULL) OR (recurrent_expense_id IS NULL))
);

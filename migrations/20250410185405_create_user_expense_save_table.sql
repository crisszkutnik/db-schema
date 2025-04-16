-- Create enum type "user_expense_save_destination"
CREATE TYPE "public"."user_expense_save_destination" AS ENUM ('google_sheets');
-- Create "user_expense_save" table
CREATE TABLE "public"."user_expense_save" (
    "id" uuid NOT NULL DEFAULT public.uuid_generate_v7(),
    "user_id" uuid NOT NULL,
    "destination" text NOT NULL,
    "info" json NOT NULL,
    "created_date" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id"),
    CONSTRAINT "user_expense_save_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

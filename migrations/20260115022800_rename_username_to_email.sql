-- Rename a column from "username" to "email"
ALTER TABLE "public"."users" RENAME COLUMN "username" TO "email";
-- Modify "users" table
ALTER TABLE "public"."users" ADD CONSTRAINT "users_email_key" UNIQUE ("email");

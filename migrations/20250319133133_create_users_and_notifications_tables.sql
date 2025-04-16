-- Create "users" table
CREATE TABLE "public"."users" (
    "id" uuid NOT NULL DEFAULT public.uuid_generate_v7(),
    "username" character varying(255) NOT NULL,
    "created_date" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id")
);
-- Create "notifications" table
CREATE TABLE "public"."notifications" (
    "app" character varying(255) NOT NULL,
    "vendor" character varying(255) NOT NULL,
    "payment_method" character varying(255) NOT NULL,
    "amount" numeric(10,2) NOT NULL,
    "timestamp" timestamptz NOT NULL,
    "created_date" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "user_id" uuid NOT NULL,
    "telegram_message_id" bigint NOT NULL,
    PRIMARY KEY ("user_id", "telegram_message_id"),
    CONSTRAINT "notifications_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

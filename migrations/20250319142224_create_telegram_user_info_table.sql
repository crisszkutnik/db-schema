-- Create "telegram_user_info" table
CREATE TABLE "public"."telegram_user_info" (
    "user_id" uuid NOT NULL,
    "telegram_user_id" bigint NOT NULL,
    "created_date" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("user_id"),
    CONSTRAINT "telegram_user_info_telegram_user_id_key" UNIQUE ("telegram_user_id"),
    CONSTRAINT "telegram_user_info_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

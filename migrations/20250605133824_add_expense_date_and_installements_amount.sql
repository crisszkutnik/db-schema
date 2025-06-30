-- Modify "expense" table
ALTER TABLE "public"."expense" ADD COLUMN "date" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP;
-- Modify "installements_expense" table
ALTER TABLE "public"."installements_expense" ADD COLUMN "installements_amount" integer NULL GENERATED ALWAYS AS (((((date_part('year'::text, age(end_date, start_date)) * (12)::double precision) + date_part('month'::text, age(end_date, start_date))) + (1)::double precision))::integer) STORED;

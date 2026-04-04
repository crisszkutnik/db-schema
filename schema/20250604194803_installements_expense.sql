CREATE TABLE public.installements_expense (
  id UUID NOT NULL DEFAULT uuid_generate_v7(),
  user_id UUID NOT NULL REFERENCES users(id),
  created_date TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
);
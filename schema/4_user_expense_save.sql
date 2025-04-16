CREATE TYPE USER_EXPENSE_SAVE_DESTINATION AS ENUM ('google_sheets');

CREATE TABLE public.user_expense_save (
  id UUID NOT NULL DEFAULT uuid_generate_v7(),
  user_id UUID NOT NULL REFERENCES users(id),
  destination TEXT NOT NULL,
  info JSON NOT NULL,
  created_date TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);
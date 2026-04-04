CREATE TABLE public.expense (
  id UUID NOT NULL DEFAULT uuid_generate_v7(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE RESTRICT,
  description VARCHAR(255) NOT NULL,
  payment_method_id UUID NOT NULL REFERENCES payment_method(id) ON DELETE RESTRICT,
  ars_amount NUMERIC(10, 2) NOT NULL,
  usd_amount NUMERIC(10, 2) NOT NULL,
  category_id UUID NOT NULL REFERENCES category(id) ON DELETE RESTRICT,
  subcategory_id UUID REFERENCES subcategory(id) ON DELETE SET NULL,
  installements_expense_id UUID REFERENCES installements_expense(id) ON DELETE RESTRICT,
  recurrent_expense_id UUID REFERENCES recurrent_expense(id) ON DELETE SET NULL,
  date TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_date TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  CONSTRAINT check_ammounts CHECK (
    (installements_expense_id IS NULL)
    OR (recurrent_expense_id IS NULL)
  )
);
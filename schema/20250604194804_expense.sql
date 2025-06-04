CREATE TABLE public.expense (
  id UUID NOT NULL DEFAULT uuid_generate_v7(),
  user_id UUID NOT NULL REFERENCES users(id),
  description VARCHAR(255) NOT NULL,
  payment_method_id UUID NOT NULL REFERENCES payment_method(id),
  ars_amount NUMERIC(10, 2) NOT NULL,
  usd_amount NUMERIC(10, 2) NOT NULL,
  category_id UUID NOT NULL REFERENCES category(id),
  subcategory_id UUID REFERENCES subcategory(id),
  installements_expense_id UUID REFERENCES installements_expense(id),
  recurrent_expense_id UUID REFERENCES recurrent_expense(id),
  created_date TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  CONSTRAINT check_ammounts CHECK (
    (installements_expense_id IS NULL)
    OR (recurrent_expense_id IS NULL)
  )
);
CREATE TABLE public.installements_expense (
  id UUID NOT NULL DEFAULT uuid_generate_v7(),
  user_id UUID NOT NULL REFERENCES users(id),
  description VARCHAR(255) NOT NULL,
  payment_method_id UUID NOT NULL REFERENCES payment_method(id),
  ars_amount NUMERIC(10, 2),
  usd_amount NUMERIC(10, 2),
  category_id UUID NOT NULL REFERENCES category(id),
  subcategory_id UUID REFERENCES subcategory(id),
  start_date TIMESTAMPTZ NOT NULL,
  end_date TIMESTAMPTZ NOT NULL,
  created_date TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  CONSTRAINT check_ammounts CHECK (
    (ars_amount IS NULL)
    OR (usd_amount IS NULL)
  )
);
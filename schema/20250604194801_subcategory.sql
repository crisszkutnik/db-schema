CREATE TABLE public.subcategory (
  id UUID NOT NULL DEFAULT uuid_generate_v7(),
  category_id UUID NOT NULL REFERENCES category(id),
  name VARCHAR(255) NOT NULL,
  created_date TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);
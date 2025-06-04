CREATE TABLE public.telegram_user_info (
  user_id UUID NOT NULL REFERENCES users(id),
  telegram_user_id BIGINT NOT NULL UNIQUE,
  created_date TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (user_id)
)
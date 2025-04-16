CREATE TABLE public.users (
    id UUID NOT NULL DEFAULT uuid_generate_v7(),
    username VARCHAR(255) NOT NULL,
    created_date TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
)
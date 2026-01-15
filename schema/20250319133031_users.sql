CREATE TABLE public.users (
    id UUID NOT NULL DEFAULT uuid_generate_v7(),
    -- This should be an index some day
    email VARCHAR(255) NOT NULL UNIQUE,
    created_date TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
)
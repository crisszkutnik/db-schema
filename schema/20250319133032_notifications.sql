CREATE TABLE public.notifications (
    app VARCHAR(255) NOT NULL,
    vendor VARCHAR(255) NOT NULL,
    payment_method VARCHAR(255) NOT NULL,
    amount NUMERIC(10, 2) NOT NULL,
    timestamp TIMESTAMPTZ NOT NULL,
    created_date TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    user_id UUID NOT NULL REFERENCES users(id),
    /*
        Message ID in the context of the user

        In each chat, the message ID is unique for each message inside
        that chat

        If new integrations are added, it is worth moving this into its own table
    */
    telegram_message_id BIGINT NOT NULL,
    PRIMARY KEY(user_id, telegram_message_id)
);
CREATE TABLE IF NOT EXISTS products (
    sku TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    category TEXT NOT NULL,
    price INTEGER NOT NULL CHECK (price >= 0),
    available BOOLEAN NOT NULL DEFAULT true,
    prep_time_minutes INTEGER NOT NULL CHECK (prep_time_minutes >= 0),
    display_order INTEGER NOT NULL DEFAULT 0
);

CREATE INDEX IF NOT EXISTS idx_products_category_order
    ON products (category, display_order);

INSERT INTO products (sku, name, category, price, available, prep_time_minutes, display_order)
VALUES
    ('coffee', 'Iced Coffee', 'drinks', 18000, true, 2, 1),
    ('water', 'Bottled Water', 'drinks', 8000, true, 1, 2),
    ('tea', 'Peach Tea', 'drinks', 16000, true, 2, 3),
    ('sandwich', 'Chicken Sandwich', 'food', 28000, true, 5, 1),
    ('snack', 'Seaweed Snack', 'snacks', 12000, true, 1, 1)
ON CONFLICT (sku) DO UPDATE
    SET name = EXCLUDED.name,
        category = EXCLUDED.category,
        price = EXCLUDED.price,
        available = EXCLUDED.available,
        prep_time_minutes = EXCLUDED.prep_time_minutes,
        display_order = EXCLUDED.display_order;

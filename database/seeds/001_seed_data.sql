-- ============================================================
-- Enable UUID generation
-- ============================================================

CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- ============================================================
-- Seed Hotel Bookings
-- ============================================================

INSERT INTO hotel_bookings (

    id,

    org_id,

    hotel_id,

    city,

    checkin_date,

    checkout_date,

    amount,

    status,

    created_at

)

SELECT

    gen_random_uuid(),

    CASE (g % 5)

        WHEN 0 THEN '11111111-1111-1111-1111-111111111111'

        WHEN 1 THEN '22222222-2222-2222-2222-222222222222'

        WHEN 2 THEN '33333333-3333-3333-3333-333333333333'

        WHEN 3 THEN '44444444-4444-4444-4444-444444444444'

        ELSE '55555555-5555-5555-5555-555555555555'

    END::uuid,

    CONCAT('HOTEL-', g % 15),

    (ARRAY[
        'delhi',
        'hyderabad',
        'bangalore',
        'mumbai',
        'chennai'
    ])[(g % 5) + 1],

    CURRENT_DATE + (g % 10),

    CURRENT_DATE + ((g % 10) + 2),

    (5000 + (random()*10000))::numeric(12,2),

    (ARRAY[
        'CONFIRMED',
        'PENDING',
        'CANCELLED',
        'COMPLETED'
    ])[(g % 4) + 1],

    NOW() - ((g % 30) || ' days')::interval

FROM generate_series(1,100) g;

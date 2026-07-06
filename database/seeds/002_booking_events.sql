-- ============================================================
-- Seed Booking Events
-- ============================================================

INSERT INTO booking_events (

    booking_id,

    event_type,

    payload,

    created_at

)

SELECT

    id,

    'BOOKING_CREATED',

    jsonb_build_object(

        'source', 'web',

        'status', status,

        'city', city

    ),

    created_at

FROM hotel_bookings

LIMIT 50;

SELECT
    charity_id,
    charity_name,
    charity_phone,
    charity_email
FROM {{ source('niyyah_tracks', 'charity')}}
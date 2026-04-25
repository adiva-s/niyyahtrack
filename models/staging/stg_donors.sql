SELECT 
    donor_id,
    donor_first_name,
    donor_last_name, 
    donor_phone, 
    donor_email
FROM {{ source('niyyah_tracks', 'donor') }}
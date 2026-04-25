SELECT
    donation_id,
    donation_confirmation,
    donation_amount,
    donation_date,
    donation_type,
    donor_id,
    charity_id,
    project_id
FROM {{ source('niyyah_tracks', 'donation')}}
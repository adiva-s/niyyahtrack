SELECT
    dn.donation_id,
    dn.donation_confirmation,
    dn.donation_amount,
    dn.donation_date,
    dn.donation_type,
    d.donor_first_name,
    d.donor_last_name,
    p.project_name,
    p.charity_name
FROM {{ ref('stg_donations') }} dn
JOIN {{ ref('dim_donors') }} d
    ON dn.donor_id = d.donor_id
JOIN {{ ref('dim_projects') }} p
    ON dn.project_id = p.project_id 
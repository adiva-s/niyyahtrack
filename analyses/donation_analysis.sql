-- Query 1:  total raised per project
SELECT project_name, SUM(donation_amount) AS total_raised
FROM {{ ref('fct_donations')}} 
GROUP BY project_name
ORDER BY total_raised DESC

-- Query 2: total donations by type
SELECT donation_type, SUM(donation_amount) AS total_donations
FROM {{ ref('fct_donations')}} 
GROUP BY donation_type 

-- Query 3: total raised per charity
SELECT charity_name, SUM(donation_amount) AS total_raised
FROM {{ ref('fct_donations')}}
GROUP BY charity_name
ORDER BY total_raised DESC

-- Query 4: donors who gave more than once
SELECT donor_first_name, donor_last_name, COUNT(donation_id) AS donation_count
FROM {{ ref('fct_donations')}}
GROUP BY donor_first_name, donor_last_name
HAVING COUNT(donation_id) > 1
ORDER BY donation_count DESC

-- Query 5: cost per beneficiary
WITH total_donations AS (
    SELECT project_name, SUM(donation_amount) AS total_raised
    FROM {{ ref('fct_donations')}} 
    GROUP BY project_name
),
count_testimonials AS ( 
    SELECT COUNT(testimonial_id) AS testimonial_count, p.project_name 
    FROM {{ ref('stg_testimonials')}} s 
    JOIN {{ ref('dim_projects') }} p
    ON s.project_id = p.project_id
    GROUP BY p.project_name
)
SELECT c.project_name, total_raised, testimonial_count, total_raised/testimonial_count AS cost_per_beneficiary  
FROM count_testimonials c  
JOIN total_donations 
ON c.project_name = total_donations.project_name
SELECT 
    p.project_id, 
    p.project_name, 
    p.project_description,
    c.charity_name
FROM {{ ref('stg_project')}} p
JOIN {{ ref('stg_charity')}} c
    ON p.charity_id = c.charity_id
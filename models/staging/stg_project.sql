SELECT
    project_id,
    project_name, 
    project_description,
    charity_id
FROM {{ source('niyyah_tracks', 'project')}}
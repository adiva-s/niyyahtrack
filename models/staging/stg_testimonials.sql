SELECT
    testimonial_id,
    testimonial_title,
    testimonial_date,
    testimonial_content,
    testimonial_author,
    project_id
FROM {{ source('niyyah_tracks', 'testimonials')}}
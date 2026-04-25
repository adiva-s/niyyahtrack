-- donor table
CREATE TABLE donor(
    donor_id SERIAL PRIMARY KEY,
    donor_first_name VARCHAR(25),
    donor_last_name VARCHAR(25),
    donor_phone VARCHAR(20),
    donor_email TEXT
);

-- charities table
CREATE TABLE charity(
    charity_id SERIAL PRIMARY KEY,
    charity_name VARCHAR(100),
    charity_phone VARCHAR(20), 
    charity_email TEXT
);

-- project table
CREATE TABLE project(
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(100),
    project_description TEXT,
    charity_id INT NOT NULL REFERENCES charity(charity_id)
);

-- testimonials table
CREATE TABLE testimonials (
    testimonial_id SERIAL PRIMARY KEY,
    testimonial_title VARCHAR(100),
    testimonial_date DATE,
    testimonial_content TEXT,
    testimonial_author VARCHAR(100),
    project_ID INT NOT NULL REFERENCES project(project_ID)
);

-- donation type enum
CREATE TYPE donation_type_enum AS ENUM (
  'zakat',
  'sadaqah',
  'sadaqah_jariya',
  'waqf'
);

-- donation table
CREATE TABLE donation(
    donation_id SERIAL PRIMARY KEY,
    donation_confirmation VARCHAR(30),
    donation_amount DECIMAL(10, 2),
    donation_date DATE,
    donation_type donation_type_enum,
    donor_id INT NOT NULL REFERENCES donor(donor_id),
    charity_id INT NOT NULL REFERENCES charity(charity_id),
    project_id INT NOT NULL REFERENCES project(project_id)
);


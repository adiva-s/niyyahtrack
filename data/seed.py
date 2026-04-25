import psycopg2
import random
import os

from faker import Faker
from dotenv import load_dotenv

load_dotenv()

fake = Faker()

conn = psycopg2.connect(
    dbname='niyyah tracks MVP',
    user='postgres',
    password=os.getenv('DB_PASSWORD'),
    host='localhost',
    port='5432'
)

cur = conn.cursor()

# generate fake data for DONOR table    
for i in range(50):
    cur.execute(
        "INSERT INTO DONOR (donor_first_name, donor_last_name, donor_phone, donor_email) VALUES (%s, %s, %s, %s)",
        (fake.first_name(), fake.last_name(), fake.numerify(text='###-###-####'), fake.email())
    )

# generate fake data for CHARITY table
for i in range(50):
    cur.execute(
        "INSERT INTO CHARITY (charity_name, charity_phone, charity_email) VALUES (%s, %s, %s)",
        (fake.company(), fake.numerify(text='###-###-####'), fake.email())
    )

# generate fake data for PROJECT table
for i in range(50):
    cur.execute(
        "INSERT INTO PROJECT (project_name, project_description, charity_id) VALUES (%s, %s, %s)",
        (fake.bs(), fake.text(), fake.random_int(min=1, max=50))
    )

# generate fake data for TESTIMONIALS table
for i in range(50):
    cur.execute (
        "INSERT INTO TESTIMONIALS (testimonial_title, testimonial_date, testimonial_content, testimonial_author, project_id) VALUES (%s, %s, %s, %s, %s)",
        (fake.sentence(), fake.date(), fake.text(), fake.name(), fake.random_int(min=1, max=50)) 
    )
    
# generate fake data for DONATION table
for i in range(50):
    cur.execute(
        "INSERT INTO DONATION (donation_confirmation, donation_amount, donation_date, donation_type, donor_id, charity_id, project_id) VALUES (%s, %s, %s, %s, %s, %s, %s)",
        (fake.bothify(text='TXN-####-??##'), fake.pydecimal(left_digits=5, right_digits=2, positive=True), fake.date_this_decade(), random.choice(['zakat', 'sadaqah', 'sadaqah_jariya', 'waqf']), fake.random_int(min=1, max=50), fake.random_int(min=1, max=50), fake.random_int(min=1, max=50))       
    )

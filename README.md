# Universe Database Project
This project is a database containing information about planets, stars, galaxies, and space-related stuff.

## Data Model
The database uses a relational model and consists of the following tables:

* Planet
* Star
* Galaxie
* Moon
* Spacecraft

Each table has its own set of attributes that describe the celestial body in detail. There are also relationships between the tables, mainly one-to-many (E.g. one planet can have many moons).

## Prerequisites
* PostgreSQL

## Setup
To use the database, follow these steps:

```bash
git clone https://github.com/LeandroFernandezRuhl/universe-database.git
```
Navigate to the project directory:
```bash
cd database-universe
```

Run the following command to rebuild the database:
```bash
psql -U postgres < universe.sql
```

## Usage
* Retrieve all the planets in the database
```sql
SELECT * FROM planet;
```

* Retrieve all the moons that orbit a specific planet
```sql
SELECT * FROM moon WHERE planet_id = specific_planet_id;
```

* Retrieve all the planets that orbit a specific star
```sql
SELECT *
FROM planet
WHERE star_id = (SELECT star_id FROM star WHERE name = 'Sun');
```

## Warning
Please note that the data used in this project is for demonstration purposes only and may not be accurate. The information provided is based on hypothetical scenarios and should not be used for any real-world applications.

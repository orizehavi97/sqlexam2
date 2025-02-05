CREATE TABLE tourists (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    passport_number TEXT UNIQUE NOT NULL,
    date_of_birth DATE NOT NULL,
    gender TEXT CHECK(gender IN ('Male', 'Female', 'Other')) NOT NULL,
    email TEXT UNIQUE NOT NULL,
    phone TEXT UNIQUE NOT NULL,
    country_id INTEGER NOT NULL,
    FOREIGN KEY (country_id) REFERENCES countries(id)
);

CREATE TABLE tourists_tours (
    tourist_id INTEGER NOT NULL,
    tour_id INTEGER NOT NULL,
    PRIMARY KEY (tourist_id, tour_id),
    FOREIGN KEY (tourist_id) REFERENCES tourists(id) ON DELETE CASCADE,
    FOREIGN KEY (tour_id) REFERENCES tours(id) ON DELETE CASCADE
);

INSERT INTO tourists_tours (tourist_id, tour_id) VALUES
(1, 2),
(1, 3),
(2, 3),
(2, 4),
(3, 5);
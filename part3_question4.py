import sqlite3

conn = sqlite3.connect('SQLEXAM.db')
conn.row_factory = sqlite3.Row
cursor = conn.cursor()


def execute_modify_query(_cursor, _conn, query) -> None:
    """Execute a modify query (insert, update, delete)"""
    _cursor.execute(query)
    _conn.commit()


def execute_read_query(_cursor, query) -> list:
    """Execute a read query (select)"""
    _cursor.execute(query)
    _rows = _cursor.fetchall()
    _answer = []
    for _row in _rows:
        _answer.append(dict(_row))
    return _answer


# a
def display_all_movies(_cursor) -> None:
    """Displays all movies from the table movies."""
    movies = execute_read_query(_cursor, f"SELECT * FROM movies")
    print("Movies: ")
    for item in movies:
        print(item)


# b
def search_movie_by_name(_cursor) -> None:
    """Search movies by name and display results."""
    movie_name = input("Enter a movie's name: ")

    search_result = execute_read_query(_cursor,
                                       f"SELECT movie_name FROM movies WHERE movie_name LIKE '%{movie_name}%'", )

    if search_result:
        print("Matching Movies:")
        for item in search_result:
            print(item["movie_name"])
    else:
        print("No movies found matching your search.")


# c
def add_movie(_cursor, _conn) -> None:
    """Asks the user for movie details and inserts them into the movies table"""
    movie_name = input("Enter movie name: ")
    genre = input("Enter movie genre: ")
    country = input("Enter country of production: ")
    language = input("Enter movie language: ")

    # Validating the year due to its constraint
    while True:
        try:
            year = int(input("Enter release year (must be 2009 or later): "))
            if year <= 2009:
                raise ValueError("Year must be 2009 or later.")
            break
        except ValueError as e:
            print(f"Invalid input: {e}")

    # Validating the revenue due to its constraint
    while True:
        try:
            revenue = float(input("Enter revenue (in millions, cannot be negative): "))
            if revenue < 0:
                raise ValueError("Revenue must be a positive number.")
            break
        except ValueError as e:
            print(f"Invalid input: {e}")

    # Insert new movie into database
    insert_query = f"INSERT INTO movies (movie_name, genre, country, language, year, revenue) VALUES ('{movie_name}', '{genre}', '{country}', '{language}', {year}, {revenue})"
    try:
        execute_modify_query(_cursor, _conn, insert_query)
        print("Movie added successfully!")
    except Exception as e:  # I could've chosen sqlite3.IntegrityError as the error type but didn't know what other errors could appear
        print(f"Error: {e}")


display_all_movies(cursor)
search_movie_by_name(cursor)
add_movie(cursor, conn)

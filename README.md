prerequisites - 
1) Install postgreSQL from https://www.postgresql.org/download/windows/
2) Install with the setup, and login with the password 12345, port 5432
3) Make a DB inside pgAdmin with name "documents_db", and add the following sql commands below :


CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    role TEXT DEFAULT 'employee'
);

CREATE TABLE documents (
    id SERIAL PRIMARY KEY,
    index_id TEXT UNIQUE NOT NULL,
    original_filename TEXT NOT NULL,
    stored_filename TEXT NOT NULL,
    department TEXT,
    description TEXT,
    uploaded_by TEXT,
    upload_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    file_path TEXT
);

4) Inside Web.config, check lines 9-11, if they match the credentials.
5) Go to : Tools → NuGet Package Manager → Package Manager Console : enter "Update-Package -reinstall" in the console
6) Re-build the program from Build --> Rebuild Solution
7) Run the solution.

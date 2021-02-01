


psql -v ON_ERROR_STOP=1 --username postgres postgres <<-EOSQL
    CREATE USER pacs WITH PASSWORD 'password';
    CREATE DATABASE bahmni_pacs;
    CREATE DATABASE pacsdb;
    GRANT ALL PRIVILEGES ON database bahmni_pacs to pacs;
    GRANT ALL PRIVILEGES ON database pacsdb to pacs;
EOSQL
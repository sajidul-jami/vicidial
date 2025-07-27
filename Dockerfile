FROM cytopia/mariadb-10.3

# Set root password
# ENV MYSQL_ROOT_PASSWORD=asterisk


# Copy initialization SQL
COPY init.sql /docker-entrypoint-initdb.d/init.sql
COPY MySQL_AST_CREATE_tables.sql /docker-entrypoint-initdb.d/MySQL_AST_CREATE_tables.sql

#!/bin/bash

# Variables
IMAGE_NAME="call-center-db"
CONTAINER_NAME="call-center-db"
DB_PASSWORD="asterisk"
DB_NAME="asterisk"

# Step 1: Build the Docker image
echo "Building Docker image..."
docker build -t $IMAGE_NAME .

# Step 2: Run the container with volume and ports
echo "Running MySQL container..."
docker run --name $CONTAINER_NAME -e MYSQL_ROOT_PASSWORD=$DB_PASSWORD -p 3306:3306 -d $IMAGE_NAME

# Step 3: Wait for MySQL to initialize
echo "Waiting for MySQL to initialize..."
sleep 15

# Step 4: Create database if it doesn't exist (optional)
echo "Creating database '$DB_NAME' if not exists..."
docker exec -i $CONTAINER_NAME mysql -uroot -p$DB_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"

# Step 5: Import SQL files by running source inside MySQL
echo "Importing SQL files inside MySQL..."

docker exec -i $CONTAINER_NAME mysql -uroot -p$DB_PASSWORD $DB_NAME -e "
source /docker-entrypoint-initdb.d/init.sql;
source /docker-entrypoint-initdb.d/MySQL_AST_CREATE_tables.sql;
"

# Step 6: Show logs
echo "Checking container logs..."
docker logs $CONTAINER_NAME --tail 20

echo "Done."

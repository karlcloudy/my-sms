# My Student Management System (mySms)
This is a project created for learning the basics of Ruby on Rails.

## Prerequisites

Docker (& Docker Compose) must be installed on your system to run this project.

## Installation

Clone this repo onto your system and run the following commands from the root:
```
docker-compose build
```
This will build the mySMS Docker image.

## Running the application

Run the following command to spool up the application in the background:
```
docker-compose up -d
```

Prepare the application databases using the following command
```
docker-compose exec app rake db:create db:migrate
```

The application is started automatically when the image runs, so you can browse to http://localhost:3000 to access the application once the database has been prepared.

Perform application tests by running:
```
docker-compose exec app rake db:create db:migrate RAILS_ENV=test
docker-compose exec app rspec
```

## Shutting down the application

To bring down the application, invoke the following command to spool down the containers
```
docker-compose down
```
If you wish to remove all the data as well, run the following to delete the containers:
```
docker-compose rm
```

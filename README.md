# FinalSpecifications

# Blood Donor System

Blood Donor System is a web application designed to manage blood donors, blood banks, and blood requests for hospitals. This system facilitates the process of finding and managing blood donations efficiently.

## Features

- Create and manage blood donors with attributes like full name, blood type, town, city, and phone number.
- Add blood to the blood bank, updating blood quantities for different branches.
- Request blood from donors based on the hospital, city, town, blood type, and required units.
- Search for available blood in the system and notify donors and requesters accordingly.
- Integration with 3rd party APIs for location-based blood bank search.
- User authentication for branch management.
- Separate services for donor management, blood search, and branch authentication.

## Technologies Used

- C# for backend development
- Entity Framework Core for database interactions
- ASP.NET Core for web services
- Azure services for deployment
- SQL Server for the database
- RESTful API design
- Azure Message Queues for background tasks

## Database Schema

The database schema includes tables for donors, blood banks, blood requests, and branches. Refer to the [Database Schema](database-schema.sql) for details.

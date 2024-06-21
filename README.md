# Lmima Food App

Project consists of 2 main folders:

- `back-end`: Contains the backend code for a simple REST API using Node.js, Express, TypeScript, and Prisma.
- `front-end`: Contains the code for the Flutter cross-platform (mobile/web) app.

## Prerequisites

Before you begin, ensure that you have the following software installed on your system:

1. [Docker](https://www.docker.com/)
2. [NodeJS](https://nodejs.org/en/download/)
   - You can use nvm (Node Version Manager) which allows you to easily switch between different node versions.
3. [Flutter SDK](https://flutter.dev/docs/get-started/install)
4. A text editor or IDE (e.g., Visual Studio Code).
5. [Git command-line tools (git)](https://git-scm.com/downloads)
6. Running the Project Locally

To start developing the application, follow these steps:

## Clone the Repository

- git clone [git@gitlab.com:esslidev/lmima-food.git](https://github.com/esslidev/lmima-food.git)
- cd full-stack-flutter-web-app

## Build and Start the Containers

1. Open a terminal and navigate to the root directory of this repository.
2. Execute the following commands:
   - docker-compose build
   - docker-compose up
3. Control the database from [localhost:5555](localhost:5555).
4. Verify that the backend is working by accessing [localhost:4000](localhost:4000).

## Debug and Start the Flutter Apps

- After building the containers, you can run the back-office or frontend using the DEBUG and START in the left side of vs code.

# Ruby on Rails REST API

This project is a basic example of building REST API in Rails 4.

## Getting Started

To get you started you can simply clone the rails-rest-api repository, install gems, initialize database and run the application.

### Prerequisites

You need to must a git client to clone the repository. You can get it from [http://git-scm.com/](http://git-scm.com/).

Also you must to have Ruby 2.2 and Rails 4.0.0+ installed.

1. Clone rails-rest-api

    Clone the rails-rest-api repository using git:

    ```
    git clone https://github.com/romandunets/rails-rest-api.git
    ```

1. Install gems
    ```
    bundle install
    ```

1. Initialize database
    ```
    rake db:create db:migrate db:seed
    ```

1. Run the application in localhost
    ```
    rails server
    ```

## Resources
There are one resource, **users**

The route for it is

- /api/users

### List users
You can list all users making a GET request to ```/api/users.json```

### Get user
You can get one user making a GET request to ```/api/users/1.json``` (replace 1 by a target user id)

### Create user
You can create an new user making a POST request to ```/api/users.json``` with the following parameters
```
{ "email": "johndoe@example.com", "first_name": "John", "second_name: "Doe" }
```

### Update user
You can create an new user making a PUT / PATCH request to ```/api/users/1.json``` (replace 1 by a target user id) with the following parameters
```
{ "email": "johndoe@example.com", "first_name": "John", "second_name: "Doe" }
```

### Delete user
You can delete an existing user making a DELETE request to ```/api/users/1.json``` (replace 1 by a target user id)

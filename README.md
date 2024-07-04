# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.

Jungle is a project that was used to simulate a real-world scenario in which you only have a little time to learn a new language before having to start work on an existing project in that new language. This project involved working on every level of the existing Jungle app, from the database to front-end rendering or implementing a completely new feature. This project also provided the chance to experience bug-fixing in unfamiliar code and to create both unit and end-to-end tests for both new and existing code.

## Features Implented

- Sold Out badge on products with zero stock
- Admin Security using basic http authentication
- Category functionality to allow admin users to create new categories
- User authentication with encrypted passwords
- Review feature for visitors to view and users to create a review of a product
- Enhanched My Cart and Order Details UI/UX 





## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe

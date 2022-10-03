# Offinso District Stores data collection app

> We created a to collect stores data and revenue

## Built With

- Javascript
- Ruby
- Ruby on Rails

### Prerequisites

- Node.js version 16.4.2
- Ruby version 3.1.2
- Rails version 7.0.3
- Make sure you are using the latest version of ruby `rvm use 3.1.2`

## Getting Started 🙌

To get a local copy up and running follow these simple example steps.
Verify ruby and rails installation

```
  ruby -v
  rails -v
```

## Clone repository and start application

```
git clone https://github.com/learnwithalfred/furry-invention.git
cd furry-invention
bundle install
yarn install
rails db:create
rails db:migrate
./bin/dev

```

## Start application

`./bin/dev`

## List all tables

```
<!-- show tables -->
ActiveRecord::Base.connection.tables

<!-- list table columns -->
User.column_names
```

## Accounts

- Admin Account
  - email: admin@test.com
  - password: password
- Tax collector
  - email: collector@test.com
  - password: password

👤 **Alfred Boateng**

- GitHub: [@learnwithalfred](https://github.com/learnwithalfred)
- Twitter: [@kb_alfred](https://twitter.com/kb_alfred)
- LinkedIn: [@learnwithalfred](https://www.linkedin.com/in/learnwithalfred/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Hat tip to anyone whose code was used
- Inspiration
- etc

## 📝 License

This project is [MIT](./LICENSE) licensed.

<!--  Todo -->

- pagination

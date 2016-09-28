### Building a CRUD interface with React and Ruby on Rails

Built basic Rails 4 API to render data in JSON

Using react-rails gem

React is handling the views and display of data

Based on Pluralsight tutorial:

http://tutorials.pluralsight.com/ruby-ruby-on-rails/building-a-crud-interface-with-react-and-ruby-on-rails

### Tools

Rails 4.2.4

react-rails gem

Docker

### Docker Cheatsheet

- build docker image based on Dockerfile

  - docker-compose build

- spin up and connect containers as directed in docker-compose.yml

  - docker-compose up -d

- run standard rails commands

  - docker-compose run app bundle install

  - docker-compose run app rails console

  - docker-compose run app rake routes

  - docker-compose run app rake db:reset db:migrate

  - docker-compose run app rake db:seed

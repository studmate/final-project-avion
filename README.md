# :cat2: Studmate :dog:

A Ruby on Rails Application

Owners who want the best mate for their pets. This application will list all interested owners based on the user's specified distance including the picture of the pets, their breed, and other details like if they are vaccinated or not. It uses a dating app like interface and sees all the list of owners that are interested in your pets. Once you are both interested in each other pets, you can now message each other for further details.

#### Version

```
  Ruby 2.7.2
  Rails 6.1.3.2
  Node v14.4.0
  Yarn 1.22.4
```

#### Getting started
To get started with the app, clone the repo and then install the needed gems:
```
$ bundle install
```
Next, migrate the database:
```
$ rails db:migrate
```
Run the Ruby Linter
```
$ rubocop
```
Finally, run the test suite to verify that everything is working correctly:
```
$ rspec spec
```
If the test suite passes, you'll be ready to run the app in a local server:
```
$ rails server
```

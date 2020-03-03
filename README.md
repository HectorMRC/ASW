# IssueTrackinator
This is the repository for the "Issue tracker" project for ASW.
All the project is developed using [Ruby on Rails](https://rubyonrails.org/) framework, which is based on the MVC pattern.
We used [AWS Cloud9](https://aws.amazon.com/es/cloud9/) service to develop the application.

## Usage
To start the server, simply use:
```
rails server
```
This will run the application on your Amazon EC2 instance where you configured your C9 environment
If you create any migration on a model, to apply this changes to the database, you have to run:
```
rails db:migrate
```
or you can also execute:
```
rails db:migrate:reset
```
which will re-do all the tables in database

## Deploy
For deploy of our application, we're using [Heroku](https://www.heroku.com/), which allows us to have a public accesible environment for all of us, and also, have CI, as we have enabled the [autodeploy feature](https://devcenter.heroku.com/articles/github-integration) of Heroky.

For accesing our application, which is updated to the last version of master, you can use this [link](https://asw-issuetrackinator.herokuapp.com/) or click on our logo
<div align="center">
<a href="https://asw-issuetrackinator.herokuapp.com/">
<img border="0" alt="logoIssueTrackinator" src="https://i.imgur.com/YkbWpZ3.png" width="200" height="200">
</div>

## Collaborators
 * Rubén Presa Martín (ruben.presa@est.fib.upc.edu)
 * Hèctor Morales Carnicé (hector.morales.carnice@est.fib.upc.edu)
 * Marc Revelles Segalés (marc.revelles@est.fib.upc.edu)
 * Jesús Mercadal Mir (jesus.mercadal@est.fib.upc.edu)


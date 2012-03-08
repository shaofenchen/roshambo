#roshambo game - [*Rock, Paper, Scissors, Lizard, Spock version*] (http://www.samkass.com/theories/RPSSL.html)

[*Heroku link please click here: http://http://sharp-frost-6860.herokuapp.com/*](http://http://sharp-frost-6860.herokuapp.com/). 

Note: Application using Rails3.1 and above should create heroku app following below steps:

(I was using ruby 1.8.7, got many problems when deployed to heroku. If you did as me, following links at the bottom may help)
1.Gemfile changed to 

...

group :development do
  gem 'sqlite3', '1.3.5'
end

group :production do
  gem 'pg'
end

...

#For seperating the database use in development env and production env(heroku use PostgreSQL)
Run 
bundle install --without production
after you change your Gemfile

run
heroku create --stack cedar
to host app in heroku

Description exactly in these [link1](http://stackoverflow.com/questions/8057893/deploying-database-on-heroku-sqlite3-postgresql-rails-error-500-were-sorr)
[link2](http://stackoverflow.com/questions/7492636/uploading-to-heroku-db-rakemigrate-problem£©
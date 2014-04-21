# TTTT

1. Heroku (Mon 4/21)
  1. Make sure your project is a git repo.
  2. Run `heroku login` in terminal.
  3. Run `heroku create`.
    * This will create a new app in your account, with a super epic name.
  4. Push your app to Heroku
    * `git push heroku master`
    * `heroku run bundle exec rake db:migrate` to run your migrations on heroku

  Gotchas:
  * Make sure you're using Postgres. Heroku doesn't support SQLite3.
  * `config.initialize_on_precompile = false` in config/application.rb
  * `ruby '2.1.1'` in your Gemfile
  * If you don't have the `heroku` terminal command, install the [Heroku Toolbelt](https://toolbelt.heroku.com/)
  * If you change your super epic default app name on Heroku, you also have to change your git URI.



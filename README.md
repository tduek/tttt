# TTTT

### 1. Heroku (Mon 4/21)
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

### 2. [Paperclip][paperclip] &  [Figaro][figaro] (Tue 4/22)
  1. Paperclip makes it easy to manage file attachments to models.
    * Many storage options. Use [S3][s3] on AWS for Heroku. See:
      * Gemfile: `gem 'paperclip'` & `gem 'aws-sdk'`
      * config/application.rb
      * app/models/user.rb
      * app/views/users/new.html.erb & app/views/users/show.html.erb
    * Gotchas:
      * Make sure you make your S3 bucket in the US Standard region.
      * Put this on the form that submits the file: `enctype=multipart/form-data`
      * DONT GIT COMMIT YOUR AWS KEYS!

  2. Figaro makes it easy to keep your private keys.. private.
    1. `gem 'figaro'`
    2. `rails generate figaro:install`
    3. Edit config/application.yml
    4. `rake figaro:heroku` to push up your keys to Heroku.

[paperclip](https://github.com/thoughtbot/paperclip)
[figaro](https://github.com/laserlemon/figaro)
[s3](http://aws.amazon.com/s3/)




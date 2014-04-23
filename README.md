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

[paperclip]: https://github.com/thoughtbot/paperclip
[figaro]: https://github.com/laserlemon/figaro
[s3]: http://aws.amazon.com/s3/

### 3. [Omniauth][oauth] & [Oauth-Facebook][oauth-fb] (Wed 4/23)
  1. Files to look at:
    * Gemfile
    * config/initializers/omniauth.rb
    * app/views/layouts/application.html.erb
    * config/routes.rb
    * app/controllers/sessions_controller.rb
  2. Flow
    1. User get to your app and hits a link to 'Login w/fb'
      * Sends them to /auth/facebook, which gets intercepted by omniauth gem.
    2. This redirects them to facebook, where they authorize your app.
    3. Facebook redirects to your app (to /auth/facebook/callback)
    4. You handle the redirect in some controller action.
      * You'll probably grab a user from the db or create one from the info in `request.env['omniauth.auth']`
  3. Gotchas
    * Make sure you create your app on www.developers.facebook.com
      * Whitelist your redirect URI in Settings > Valid Oauth redirect URIs
    * Have a route in routes.rb for auth/facebook/callback

[oauth](https://github.com/intridea/omniauth)
[oauth-fb](https://github.com/mkdynamic/omniauth-facebook)



class SessionsController < ApplicationController

  def create
    @user = User.find_or_create_by_auth_hash(request.env['omniauth.auth'])

    log_in(@user)
    redirect_to root_url
  end

  def destroy
    log_out!
    redirect_to root_url
  end
end

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: "Successfully created account for #{@user.email}"
    else
      flash.now[:alert] = 'Failed to save. Check your input below.'
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :avatar)
  end
end

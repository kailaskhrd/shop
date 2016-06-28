class UsersController < ApplicationController
 
 before_filter :authorize_login, :except => [:new, :create]

  def index
     @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @users = User.all
    @user = User.create(user_params)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @users = User.all
    @user = User.find(params[:id])
    authorize @user, :update?

    @user.update_attributes(user_params)
    redirect_to user_path(@user)
  end


  def show
    @user = User.find(params[:id])
  end

  def delete
    @user = User.find(params[:user_id])
  end

  def destroy
    @users = User.all
    @user = User.find(params[:id])
    @user.destroy
  end


  private
    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end

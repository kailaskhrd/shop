class UsersController < ApplicationController
 
 before_filter :authorize_login, :except => [:new, :create]

  def index
     @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    roles = Role.where(:id =>role_params)
    @user = User.create(user_params)   
    if !@user.errors.any?
       @user << roles
      redirect_to users_path, notice: 'user created '
    else
      render 'new'
    end
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

  def destroy
    @users = User.all
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
    def role_params
      params.require(:role).permit(:id => [])
    end    
end
class RolesController < ApplicationController
  def index
  	 @roles = Role.all
  end

  def new
    @role = Role.new
  end

  def create
    @roles = Role.all
    @role = Role.create(role_params)
  end

  def edit
    @role = Role.find(params[:id])
  end

  def update
    @roles = Role.all
    @role = Role.find(params[:id])      
    
    @role.update_attributes(role_params)
  end

  def delete
    @role = Role.find(params[:role_id])
  end

  def destroy
    @roles = Role.all
    @role = Role.find(params[:id])
    @role.destroy
  end

private
  def role_params
    params.require(:role).permit(:name)
  end

end

class Admin::UsersController < ApplicationController
  layout "admin"
  def index
    @users = User.all
  end

  def to_normal
    @user = User.find(params[:id])
    @user.to_normal!
    redirect_to admin_users_path, notice: "修改權限成功"
  end

  def to_admin
    @user = User.find(params[:id])
    @user.to_admin!
    redirect_to admin_users_path, notice: "修改權限成功"
  end
end

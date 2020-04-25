class Admin::UsersController < ApplicationController

    before_action :authenticate_admin!

    def index
       @users = User.all.with_deleted.order(created_at: :desc).page(params[:page]).per(10)
       @user_all = User.all.with_deleted
    end

    def show
       @user = User.with_deleted.find(params[:id])
    end

    def restore
       @user = User.with_deleted.find(params[:id])
       @user.restore
       redirect_to admin_user_path(@user)
    end

    def destroy
       @user = User.with_deleted.find(params[:id])
       @user.destroy
       redirect_to admin_user_path(@user)
    end

end

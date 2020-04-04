class Users::UsersController < ApplicationController

	before_action :correct_user, only: [:edit, :update, :withdraw, :destroy]
	before_action :login_model, only: [:show]

	def show
     @user = User.find(params[:id])
	end

	def edit
     @user = User.find(current_user.id)
	end

	def update
	   @user = User.find(current_user.id)
	     if @user.update(user_params)
	       redirect_to user_path(current_user)
       else
        render 'edit'
       end
	end

	def withdraw
	end

	def destroy
	   user = User.find(current_user.id)
	   user.destroy
	   redirect_to thanks_path
	end

    private

      def user_params
        params.require(:user).permit(:name, :name_kana, :nickname, :age, :prefecture, :city, :image, :email)
      end
      def correct_user
        user = User.find(params[:id])
          if user_signed_in?
            if current_user != user
              redirect_to edit_user_path(current_user)
            end
          elsif lawyer_signed_in?
              redirect_to edit_lawyer_path(current_lawyer)
          else
              redirect_to root_path
          end
      end
      def login_model
        user = User.find(params[:id])
          if user_signed_in?
            if current_user != user
              redirect_to user_path(current_user)
            end
          elsif lawyer_signed_in? || admin_signed_in?
          else
              redirect_to root_path
          end
     end
end

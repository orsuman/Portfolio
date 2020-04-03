class Users::UsersController < ApplicationController

	before_action :authenticate_user!, only: [:show, :edit, :update, :withdraw, :destroy]

	def show
	end

	def edit
	end

	def update
	   user = User.find(current_user.id)
	   user.update(user_params)
	   redirect_to user_path(current_user)
	end

	def withdraw
	end

	def destroy
	   user = User.find(current_user.id)
	   user.destroy
	   redirect_to root_path
	end

    private

      def user_params
        params.require(:user).permit(:name, :name_kana, :nickname, :sex, :age, :prefecture, :city, :image, :email)
      end
end

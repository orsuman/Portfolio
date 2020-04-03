class Lawyers::UsersController < ApplicationController

    before_action :authenticate_lawyer!, only: [:show]

	def show
	   @user = User.find(params[:id])
	end
end

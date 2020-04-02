class Users::TroublesController < ApplicationController

	before_action :authenticate_user!,only: [:new, :confirm, :create]

	def index
	   @troubles = Trouble.all
	end

	def new
	   @trouble = Trouble.new
	   @user = User.find(current_user.id)
	end

	def confirm
	   @trouble = Trouble.new(trouble_params)
	   @trouble.user.id = current_user.id
	end

	def create
	   @trouble = Trouble.new(trouble_params)
	   @trouble.user.id = current_user.id
	     if @trouble.save
	     	redirect_to @trouble
	     else
	     	render 'confirm'
	     end
	end

	def show
	   @trouble = Trouble.find(params[:id])
	end


	private
	  def trouble_params
	  	 params.require(:trouble).permit(:title, :body, :image)
	  end

end
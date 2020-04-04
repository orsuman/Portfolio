class Users::TroublesController < ApplicationController

    before_action :login, only: [:index]
	before_action :user_login, only: [:new, :confirm, :create, :back]

	def index
	   @troubles = Trouble.all
	end

	def new
	   @trouble = Trouble.new
	   @categories = Category.all
	end

	def confirm
	   @trouble = Trouble.new(trouble_params)
	   @trouble.user_id = current_user.id
       return if @trouble.valid?
         @categories = Category.all
         render :new
	end

	def back
       @trouble = Trouble.new(trouble_params)
	   @categories = Category.all
       render :new
	end

	def create
	   @trouble = Trouble.new(trouble_params)
	   @trouble.user_id = current_user.id
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
	  	 params.require(:trouble).permit(:title, :body, :image, :category_id)
	  end
	  def login
	  	unless user_signed_in? || lawyer_signed_in? || admin_signed_in?
	  	  redirect_to root_path
	  	end
	  end
	  def user_login
	  	unless user_signed_in?
	  	  redirect_to troubles_path
	  	end
	  end

end
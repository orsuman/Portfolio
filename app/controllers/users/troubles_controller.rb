class Users::TroublesController < ApplicationController

    before_action :login, only: [:index]
    before_action :true_category, only: [:index]
    before_action :true_trouble, only: [:show]
	before_action :user_login, only: [:new, :confirm, :create, :back]
	before_action :true_categories, only: [:index, :new, :confirm, :create, :back]

	def index
	    @categories = Category.all
        if params[:category_id].nil?
          troubles = Trouble.all.order(created_at: :desc)
          @true_troubles =[]
          troubles.each do |trouble|
            if trouble.category.is_active == true
              @true_troubles << trouble
            end
          end
          @troubles = Kaminari.paginate_array(@true_troubles).page(params[:page])
        else
          @category = Category.find(params[:category_id])
          @troubles = @category.troubles.order(created_at: :desc).page(params[:page])
        end
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
      def true_category
        unless params[:category_id].nil?
          category = Category.find(params[:category_id])
          if category.is_active == false
            redirect_to troubles_path
          end
        end
      end
      def true_trouble
        trouble = Trouble.find(params[:id])
        if trouble.category.is_active == false
          redirect_to troubles_path
        end
      end
	  def user_login
	  	unless user_signed_in?
	  	  redirect_to troubles_path
	  	end
	  end
      def true_categories
          categories = Category.all
          @true_categories = []
          categories.each do |c|
            if c.is_active == true
               @true_categories << c
            end
          end
      end

end
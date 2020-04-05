class Lawyers::CommentsController < ApplicationController

	before_action :lawyer_login, only: [:new, :confirm, :create, :back]

	def new
	   @comment = Comment.new
       @trouble = Trouble.find(params[:trouble_id])
       @comment.trouble_id = params[:trouble_id]
	end

	def confirm
	   @comment = Comment.new(comment_params)
	   @comment.lawyer_id = current_lawyer.id
       return if @comment.valid?
         @trouble = Trouble.find(@comment.trouble_id)
         render :new
	end

	def back
       @comment = Comment.new(comment_params)
       @trouble = Trouble.find(@comment.trouble_id)
       render :new
	end

	def create
	   @comment = Comment.new(comment_params)
	   @comment.lawyer_id = current_lawyer.id
	     if @comment.save
	     	redirect_to trouble_path(@comment.trouble_id)
	     else
	     	render 'confirm'
	     end
	end

	private
	  def comment_params
	  	 params.require(:comment).permit(:comment, :trouble_id)
	  end
	  def lawyer_login
	  	unless lawyer_signed_in?
	  	  redirect_to troubles_path
	  	end
	  end
end

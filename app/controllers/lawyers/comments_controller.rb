class Lawyers::CommentsController < ApplicationController

    before_action :lawyer_new, only: [:new]
    before_action :lawyer_create, only:[:confirm, :create, :back]

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

      def lawyer_new
      	trouble = Trouble.find(params[:trouble_id])
      	if lawyer_signed_in?
      	  if trouble.user.deleted_at == nil
      	    #回答は一人一度限りを設定
      	  	if Comment.exists?(trouble_id: trouble.id, lawyer_id: current_lawyer.id)
      	  	  redirect_to trouble_path(trouble)
      	    end
      	  else
      	  	redirect_to trouble_path(trouble)
      	  end
        else
      	  redirect_to troubles_path
      	end
      end

      def lawyer_create
      	comment = Comment.new(comment_params)
      	trouble = Trouble.find(comment.trouble_id)
      	if lawyer_signed_in?
      	  if trouble.user.deleted_at == nil
      	    #回答は一人一度限りを設定
      	    if Comment.exists?(trouble_id: trouble.id, lawyer_id: current_lawyer.id)
      	  	  redirect_to trouble_path(trouble)
      	    end
      	  else
      	  	redirect_to trouble_path(trouble)
      	  end
        else
      	  redirect_to troubles_path
      	end
      end

end

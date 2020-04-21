class Users::ReferencesController < ApplicationController

  	before_action :authenticate_user!

    def index
      @true_references = []
      current_user.references.order(created_at: :desc).each do |reference|
        if reference.comment.trouble.category.is_active == true
        @true_references << reference
        end
      @references = Kaminari.paginate_array(@true_references).page(params[:page])
      end
    end

  	def create
  	   @comment = Comment.find(params[:comment_id])
       reference = current_user.references.new(comment_id: @comment.id)
       reference.save
      end
    def destroy
       @comment = Comment.find(params[:comment_id])
       reference = current_user.references.find_by(comment_id: @comment.id)
       reference.destroy
    end

end

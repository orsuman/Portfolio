class Users::ReferencesController < ApplicationController

	before_action :authenticate_user!

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

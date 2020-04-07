class Admin::CommentsController < ApplicationController
	before_action :authenticate_admin!

	def destroy
       comment = Comment.find(params[:id])
       comment.destroy
       flash[:success] = 'You have destroyed successfully.'
       redirect_to trouble_path(comment.trouble_id)
	end

end

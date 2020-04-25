class Admin::CommentsController < ApplicationController

    before_action :authenticate_admin!

    def destroy
       comment = Comment.find(params[:id])
       comment.destroy
       redirect_to trouble_path(comment.trouble_id)
    end

end

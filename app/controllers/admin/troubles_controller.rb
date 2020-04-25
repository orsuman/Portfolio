class Admin::TroublesController < ApplicationController

    before_action :authenticate_admin!

    def destroy
       trouble = Trouble.find(params[:id])
       trouble.destroy
       redirect_to troubles_path
    end

end

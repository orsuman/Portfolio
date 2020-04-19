class Lawyers::MapController < ApplicationController

    before_action :login, only: [:show]

	def show
	   @lawyer = Lawyer.find(params[:id])
	end


	private
	  def login
	  	unless user_signed_in? || lawyer_signed_in? || admin_signed_in?
	  	  redirect_to root_path
	    end
	  end

end

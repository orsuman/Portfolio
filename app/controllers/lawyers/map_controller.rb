class Lawyers::MapController < ApplicationController

    before_action :login_model, only: [:show]

	  def show
	     @lawyer = Lawyer.with_deleted.find(params[:id])
	  end


	  private
      def login_model
        lawyer = Lawyer.with_deleted.find(params[:id])
          if lawyer.deleted_at == nil
	  	    unless user_signed_in? || admin_signed_in?
	  	    	if lawyer_signed_in?
	  	    	  if current_lawyer.id != lawyer.id
	  	    	  	redirect_to lawyer_path(current_lawyer)
	  	    	  end
	  	    	else
	  	          redirect_to root_path
	  	        end
	        end
          else
            unless admin_signed_in?
              if lawyer_signed_in?
                redirect_to lawyer_path(current_lawyer)
              elsif user_signed_in?
                redirect_to user_path(current_user)
              else
                redirect_to root_path
              end
            end
          end
      end
end

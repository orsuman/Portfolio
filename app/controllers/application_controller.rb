class ApplicationController < ActionController::Base

  private

  def after_sign_in_path_for(resource)
     case resource
       when Admin
              troubles_path
       when Lawyer
              lawyer_path(current_lawyer)
       when User
              user_path(current_user)
     end
  end

  def after_sign_out_path_for(resource)
  	 if resource == :admin
  	      new_admin_session_path
  	 else
  	      root_path
  	 end
  end

end
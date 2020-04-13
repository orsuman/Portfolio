class HomeController < ApplicationController

	before_action :login_model, only: [:top]

	def top
	end
	def about
	end

    private

      def login_model
          if admin_signed_in? || lawyer_signed_in? || user_signed_in?
              redirect_to home_about_path
          end
      end
end

class HomeController < ApplicationController

    before_action :login_model, only: [:top]

    def top
    end

    def about
    end

    def thanks
    end

    private

      def login_model
          if admin_signed_in?
              redirect_to admin_inquiries_path
          elsif lawyer_signed_in? || user_signed_in?
              redirect_to home_about_path
          end
      end

end

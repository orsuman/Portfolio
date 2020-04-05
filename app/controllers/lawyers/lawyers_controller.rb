class Lawyers::LawyersController < ApplicationController

	before_action :correct_lawyer, only: [:edit, :update, :withdraw, :destroy]

	def show
       @lawyer = Lawyer.find(params[:id])
       reference = []
       @lawyer.comments.each do |comment|
       	 reference << comment.references.count
         @references = reference.sum
       end
	end

	def edit
	   @lawyer = Lawyer.find(current_lawyer.id)
	end

	def update
	   @lawyer = Lawyer.find(current_lawyer.id)
	     if @lawyer.update(lawyer_params)
	       redirect_to lawyer_path(current_lawyer)
	     else
	       render 'edit'
	     end
	end

	def withdraw
	end

	def destroy
	   lawyer = Lawyer.find(current_lawyer.id)
	   lawyer.destroy
	   redirect_to thanks_path
	end

    private

      def lawyer_params
        params.require(:lawyer).permit(:name, :name_kana, :office, :profession, :age, :postal_code, :prefecture, :address, :profile, :phone_number, :image, :email)
      end

      def correct_lawyer
        lawyer = Lawyer.find(params[:id])
          if lawyer_signed_in?
            if current_lawyer != lawyer
              redirect_to edit_lawyer_path(current_lawyer)
            end
          elsif user_signed_in?
              redirect_to edit_user_path(current_user)
          else
              redirect_to root_path
          end
      end

end

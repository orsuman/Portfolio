class Lawyers::LawyersController < ApplicationController

	before_action :correct_lawyer, only: [:edit, :update, :withdraw, :destroy]
  before_action :login_model, only: [:show]

	def show
     @lawyer = Lawyer.with_deleted.find(params[:id])
     @true_comments = []
     reference = []
       @lawyer.comments.each do |comment|
         if comment.trouble.category.is_active == true
           @true_comments << comment
           reference << comment.references.count
           @true_references = reference.sum
         end
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
        params.require(:lawyer).permit(:name, :name_kana, :office, :profession, :age, :postal_code, :prefecture, :address, :profile, :phone_number, :url, :image, :email)
      end

      def correct_lawyer
        lawyer = Lawyer.find(params[:id])
          if lawyer_signed_in?
            if current_lawyer.id != lawyer.id
              redirect_to edit_lawyer_path(current_lawyer)
            end
          elsif user_signed_in?
              redirect_to edit_user_path(current_user)
          else
              redirect_to root_path
          end
      end
      def login_model
        lawyer = Lawyer.with_deleted.find(params[:id])
          if lawyer.deleted_at == nil
            if lawyer_signed_in?
              if current_lawyer.id != lawyer.id
                redirect_to lawyer_path(current_lawyer)
              end
            elsif admin_signed_in? || user_signed_in?
            else
                redirect_to root_path
            end
          else
            if lawyer_signed_in?
                redirect_to lawyer_path(current_lawyer)
            elsif user_signed_in?
                redirect_to user_path(current_user)
            elsif admin_signed_in?
            else
                redirect_to root_path
            end
          end
     end

end

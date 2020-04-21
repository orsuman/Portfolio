class Users::UsersController < ApplicationController

  	before_action :correct_user, only: [:edit, :update, :withdraw, :destroy]
  	before_action :login_model, only: [:show]

  	def show
       @user = User.with_deleted.find(params[:id])
       @true_troubles = []
         @user.troubles.order(created_at: :desc).each do |trouble|
           if trouble.category.is_active == true
             @true_troubles << trouble
           end
         end
       @troubles = Kaminari.paginate_array(@true_troubles).page(params[:page])
  	end

  	def edit
       @user = User.find(current_user.id)
  	end

  	def update
  	   @user = User.find(current_user.id)
  	     if @user.update(user_params)
  	       redirect_to user_path(current_user)
         else
          render 'edit'
         end
  	end

  	def withdraw
  	end

  	def destroy
  	   user = User.find(current_user.id)
  	   user.destroy
  	   redirect_to thanks_path
  	end

    private

      def user_params
        params.require(:user).permit(:name, :name_kana, :nickname, :age, :prefecture, :city, :image, :email)
      end

      def correct_user
        user = User.find(params[:id])
          if user_signed_in?
            if current_user.id != user.id
              redirect_to edit_user_path(current_user)
            end
          elsif lawyer_signed_in?
              redirect_to edit_lawyer_path(current_lawyer)
          else
              redirect_to root_path
          end
      end

      def login_model
        user = User.with_deleted.find(params[:id])
          if user.deleted_at == nil
            if user_signed_in?
              if current_user.id != user.id
                redirect_to user_path(current_user)
              end
            elsif lawyer_signed_in?
              @users = []
                current_lawyer.comments.each do |comment|
                @users << comment.trouble.user.id
            end
            elsif admin_signed_in?
            else
                redirect_to root_path
            end
          else
            if user_signed_in?
                redirect_to user_path(current_user)
            elsif lawyer_signed_in?
                redirect_to lawyer_path(current_lawyer)
            elsif admin_signed_in?
            else
                redirect_to root_path
            end
          end
      end

end

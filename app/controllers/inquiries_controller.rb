class InquiriesController < ApplicationController

  	def new
  	   @inquiry = Inquiry.new
  	end

  	def create
  	   @inquiry = Inquiry.new(inquiry_params)
  	     if @inquiry.save
  	     	redirect_to thanks_inquiries_path
  	     else
  	     	render 'new'
  	     end
  	end

	def thanks
	end

  	private
  	  def inquiry_params
  	  	 params.require(:inquiry).permit(:subject, :email, :send_email, :name, :name_kana, :sex, :is_user, :content)
  	  end
end

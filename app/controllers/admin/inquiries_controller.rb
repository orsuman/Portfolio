class Admin::InquiriesController < ApplicationController

	def index
	  @inquiries = Inquiry.all.order(created_at: :desc).page(params[:page])
	  @inquiry_all = Inquiry.all
	end
	def show
	  @inquiry = Inquiry.find(params[:id])
	end
	def destroy
      inquiry = Inquiry.find(params[:id])
      inquiry.destroy
      redirect_to admin_inquiries_path
	end
end
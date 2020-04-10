class Lawyers::RoomsController < ApplicationController

	def index
	  @rooms = current_lawyer.rooms.order(created_at: :desc).page(params[:page])
	end
end

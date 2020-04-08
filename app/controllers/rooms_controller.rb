class RoomsController < ApplicationController

  before_action :room_show, only: [:show]

  def show
    @room = Room.find(params[:id]) #ルーム情報の取得
    @message = Message.new #新規メッセージ投稿
    @messages = @room.messages #このルームのメッセージを全て取得
    @lawyer = @room.lawyer
    @user = @room.user
  end

  def create
    if user_signed_in?
      #userがログインしてたらuser_idを, lawyerがログインしてたらlawyer_idを@roomにいれる
      @room = Room.new(room_lawyer_params)
      @room.user_id = current_user.id
    elsif lawyer_signed_in?
      @room = Room.new(room_user_params)
      @room.lawyer_id = current_lawyer.id
    else
      redirect_to root_path
    end
    if @room.save
      redirect_to room_path(@room)
    else
      redirect_to root_path
    end
  end

  private
    def room_lawyer_params
      params.require(:room).permit(:lawyer_id)
    end

    def room_user_params
      params.require(:room).permit(:user_id)
    end

    def room_show
      room = Room.find(params[:id])
      if user_signed_in?
        if room.user.id != current_user.id
          redirect_to user_path(current_user)
        end
      elsif lawyer_signed_in?
        if room.lawyer.id != current_lawyer.id
          redirect_to lawyer_path(current_lawyer)
        end
      else
        redirect_to root_path
      end
    end
end

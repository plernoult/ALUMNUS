class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.all
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def new
    @chatroom = Chatroom.new
  end

  def open
    @sender = current_user
    @receiver = User.find(params[:user_id])
    @message = Message.new
    @chatroom = Chatroom.where(sender_id: @sender.id, receiver_id: @receiver.id)
                        .or(Chatroom.where(sender_id: @receiver.id, receiver_id: @sender.id)).first
    if @chatroom.nil?
      @chatroom = Chatroom.create(sender_id: @sender.id, receiver_id: @receiver.id, receiver_name: @receiver.first_name, sender_name: @sender.first_name)
    end
    render 'show'
  end
end

class MessagesController < ApplicationController

  def index
    @message = Message.new
    @messages = Message.all

    respond_to do |format|
      format.html
      format.json { render json: @messages }
    end
  end

  def create
    @message = Message.create(message_params)

    redirect_to messages_path
  end


  private

  def message_params
    params.require(:message).permit(:text)
  end
end

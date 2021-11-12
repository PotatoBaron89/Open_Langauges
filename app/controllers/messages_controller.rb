class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_channel

  def create
    @message = @channel.messages.create(message_params)
    redirect_to channel_path(@message.channel.id)
  end

  private

  def set_channel
    @channel = current_user.channels.find(params[:channel_id])
  end

  def message_params
    params.require(:message).permit(:body).merge(user: current_user)
  end
end

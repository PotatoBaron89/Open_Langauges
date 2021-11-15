class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_channel

  def create
    # @message = @channel.messages.create(message_params)
    # redirect_to channel_path(@message.channel.id)

    @message = @channel.messages.new(message_params)
    respond_to do |format|
      if @message.save!

        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update('message_form', partial: "messages/form", locals: { message: Message.new }),
            turbo_stream.prepend('messages', partial: "messages/message", message: @message )
          ]
        end
        format.html { redirect_to channel_path(@message.channel.id)}
        format.json { render :show, status: :created, location: @message}
      else
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update('message_form', partial: "messages/form", locals: { message: @message })
          ]
        end
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_channel
    @channel = current_user.channels.find(params[:channel_id])
  end

  def message_params
    params.require(:message).permit(:body).merge(user: current_user)
  end
end
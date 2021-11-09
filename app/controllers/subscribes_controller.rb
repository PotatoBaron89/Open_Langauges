class SubscribesController < ApplicationController
  def create
    @subscribe = current_user.subscribes.new(subscribe_params)
    if !@subscribe.save
      flash[:notice] = @subscribe.errors.full_messages.to_sentence
    else
      flash[:notice] = "You subscribed to this course :)"
    end

    redirect_to @subscribe.course
  end

  def destroy
    @subscribe = current_user.subscribes.find(params[:id])
    course = @subscribe.course
    @subscribe.destroy
    redirect_to course
  end

  private

  def subscribe_params
    params.require(:subscribe).permit(:course_id)
  end
end

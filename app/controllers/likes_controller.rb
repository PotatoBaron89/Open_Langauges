class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(like_params)
    if !@like.save
      flash[:notice] = @like.errors.full_messages.to_sentence
    else
      flash[:notice] = "You liked this course :)"
    end

    redirect_to @like.course
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    course = @like.course
    @like.destroy
    redirect_to course
  end

  private

  def like_params
    params.require(:like).permit(:course_id)
  end
end

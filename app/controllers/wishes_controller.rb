class WishesController < ApplicationController
  def create
    @wish = current_user.wishes.new(wish_params)
    if !@wish.save
      flash[:notice] = @wish.errors.full_messages.to_sentence
    else
      flash[:notice] = "Added this course to your wishlist :)"
    end

    redirect_to @like.course
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    course = @wish.course
    @wish.destroy
    redirect_to course
  end

  private

  def eish_params
    params.require(:wish).permit(:course_id)
  end
end

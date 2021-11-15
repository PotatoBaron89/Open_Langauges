class WishesController < ApplicationController
  def create
    @wish = current_user.wishes.new(wish_params)
    if !@wish.save
      flash[:notice] = @wish.errors.full_messages.to_sentence
    else
      flash[:notice] = "Added this course to your wishlist :)"
    end

    redirect_to @wish.course
  end

  def destroy
    @wish = Wish.find(params[:id]).destroy
    redirect_to @wish.course
  end

  private

  def wish_params
    params.require(:wish).permit(:course_id)
  end
end

class DefinitionsController < ApplicationController
  def index
    @definitions = Definition.all.page(params[:page])
  end

  def show
    @definition = Definition.find(params[:id])
  end

  def create
    @definition = Definition.new(definition_params)

    if @definition.save
      redirect_to @definition, notice: "Definition was successfully created."

    else
      flash[:alert] = "Something went wrong"
    end

  end

  def destroy
    @definition.destroy
    respond_to do |format|
      format.html { redirect_to words_url, notice: "Definition was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def edit
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_definition
    @definition = Definition.find(params[:id])
  end

  def definition_params
    params.require(:definition).permit(:word_id, :text, :title)
  end

end

class ChannelsController < ApplicationController
  before_action :set_channel, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index]
  before_action :set_user, only: [:show]

  # THIS FEATURE IS STILL IN DEVELOPMENT AND IS MISSING SOME FEATURES
  #
  #
  # GET /channels or /channels.json
  def index
    # Temporary reroute until proper index page is made
    redirect_to channel_path(Channel.first)
  end

  # GET /channels/1 or /channels/1.json
  def show
    @channels = Channel.includes(users: [image_attachment: :blob],
                                             messages: [:user, :rich_text_body]).all
  end

  # GET /channels/new
  def new
    @channel = Channel.new
  end

  # GET /channels/1/edit
  def edit
  end

  # POST /channels or /channels.json
  def create

    @channel = Channel.new(channel_params)

    respond_to do |format|
      if @channel.save
        format.html { redirect_to @channel, notice: "Channel was successfully created." }
        format.json { render :show, status: :created, location: @channel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /channels/1 or /channels/1.json
  def update
    respond_to do |format|
      if @channel.update(channel_params)
        format.html { redirect_to @channel, notice: "Channel was successfully updated." }
        format.json { render :show, status: :ok, location: @channel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /channels/1 or /channels/1.json
  def destroy
    @channel.destroy
    respond_to do |format|
      format.html { redirect_to channels_url, notice: "Channel was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_channel
      @channel = Channel.find(params[:id])
      @pagy, @messages = pagy(@channel.messages.includes(:user, :rich_text_body).order(created_at: :desc))
    end

    # Only allow a list of trusted parameters through.
    def channel_params
      params.require(:channel).permit(:name)
    end

  def set_user
    @current_user = User.find(current_user.id)
  end
end

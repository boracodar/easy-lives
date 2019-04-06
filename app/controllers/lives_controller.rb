class LivesController < ApplicationController
  before_action :set_live, only: [:show, :edit, :update, :destroy]

  # GET /lives
  def index
    @lives = Live.all
  end

  # GET /lives/1
  def show
  end

  # GET /lives/new
  def new
    @live = Live.new
  end

  # GET /lives/1/edit
  def edit
  end

  # POST /lives
  def create
    @live = Live.new(live_params)

    if @live.save
      redirect_to @live, notice: 'Live was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /lives/1
  def update
    if @live.update(live_params)
      redirect_to @live, notice: 'Live was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /lives/1
  def destroy
    @live.destroy
    redirect_to lives_url, notice: 'Live was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_live
      @live = Live.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def live_params
      params.require(:live).permit(:subject, :description, :author_id)
    end
end

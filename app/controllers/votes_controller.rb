class VotesController < ApplicationController
  before_action :set_live, only: %i[create]

  def create
    Vote.create! live: @live, user: current_user

    redirect_to lives_path, notice: 'Seu voto foi contabilizado!'
  end

  private

  def set_live
    @live = Live.find(params[:live_id])
  end
end

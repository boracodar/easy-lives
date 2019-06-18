# frozen_string_literal: true

class LivesController < ApplicationController
  before_action :set_live, only: %i[edit update destroy]
  before_action :check_live_ownership, only: %i[edit destroy]

  def index
    lives = Live.order(votes_count: :desc, created_at: :desc)

    @suggested_lives = lives.non_recorded
    @recoreded_lives = lives.recorded.reorder(:episode).decorate

    @voted_lives = current_user.voted_lives
  end

  def new
    @live = Live.new
  end

  def edit; end

  def create
    @live = Live.new(live_params.merge(author: current_user))

    if @live.save
      redirect_to lives_path, notice: 'Sugestão de Live foi criada com sucesso.'
    else
      flash.now[:alert] = @live.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    if @live.update(live_params)
      redirect_to lives_path, notice: 'Sugestão de Live foi atualizada com sucesso.'
    else
      flash.now[:alert] = @live.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    unless @live.can_be_deleted?
      redirect_to lives_path, alert: 'Você só pode remover sugestões com zero votos'
      return
    end

    if @live.destroy
      redirect_to lives_path, notice: 'Sugestão de Live foi removida com sucesso.'
    else
      flash.now[:alert] = @live.errors.full_messages.to_sentence
      render :index
    end
  end

  private

  def set_live
    @live = Live.find(params[:id])
  end

  def live_params
    params.require(:live).permit(:subject, :description)
  end

  def check_live_ownership
    redirect_to lives_path, alert: 'Você não tem permissão para editar/remover essa live' if @live.author != current_user
  end
end

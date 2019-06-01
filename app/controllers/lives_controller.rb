class LivesController < ApplicationController
  before_action :set_live, only: %i[edit update destroy]

  def index
    @lives = Live.order(votes_count: :desc, created_at: :desc)
    @voted_lives = current_user.voted_lives
  end

  def new
    @live = Live.new
  end

  def edit
    if @live.author != current_user
      redirect_to lives_path, alert: 'Você não tem permissão para editar essa live'
    end
  end

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

  private

  def set_live
    @live = Live.find(params[:id])
  end

  def live_params
    params.require(:live).permit(:subject, :description)
  end
end

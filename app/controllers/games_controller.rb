class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  def index
    @games = Game.all
  end

  def show
  end

  def new
    @game = Game.new()
  end

  def edit
  end

  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html {redirect_to @game, notice: 'Payment was successfully created.'}
        format.json {render :show, status: :created, location: @game}
      else
        format.html {render :new}
        format.json {render json: @game.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html {redirect_to @game, notice: 'Payment was successfully updated.'}
        format.json {render :show, status: :ok, location: @game}
      else
        format.html {render :edit}
        format.json {render json: @game.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html {redirect_to games_url, notice: 'Payment was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:from_user_id, :to_user_id, :winner, :loser, :status)
  end
end

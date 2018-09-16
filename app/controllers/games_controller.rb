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
    @game.from_user_id = current_user.id
    player_1 = RatedPlayer.new("#{@game.from_user.alias}",@game.from_user.rating)
    player_2 = RatedPlayer.new("#{@game.to_user.alias}",@game.from_user.rating)
    Match.new(player_1,player_2,1)
    if player_1.rating > player_2.rating
      @game.winner = @game.from_user.alias
      @game.loser = @game.to_user.alias
    else
      @game.winner = @game.to_user.alias
      @game.loser = @game.from_user.alias
    end
    respond_to do |format|
      if @game.save
        rating_from = Rating.new(user_id: current_user.id, game_id: @game.id, value: player_1.rating, description: "Game with #{@game.to_user.alias}")
        rating_to = Rating.new(user_id: @game.to_user_id, game_id: @game.id, value: player_2.rating, description: "Game with #{@game.from_user.alias}")

        if rating_from.save
          current_user.rating = rating_from.value
          current_user.save
        end


        if rating_to.save
          current_user_to = User.find(@game.to_user_id)
          current_user_to.rating = rating_to.value
          current_user_to.save
        end

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

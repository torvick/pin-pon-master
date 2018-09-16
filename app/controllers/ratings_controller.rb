class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]

  def index
    @ratings = Rating.all
  end

  def show
  end

  def new
    @rating = Rating.new()
  end

  def edit
  end

  def create
    @rating = rating.new(rating_params)
    respond_to do |format|
      if @rating.save
        format.html {redirect_to @rating, notice: 'Payment was successfully created.'}
        format.json {render :show, status: :created, location: @rating}
      else
        format.html {render :new}
        format.json {render json: @rating.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    respond_to do |format|
      if @rating.update(rating_params)
        format.html {redirect_to @rating, notice: 'Payment was successfully updated.'}
        format.json {render :show, status: :ok, location: @rating}
      else
        format.html {render :edit}
        format.json {render json: @rating.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @rating.destroy
    respond_to do |format|
      format.html {redirect_to ratings_url, notice: 'Payment was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  def set_rating
    @rating = Rating.find(params[:id])
  end

  def rating_params
    params.require(:rating).permit(:user_id, :value, :description, :status)
  end
end
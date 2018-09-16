class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @users = User.all
  end
end

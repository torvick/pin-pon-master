module GamesHelper
  def games_total(user)
    Game.where("to_user_id = ? or from_user_id = ?", user.id, user.id).count
  end
end

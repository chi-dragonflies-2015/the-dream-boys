class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def search_users(string)
    User.where('UPPER(username) LIKE ? OR UPPER(first_name) LIKE ? OR UPPER(last_name) LIKE ?', "%#{string.upcase}%", "%#{string.upcase}%", "%#{string.upcase}%")
  end

  def search_games(string)
    title_matches = Game.where('UPPER(title) LIKE ?', "%#{string.upcase}%")
    tag_matches = []
    Game.all.each do |game|
      game.tags.each do |tag|
        if tag.description.upcase =~ Regexp.new(string.upcase)
          tag_matches << game
        end
      end
    end
    title_matches.concat(tag_matches.uniq)
  end
  helper_method :current_user
  helper_method :search_users
  helper_method :search_games
end

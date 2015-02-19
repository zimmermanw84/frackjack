helpers do
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  # Added from stu's talk

  def session_logged_in?
    !session[:user_id].blank?
  end

  def session_current_user_id
    User.find(session[:current_user_id]).id
  end

  def session_set_current_user(user)
    session[:current_user_id] = user.id

  end

  def session_current_user
    User.find(session[:current_user_id]) unless session[:current_user_id].blank?
  end

  def session_logout_and_redirect
    # session.delete :current_user_id
    session.delete :user_id
    redirect '/'
  end

  def session_authenticate!
    return if session_logged_in?
    redirect '/'
    halt 400, "Go away stranger!!"
  end

  def set_session_game_tracker(game)
    session[:game_id] = game.id
    # session[:player_hand] = game.player_hand
    # session[:dealer_hand] = game.dealer_hand
    # session[:score] = game.score
  end

  def update_game_session_tracker(game)
    game.player_hand = session[:player_hand]
    game.dealer_hand = session[:dealer_hand]
    game.score = session[:score]
  end

  def clear_session_game
    session.delete :game_id
    session.delete :player_hand
    session.delete :dealer_hand
    session.delete :score
  end

  def usable_cards
    used_cards = session[:player_hand] + session[:dealer_hand]

    Card.all - used_cards
  end

end
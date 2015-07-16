class VotesController < ApplicationController


  def create_vote_for_game
    if session[:user_id]
      this_user = User.find_by(id: session[:user_id])
      this_game = Game.find_by(id: params[:game_id])
      if Vote.allowed_to_vote(this_user, this_game)
        this_vote = Vote.new(value: params[:vote_value], voter_id: this_user.id)
        respond_to do |format|
          if this_vote.save
            this_game.votes << this_vote
            format.json { render json: {votes: Vote.total(this_game)}}
            # content_type :json
            # {votes: Vote.total(this_game)}.to_json
          else
            format.html{ redirect_to '/' }
          end
        end
      else
        head 200
      end
    else
      head 200
    end
  end

  def create_vote_for_comment
    if session[:user_id]
      puts "HEYYYYYYYYYYYYYYYYYYy"
      this_user = User.find_by(id: session[:user_id])
      this_comment = Comment.find_by(id: params[:comment_id])
      if Vote.allowed_to_vote(this_user, this_comment)
        this_vote = Vote.new(value: params[:vote_value], voter_id: this_user.id)
        respond_to do |format|
          if this_vote.save
            this_comment.votes << this_vote
            format.json { render json: {votes: Vote.total(this_comment)}}
            # content_type :json
            # {votes: Vote.total(this_comment)}.to_json
          else
            format.html{redirect_to '/'}
          end
        end
      else
        head 200
      end
    else
      head 200
    end
  end
end

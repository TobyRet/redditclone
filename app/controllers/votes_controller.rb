class VotesController < ApplicationController

  def create
    @post = Post.find params[:post_id]
    @post.votes.create direction: params[:direction]
    render json: { vote_count: @post.votes_count }
  end
end

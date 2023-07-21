class Api::V1::FollowsController < ApplicationController
  def index
    follows = Follow.all
    render json: follows
  end

  def create
    follower = Follow.new(follow_params)
    if follower.save
      render json: follower
    else
      render json: follower.errors , status: :unprocessable_entity
    end
  end

  private

  def follow_params
    params.require(:follow).permit(:follower_id , :following_id)
  end
end

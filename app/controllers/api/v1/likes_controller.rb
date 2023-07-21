class Api::V1::LikesController < ApplicationController

  def index
    likes = Like.all
    render json: likes
  end

  def create
    like = Like.new(like_params)
    if like.save
      render json: like , status: :created
    else
      render json: like.errors, status: :unprocessable_entity
    end
  end

  private

  def like_params
    params.require(:like).permit(:user_id , :post_id)
  end
end


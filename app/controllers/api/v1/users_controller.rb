module Api
  module V1
    class UsersController < ApplicationController
      def index
        users = User.all
        render json: users
      end

      def create
        user = User.new(user_params)
        if user.save
          render json: user, status: :created
        else
          render json: user.errors, status: :unprocessable_entity
        end
      end

      def show
        user = User.find(params[:id])
        render json: user
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'User not found' }, status: :not_found
      end

      def update
        post = User.find(params[:id])
        if post.update(user_params)
          render json: post
        else
          render json: post.errors, status: :unprocessable_entity
        end
      end

      def destroy
        post = User.find(params[:id])
        post.destroy!
        render json: post
        rescue ActiveRecord::RecordNotFound
          render json: { error: 'User not found' }, status: :not_found
      end

      def posts
        user = User.find(params[:id])
        posts = user.posts
        render json: posts
      end

      def notifications
        notifications = User.find(params[:id]).notifications
        render json: notifications
      end

      def followers
        followers = User.find(params[:id]).followers
        render json: followers
      end

      def following
        following = User.find(params[:id]).following
        render json: following
      end

      private

      def user_params
        params.require(:user).permit(:username, :email, :password_digest)
      end

    end
  end
end

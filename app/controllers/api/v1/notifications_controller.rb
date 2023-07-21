class Api::V1::NotificationsController < ApplicationController

  def index
    notifications = Notification.all
    render json: notifications
  end

end

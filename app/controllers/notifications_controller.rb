# frozen_string_literal: true

class NotificationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @notifications = Notification.where(receipient: current_user).unread
  end

  def mark_as_read
    @notifications = Notification.where(receipient: current_user).unread
    @notifications.update_all(read_at: Time.zone.now)
    render json: {success: true}
  end
end

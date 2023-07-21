class NotificationService
  def self.send_notification(user, message)
    Notification.create(user_id: user.id , message: message, seen: false)
    print "Creating Notification"
  end
end

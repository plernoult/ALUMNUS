class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  after_action :update_last_seen_at, if: -> { user_signed_in? && (current_user.last_seen_at.nil? || current_user.last_seen_at < 5.minutes.ago) }
  before_action :set_layout_variables, if: -> { user_signed_in? }

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def update_last_seen_at
    logger.info "Update last seen at timestamp for user id #{current_user.id}"
    current_user.update_attribute(:last_seen_at, Time.current)
  end

  def set_layout_variables
    count = 0
    Chatroom.all.each do |chatroom|
      count += chatroom.messages.select { |message| message.receiver_viewed != true && message.user_id != current_user.id }.count
    end
    @unread_messages = count
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :first_name, :last_name, :current_city, :batch_number, :batch_date, :occupation, :company_name, :photo, :bio, :last_seen_at)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :first_name, :last_name, :current_city, :batch_number, :batch_date, :occupation, :company_name, :photo, :bio, :last_seen_at)}
  end
end

class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  before_action :authenticate_user!

  private

  def user_not_authorized
    flash[:alert] = "Only admins can delete Wikis."
    redirect_to root_path
  end

end

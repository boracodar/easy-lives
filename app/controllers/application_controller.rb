class ApplicationController < ActionController::Base
  layout :layout_by_resource

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  private

  def layout_by_resource
    devise_controller? ? 'devise' : 'application'
  end
end

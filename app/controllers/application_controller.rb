# Application controller
class ApplicationController < ActionController::Base
  before_filter :set_current_locale

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def default_url_options(options = {})
    { locale: I18n.locale }.merge(options)
  end

  private

  def set_current_locale
    current_locale = params[:locale] ? params[:locale] : 'en'
    I18n.locale = current_locale
  end
end

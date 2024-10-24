class ApplicationController < ActionController::Base
  include Pundit::Authorization

  around_action :switch_locale

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def default_url_options
    { locale: I18n.locale }
  end


  def after_sign_in_path_for(resource)
    stored_location_for(resource) || root_path(locale: I18n.locale)
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path(locale: I18n.locale)
  end

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  before_filter :set_gettext_locale
  before_action :set_locale

  def set_locale
    I18n.locale = extract_locale_from_tld || extract_locale_from_subdomain || I18n.default_locale
  end

  def extract_locale_from_tld
    parsed_locale = request.host.split('').last
    if parsed_locale
      I18n.available_locales.include?(parsed_locale.to_sym) ? parsed_locale : nil
    else
      nil
    end
  end

  def extract_locale_from_subdomain
    parsed_locale = request.subdomains.first
    if parsed_locale 
      I18n.available_locales.include?(parsed_locale.to_sym) ? parsed_locale : nil
    else
      nil
      
    end
  end
end

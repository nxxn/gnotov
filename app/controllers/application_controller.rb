class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale
  layout :layout_by_resource

  def default_url_options(options={})
    if I18n.locale != I18n.default_locale
      { :locale => I18n.locale }
    else
      { :locale => I18n.default_locale }
    end
  end

  protected

  def layout_by_resource
    if devise_controller?
      "administration"
    else
      "application"
    end
  end

  def set_locale
    # if params[:locale] is nil then I18n.default_locale will be used
    I18n.locale = params[:locale] ||= I18n.default_locale
  end
end

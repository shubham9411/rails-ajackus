# frozen_string_literal: true

class ApplicationController < ActionController::Base
  around_action :switch_locale

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def render404
    respond_to do |format|
      format.html { render file: Rails.root.join('public', '404.html'), status: :not_found }
    end
  end
end

# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ApplicationHelper
  
  def redirect_back_or_to(default)
    redirect_to (session[:url] || default)
    session.delete(:url)
  end

  def store_url
    session[:url] = request.original_url
  end
end

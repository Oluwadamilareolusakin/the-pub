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

  def suggestions
    @suggestions = User.all.shuffle[0..4]
  end
end

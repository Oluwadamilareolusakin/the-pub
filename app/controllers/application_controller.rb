# frozen_string_literal: true

class ApplicationController < ActionController::Base
<<<<<<< HEAD

=======
  def redirect_back_or_to(default)
    redirect_to (session[:url] || default)
    session.delete(:url)
  end

  def store_url
    session[:url] = request.get? ? request.original_url : nil
  end
>>>>>>> comments-and-likes
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :select_layout

  def select_layout
    devise_controller? ? 'authorization' : 'application'
  end
end

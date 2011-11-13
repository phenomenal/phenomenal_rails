class ApplicationController < ActionController::Base
  protect_from_forgery
  include ApplicationHelper
  
  def home
    render "pages/home"
  end
end

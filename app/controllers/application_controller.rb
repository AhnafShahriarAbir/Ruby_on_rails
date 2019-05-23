class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  protect_from_forgery with: :exception
  include SessionsHelper

  def index
  	@courses = Course.all
  end

  private 

  def record_not_found
    render :text => "404 Not Found", :status => 404
  end 
  
end

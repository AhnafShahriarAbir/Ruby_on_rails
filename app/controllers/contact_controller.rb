class ContactController < ApplicationController
  def index 
  end

  def new
   
  end

  def edit
  end
  
  def create     
    email = params[:contact][:email]

    @debug = email 
    UserMailer.send_mail(email).deliver_now
    
    flash[:info] = "Thanks for your feedback!!"
    redirect_to root_url
    
  end

end

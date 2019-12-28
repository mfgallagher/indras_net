class ApplicationController < ActionController::Base

  
  def home
    if user_signed_in?
      @question = current_user.questions.build
      @communities = Community.all
    end
  end
  
end

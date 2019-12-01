class StaticPagesController < ApplicationController
  
  def home
    @question = current_user.questions.build if user_signed_in?
  end

  def help
  end
  
  def mission
  end 
end

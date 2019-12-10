class StaticPagesController < ApplicationController
  
  def home
    if user_signed_in?
      @question = current_user.questions.build
      @answer = @question.answers.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def mission
  end 
end

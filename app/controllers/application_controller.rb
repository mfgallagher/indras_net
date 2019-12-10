class ApplicationController < ActionController::Base

  
  def home
    if user_signed_in?
      @question = current_user.questions.build
      @answer = @question.answers.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end
  
end

class UsersController < ApplicationController
  before_action :authenticate_user!
  
   def show
      @user = User.find(params[:id])
      @questions = @user.questions.paginate(page: params[:page])
      @question = current_user.questions.build
      @answer = @question.answers.build
      @feed_items = current_user.feed.paginate(page: params[:page])
   end


end

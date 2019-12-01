class UsersController < ApplicationController
  before_action :authenticate_user!
  
   def show
      @user = User.find(params[:id])
      @questions = @user.questions.paginate(page: params[:page])
   end


end

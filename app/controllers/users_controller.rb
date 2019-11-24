class UsersController < ApplicationController
  
  
   def show
      @user = User.find(params[:id])
      @questions = @user.questions.paginate(page: params[:page])
   end


end

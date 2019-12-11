class AnswersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy, :show]
  before_action :correct_user, only: :destroy
  
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    @answer.user= current_user
    if @answer.save
      flash[:success] = "Thanks for offering your input!"
      redirect_to root_url
    else
      flash[:error] = "invalid answer"
      redirect_to root_url
    end
  end

  def destroy
  end 


private
  
    def answer_params
      params.require(:answer).permit(:content)
    end
    
    def correct_user
      @answer = current_user.answers.find_by(id: params[:id])
      redirect_to root_url if @answer.nil?
    end
    
end

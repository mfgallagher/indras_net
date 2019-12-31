class AnswersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy, :index, :show]
  before_action :correct_user, only: :destroy

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    @answer.community = @question.community
    @answer.user= current_user
    if @answer.save
      flash[:success] = "Thanks for offering your input!"
      redirect_to community_question_path(@answer.community, @question)
    else
      flash[:error] = "invalid answer"
      redirect_to root_url
    end
  end

  def destroy
    @answer.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end

  def show
    @question = Question.find(params[:question_id])
    @answers = @question.answers
  end

  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers
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

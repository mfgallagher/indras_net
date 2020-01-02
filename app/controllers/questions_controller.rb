class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy, :show]
  before_action :correct_user, only: :destroy


  def create
    @user = current_user
    @community = Community.find(params[:community_id])
    @question = Question.new(question_params)
    @question.user = @user
    @question.community = @community
  #  if @user.communities.exists?
  #    @question.community = @user.communities.find(1)
  #  else
  #    @question.community = Community.find(1)
  #  end
    if @question.save
      flash[:success] = "Question created! Check back for answers."
      redirect_to root_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render root_path
    end
  end

  def destroy
    @question.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end

  def show
    @question = Question.find(params[:id])
  end

  def index
    @questions = Questions.all
  end


  private

    def question_params
      params.require(:question).permit(:content)
    end

    def correct_user
      @question = current_user.questions.find_by(id: params[:id])
      redirect_to root_url if @question.nil?
    end

end

class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :correct_user, only: :destroy
  
  
  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      flash[:success] = "Question created! Check back for answers."
      redirect_to root_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'static_pages/home'
    end
  end 
  
  def destroy
    @question.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end 
  
  def view
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

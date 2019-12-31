class CommunitiesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :show, :index]

  def create
    @communities = Community.all
    @community = Community.new(community_params)
    if @community.save
      flash[:success] = "Community made!"
      redirect_to @community
    else
      flash[:error] = "invalid Community name"
      redirect_to root_url
    end
  end

  def show
    @communities = Community.all
    @community = Community.find(params[:id])
    @users = @community.users
    @questions = @community.questions
    @question = Question.new
  end

  def index
    @communities = Community.all
    @community = Community.new
  end


  private

    def community_params
      params.require(:community).permit(:name)
    end
end

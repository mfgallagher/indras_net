class CommunitiesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :show, :index]
  
  def create 
    @community = current_user.community.build(community_params)
    if @community.save
      flash[:success] = "Community made!"
      redirect_to root_url
    else
      flash[:error] = "invalid Community name"
      redirect_to root_url
    end
  end
  
  def show
    @community = Community.find(params[:name])
    @users = @community.users
    @questions = @community.questions
  end 
  
  def index
    @communities = Community.all
  end
  
  
  private

    def community_params
      params.require(:community).permit(:name)
    end
end

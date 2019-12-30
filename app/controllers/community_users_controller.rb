class CommunityUsersController < ApplicationController
  
  def new
    @community = Community.find(params[:id])
    @user = current_user
    @community_user = CommunityUser.new
    @community_user.user = @user
    @community_user.community = @community
    @community_user.save
  end 



end

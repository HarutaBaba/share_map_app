class AddfriendController < ApplicationController
  def addfri
  end
  
  def search
    @users = User.search(params[:search])
  end
  
end

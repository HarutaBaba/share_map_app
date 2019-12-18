class AddfriendController < ApplicationController
  def addfri
  end
  
  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @users = User.paginate(page: params[:page], per_page: 5).search(params[:search])
  end
  
end

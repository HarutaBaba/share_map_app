class MapsController < ApplicationController
  def index
    @userplan = Userplan.new
    # ログイン時にマーカーを表示する
    if logged_in?
      #フォローしている人をすべて取り出す
      @followuser = current_user.all_following
      if params[:commit] == "友達の予定を表示する"
        @userplan = Userplan.find_by(params[:followid])
        @fplan = Plan.find(@userplan.plan_id)
      end
    end
  end
  
  def create
    @userplan = Userplan.new
    @title = params[:title]
    @time = params[:time]
    @status = params[:status]
    @followuser = current_user.all_following
   # gon.plans = Plan.find(params[:id])
   #gon.plans = Plan.all
   render 'index'
  end
end
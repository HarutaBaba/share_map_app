class MapsController < ApplicationController
  def index
    @userplan = Userplan.new
    # ログイン時にマーカーを表示する
    if logged_in?
      #フォローしている人をすべて取り出す
      @followuser = current_user.all_following
      @fplan = []
      
      @followuser.each do |aaa|
        @userplan = Userplan.find_by(user_id: aaa.id)
        #(byebug)
        if !@userplan.nil?
          @fplan.push(Plan.where(id: @userplan.plan_id))
        end
      end
      @loginuser = Userplan.find(current_user.id)
      @fplan.push(Plan.where(id: @loginuser.plan_id))
      
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
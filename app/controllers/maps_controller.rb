class MapsController < ApplicationController
  def index
    @userplan = Userplan.new
    # ログイン時にマーカーを表示する
    if logged_in?
      #フォローしている人をすべて取り出す
      @followuser = current_user.all_following
      # プラン情報の配列定義
      @fplan = []
      
      @followuser.each do |aaa|
        # 中間テーブル配列定義・初期化
        @userplan = []
        # 配列にフォローしているユーザーの中間テーブル情報を入れる
        @userplan.push(Userplan.where(user_id: aaa.id))
        # もし中間テーブルがnilではなかったら
        if !@userplan.nil?
          # 添え字定義
          @i = 0
          while @i < @userplan.length do
            # 配列にPlan情報を入れる
            @fplan.push(Plan.where(id: @userplan[0][@i][:plan_id]))
            @i += 1
          end
        end
      end
      @loginuser = []
      @loginuser.push(Userplan.where(user_id: current_user.id))
       if !@loginuser[0][0].nil?
          # 添え字定義
          @i = 0
          while @i < @loginuser.length do
            # 配列にPlan情報を入れる
            @fplan.push(Plan.where(id: @loginuser[0][@i][:plan_id]))
            @i += 1
          end
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
class PlansController < ApplicationController
  
  def show
    @plan = Plan.find(params[:id])
  end
  
  def index
    render html: "すでに登録されています"
    @plan = Plan.find(params[:id])
  end
  
  def new
    @plan = Plan.new
    render html: "登録完了"
  end
  
  def create
    @user = current_user
    @plan = @user.plans.new(plan_params)
    if @user.save
      render html: "登録完了"
    else
      render 'new'
    end
  end
  
  private
    def plan_params
      params.require(:plan).permit(:name, :title, :time, :status, :lat, :lng)
    end
  
end

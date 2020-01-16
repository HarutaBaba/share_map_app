class PlansController < ApplicationController
  
  def new
    @plan = Plan.new
    render html: "hello world"
  end
  
  def create
    @plan = Plan.new
  end
  
  def update
  end
end

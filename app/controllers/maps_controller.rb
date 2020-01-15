class MapsController < ApplicationController
  def index
    @title = params[:title]
    @time = params[:time]
    @gender = params[:gender]
  end
end

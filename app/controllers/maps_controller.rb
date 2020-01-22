class MapsController < ApplicationController
  def index
    @title = params[:title]
    @time = params[:time]
    @status = params[:status]
  end
end

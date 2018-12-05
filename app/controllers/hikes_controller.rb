class HikesController < ApplicationController
  def show
    @hike = Hike.find(params[:id])
    render json: @hike
  end
end

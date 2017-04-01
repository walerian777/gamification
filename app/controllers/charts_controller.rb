class ChartsController < ApplicationController
  def points_per_day
    data = Charts::PointsPerDay.new(params[:user_id]).call
    render json: data
  end
end

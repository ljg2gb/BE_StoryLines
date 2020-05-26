class PointsController < ApplicationController
    before_action :authenticate, only: [:create]

    def index
        @points = Point.all
        render json: @points
    end

    def create
        @point = Point.create({
            name: params[:name],
            post: params[:post],
            latlng: params[:latlng],
            story_id: params[:story_id]
        })
        render json: { point: @point }
    end
end
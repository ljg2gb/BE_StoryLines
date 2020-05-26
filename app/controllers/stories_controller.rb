class StoriesController < ApplicationController
    before_action :authenticate, only: [:create, :show]

    def index
        @stories = Story.all
        render json: { stories: @stories }
    end

    def show
        @story = Story.find_by(params[:id])
        render json: { story: @story }
    end

    def create
        @story = Story.create({
            title: params[:title],
            description: params[:description],
            date: params[:date],
            status: params[:status],
            user_id: params[:user_id]
        })
        render json: { story: @story }
    end

end

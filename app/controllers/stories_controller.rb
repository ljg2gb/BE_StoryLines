class StoriesController < ApplicationController
    before_action :authenticate, only: [:create]

    def index
        @stories = Story.all
        render json: @stories, include: [:points]
    end

    def show
        @story = Story.find_by(params[:id])
        render json: @story, include: [:points]
    end

    def create
        @story = Story.create({
            title: params[:title],
            description: params[:description],
            date: params[:date],
            status: params[:status],
            user_id: params[:user_id]
        })
        render json: @story, include: [:points]
    end

end

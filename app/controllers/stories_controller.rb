class StoriesController < ApplicationController
    # GET /stories
    def index
        @stories = Storie.all
    end

    # GET /stories/:id
    def show
        @storie = Storie.find(params[:id])
    end

    # GET /stories/new
    def new
        @storie = Storie.new
    end

    # POST /stories
    def create
        @storie = Storie.new(storie_params)

        if @storie.save
            flash[:notice] = 'Story was successfully created'
            redirect_to @storie
        else
            render action: 'new'
        end
    end

    # GET /stories/search
    def search
        query = "%#{params[:query]}%"
        @stories = Storie.where('title ilike ? or description ilike or url ilike?', query, query, query)
    end

    private
    def storie_params
        params.require(:storie).permit(:title, :image, :description, :body)
    end
  end
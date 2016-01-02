class SportsController < ApplicationController

  before_filter :authenticate, :except => [:index, :show]

  def new
    @sport = Sport.new
  end

  def create
    @sport = Sport.new(sport_params)

    if @sport.save
      redirect_to @sport
    else
      render "new"
    end
  end

  def show
    @sport = Sport.find(params[:id])
  end

  def index
    @sports = Sport.all
  end

  def edit
    @sport = Sport.find(params[:id])
  end

  def update
    @sport = Sport.find(params[:id])

    if @sport.update(sport_params)
      redirect_to @sport
    else
      render "edit"
    end
  end

  def destroy
    @sport = Sport.find(params[:id])

    @sport.destroy
    redirect_to sports_path
  end

  private

  def sport_params
    params.require(:sport).permit(:title, :image_link, :description)
  end
end

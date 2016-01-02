class ClubsController < ApplicationController

  before_filter :authenticate, :except => [:index, :show]

  def index
    @sport = Sport.find(params[:sport_id])
  end

  def show
    @club = Club.find(params[:id])
  end

  def new
    @sport = Sport.find(params[:sport_id])
    @club = Club.new(sport: @sport)
  end

  def create
    @sport = Sport.find(params[:sport_id])
    @club = @sport.clubs.new(club_params)
    if @club.save
      redirect_to sport_club_path(@club.sport_id, @club)
    else
      render 'new'
    end
  end

  def edit
    @club = Club.find(params[:id])
    @sport = @club.sport
  end

  def update
    @club = Club.find(params[:id])

    if @club.update(club_params)
      redirect_to sport_club_path(@club.sport_id, @club)
    else
      render 'edit'
    end

  end

  private

  def club_params
    params.require(:club).permit(:name, :image_link, :country, :established, :description)
  end

end

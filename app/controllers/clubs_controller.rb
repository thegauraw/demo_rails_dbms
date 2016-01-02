class ClubsController < ApplicationController

  before_filter :authenticate, :except => [:index, :show]

  def index
    binding.pry
    @sport = Sport.find(params[:id])
  end

  def show
    binding.pry
    @club = Club.find(params[:id])
  end

  def new
    binding.pry
    @sport = Sport.find(params[:sport_id])
    @club = @sport.clubs.new
  end

  def create
    binding.pry
    # @sport = Sport.find(params[:sport_id])
    # @club = @sport.clubs.create(club_params)
    # redirect_to sport_path(@sport)
    @club = Club.new(club_params)

    if @club.save
      redirect_to @club
    else
      render 'new'
    end
  end

  def edit
    binding.pry
    @club = Club.find(params[:id])
  end

  def update
    binding.pry
    @club = Club.find(params[:id])

    if @club.update(club_params)
      redirect_to @club
    else
      render 'edit'
    end

  end

  private

  def club_params
    params.require(:club).permit(:name, :image_link, :country, :established, :description)
  end

end

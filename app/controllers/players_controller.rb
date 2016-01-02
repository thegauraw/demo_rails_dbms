class PlayersController < ApplicationController
  before_filter :authenticate, :except => [:index, :show, :search]

  def index
    @club = Club.find(params[:club_id])
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @sport = Sport.find(params[:sport_id])
    @club = Club.find(params[:club_id])
    @player = Player.new(club: @club)
  end

  def create
    @sport = Sport.find(params[:sport_id])
    @club = Club.find(params[:club_id])
    @player = @club.players.new(player_params)
    if @player.save
      redirect_to sport_club_player_path(@sport.id, @club.id, @player)
    else
      render 'new'
    end
  end

  def edit
    @player = Player.find(params[:id])
    @club = @player.club
    @sport = @club.sport
  end

  def update
    @player = Player.find(params[:id])
    @club = @player.club
    @sport = @club.sport
    if @player.update(player_params)
      redirect_to sport_club_player_path(@sport.id, @club.id, @player)
    else
      render 'edit'
    end
  end

  def search
    @query = params[:query]
    @results = Player.where("name LIKE :query", query: "%#{@query}%")
  end

  private

  def player_params
    params.require(:player).permit(:name, :image_link, :country, :position, :description)
  end

end

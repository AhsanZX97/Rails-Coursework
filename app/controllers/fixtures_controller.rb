class FixturesController < ApplicationController
  before_action :set_fixture, only: [:show, :edit, :update, :destroy]
  before_action :set_league, only: [:new, :create]
  before_action :authenticate_user!

  # GET /fixtures/new
  def new
    @fixture = @league.fixture.new
  end

  # POST /fixtures
  # POST /fixtures.json
  def create
    @fixture = @league.fixture.new(fixture_params)

    respond_to do |format|
      if @fixture.home == @fixture.away
        format.html {redirect_to new_fixture_path(league_id: @league)}
        flash[:notice] = "Home team and away team cannot be the same"
        
      elsif @fixture.save
        format.html { redirect_to @league, notice: 'Fixture was successfully created.' }
        format.json { render :show, status: :created, location: @fixture }

        if @fixture.homegoals > @fixture.awaygoals
          @fixture.home.update_attribute(:MP, @fixture.home.MP + 1)
          @fixture.home.update_attribute(:W, @fixture.home.W + 1)
          @fixture.home.update_attribute(:Pts, @fixture.home.Pts + 3)

          @fixture.away.update_attribute(:MP, @fixture.away.MP + 1)
          @fixture.away.update_attribute(:L, @fixture.away.L + 1)

        elsif @fixture.homegoals < @fixture.awaygoals
          @fixture.away.update_attribute(:MP, @fixture.away.MP + 1)
          @fixture.away.update_attribute(:W, @fixture.away.W + 1)
          @fixture.away.update_attribute(:Pts, @fixture.away.Pts + 3)

          @fixture.home.update_attribute(:MP, @fixture.home.MP + 1)
          @fixture.home.update_attribute(:L, @fixture.home.L + 1)
        else
          @fixture.away.update_attribute(:MP, @fixture.away.MP + 1)
          @fixture.away.update_attribute(:D, @fixture.away.D + 1)
          @fixture.away.update_attribute(:Pts, @fixture.away.Pts + 1)

          @fixture.home.update_attribute(:MP, @fixture.home.MP + 1)
          @fixture.home.update_attribute(:D, @fixture.home.D + 1)
          @fixture.home.update_attribute(:Pts, @fixture.home.Pts + 1)
        end

      else
        format.html {redirect_to new_fixture_path(league_id: @league)}
        flash[:notice] = @fixture.errors.full_messages.to_sentence
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fixture
      @fixture = Fixture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fixture_params
      params.require(:fixture).permit(:league_id, :home_id, :away_id, :homegoals, :awaygoals)
    end

    def set_league
      @league = League.find_by(id: params[:league_id]) ||
      League.find(fixture_params[:league_id])
    end
end

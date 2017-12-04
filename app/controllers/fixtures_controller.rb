class FixturesController < ApplicationController
  before_action :set_fixture, only: [:show, :edit, :update, :destroy]
  before_action :set_league, only: [:new, :create]
  before_action :authenticate_user!


  # GET /fixtures
  # GET /fixtures.json
  def index
    @fixtures = Fixture.all
  end

  # GET /fixtures/1
  # GET /fixtures/1.json
  def show
  end

  # GET /fixtures/new
  def new
    @fixture = @league.fixture.new
  end

  # GET /fixtures/1/edit
  def edit
  end

  # POST /fixtures
  # POST /fixtures.json
  def create
    @fixture = @league.fixture.new(fixture_params)

    respond_to do |format|
      if @fixture.save
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
        format.html { render :new }
        format.json { render json: @fixture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fixtures/1
  # PATCH/PUT /fixtures/1.json
  def update
    respond_to do |format|
      if @fixture.update(fixture_params)
        format.html { redirect_to @fixture, notice: 'Fixture was successfully updated.' }
        format.json { render :show, status: :ok, location: @fixture }

      else
        format.html { render :edit }
        format.json { render json: @fixture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fixtures/1
  # DELETE /fixtures/1.json
  def destroy
    @fixture.destroy
    respond_to do |format|
      format.html { redirect_to fixtures_url, notice: 'Fixture was successfully destroyed.' }
      format.json { head :no_content }
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

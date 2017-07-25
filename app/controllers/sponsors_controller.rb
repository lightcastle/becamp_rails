class SponsorsController < ApplicationController
  before_filter :require_admin_user
  before_action :set_sponsor, only: [:show, :edit, :update, :destroy]

  # GET /sponsors
  def index
    @sponsors = Sponsor.all.order('sequence ASC')
  end

  # GET /sponsors/1
  def show
  end

  # GET /sponsors/new
  def new
    @sponsor = Sponsor.new
  end

  # GET /sponsors/1/edit
  def edit
  end

  # POST /sponsors
  def create
    @sponsor = Sponsor.new(sponsor_params)

    if @sponsor.save
      redirect_to @sponsor, notice: 'Sponsor was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sponsors/1
  def update
    if @sponsor.update(sponsor_params)
      redirect_to @sponsor, notice: 'Sponsor was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sponsors/1
  def destroy
    @sponsor.destroy
    redirect_to sponsors_url, notice: 'Sponsor was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sponsor
      @sponsor = Sponsor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sponsor_params
      params.require(:sponsor).permit(:homepage_url, :logo_url, :width, :sequence)
    end
end

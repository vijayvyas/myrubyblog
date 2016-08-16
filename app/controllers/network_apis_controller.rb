class NetworkApisController < ApplicationController
  before_action :set_network, only: [:show, :update, :destroy]

  # GET /networks
  def index
    @networks = Network.all

    render json: @networks
  end

  # GET /networks/1
  def show
    render json: @network
  end

  # POST /networks
  def create
    @network = Network.new(network_params)

    if @network.save
      render json: @network, status: :created, location: @network
    else
      render json: @network.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /networks/1
  def update
    if @network.update(network_params)
      render json: @network
    else
      render json: @network.errors, status: :unprocessable_entity
    end
  end

  # DELETE /networks/1
  def destroy
    @network.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_network
      @network = Network.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def network_params
      params.require(:network).permit(:name, :title, :content, :pwd, :ssid)
    end
end

class HardwaresController < ApplicationController
  def index
    if current_user
      @hardwares = Hardware.all
    end
  end

  def create 
    @hardware = Hardware.new(hardware_params)
  end

  def new
    @hardware = Hardware.new
  end

  def edit
    @hardware = Hardware.find(params[:id])
  end

  def update
    @hardware = Hardware.find(params[:id])
    @hardware.update
  end

  def delete
    @hardware = Hardware.find(params[:id])
    @hardware.destroy
  end

  def show
    @hardware = Hardware.find(params[:id])
  end

  private
   def hardware_params
    params.require(:hardware).permit(:model_no, :name, :purchase_date, :brand, :description, :token_no)
   end
end

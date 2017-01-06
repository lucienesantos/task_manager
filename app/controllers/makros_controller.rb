class MakrosController < ApplicationController
  
  # GET /makros.json
  def index
    @makros = Makro.all
    render json: @makros
  end

  # GET /makros/1
  def show
    @makro = Makro.find(params[:id])
  end

  # POST /makros.json
  def create
    @makro = Makro.new(makro_params)
    respond_to do |format|
      if @makro.save
        format.json { render json: @makro }
      else
        format.json { render json: @makro.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def makro_params
      params.require(:makro).permit(:name, :description, :active, :deleted, :completed_at, :deleted_at)
    end

end

class KeepsController < ApplicationController
  
  before_action :set_keep, except: [:index, :create, :destroy_many]

  # GET /keeps
  # GET /keeps.json
  def index; end

  # GET /keeps/1
  # GET /keeps/1.json
  def show; end

  # GET /keeps/1/edit
  def edit; end

  # POST /keeps
  # POST /keeps.json
  def create
    @keep = Keep.new(keep_params)

    respond_to do |format|
      if @keep.save
        format.html { redirect_to @keep, notice: 'Keep was successfully created.' }
        format.json { render :show, status: :created, location: @keep }
      else
        format.html { render :index }
        format.json { render json: @keep.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /keeps/1
  # PATCH/PUT /keeps/1.json
  def update
    respond_to do |format|
      if @keep.update(keep_params)
        format.html { redirect_to @keep, notice: 'Keep was successfully updated.' }
        format.json { render :show, status: :ok, location: @keep }
      else
        format.html { render :edit }
        format.json { render json: @keep.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /keeps/1
  # DELETE /keeps/1.json
  def destroy
    @keep.deactive!
    respond_to do |format|
      format.html { redirect_to keeps_url, notice: 'Keep was successfully destroyed.' }
      format.json { render json: @keep }
    end
  end

  # DELETE /keeps/remove_many.json
  def destroy_many
    keeps = Keep.by_ids(params[:ids])
    keeps.map(&:deactive!)

    render json: {message: "Keeps removed successfully"}
  end

  def start
    @keep.start!
    respond_to do |format|
      format.html { redirect_to keeps_url, notice: 'Getting Things Done.' }
      format.json { render json: @keep }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_keep
      @keep = Keep.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def keep_params
      params.require(:keep).permit(:title, :started, :started_at, :completed, :completed_at, :deleted, :deleted_at, :makro_id)
    end
end

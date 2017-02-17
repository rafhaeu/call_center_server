class InternalsController < ApplicationController
  before_action :set_internal, only: [:show, :edit, :update, :destroy]

  # GET /internals
  # GET /internals.json
  def index
    @internals = Internal.all
  end

  # GET /internals/1
  # GET /internals/1.json
  def show
    called_at = Time.now
    if(params[:called_at].present?)
      called_at = Date.parse(params[:called_at])
    end
    dates = called_at.beginning_of_day..called_at.end_of_day
    @internal = Internal.includes(:calls).where(internals: {id: params[:id]}, calls: { called_at: dates }).order("calls.called_at DESC").first
  end

  # GET /internals/new
  def new
    @internal = Internal.new
  end

  # GET /internals/1/edit
  def edit
  end

  # POST /internals
  # POST /internals.json
  def create
    @internal = Internal.new(internal_params)

    respond_to do |format|
      if @internal.save
        format.html { redirect_to @internal, notice: 'Internal was successfully created.' }
        format.json { render :show, status: :created, location: @internal }
      else
        format.html { render :new }
        format.json { render json: @internal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /internals/1
  # PATCH/PUT /internals/1.json
  def update
    respond_to do |format|
      if @internal.update(internal_params)
        format.html { redirect_to @internal, notice: 'Internal was successfully updated.' }
        format.json { render :show, status: :ok, location: @internal }
      else
        format.html { render :edit }
        format.json { render json: @internal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /internals/1
  # DELETE /internals/1.json
  def destroy
    @internal.destroy
    respond_to do |format|
      format.html { redirect_to internals_url, notice: 'Internal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_internal
      @internal = Internal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def internal_params
      params.require(:internal).permit(:id, :name, :sector_id)
    end
end

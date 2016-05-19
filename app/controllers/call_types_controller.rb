class CallTypesController < ApplicationController
  before_action :set_call_type, only: [:show, :edit, :update, :destroy]

  # GET /call_types
  # GET /call_types.json
  def index
    @call_types = CallType.all
  end

  # GET /call_types/1
  # GET /call_types/1.json
  def show
  end

  # GET /call_types/new
  def new
    @call_type = CallType.new
  end

  # GET /call_types/1/edit
  def edit
  end

  # POST /call_types
  # POST /call_types.json
  def create
    @call_type = CallType.new(call_type_params)

    respond_to do |format|
      if @call_type.save
        format.html { redirect_to @call_type, notice: 'Call type was successfully created.' }
        format.json { render :show, status: :created, location: @call_type }
      else
        format.html { render :new }
        format.json { render json: @call_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /call_types/1
  # PATCH/PUT /call_types/1.json
  def update
    respond_to do |format|
      if @call_type.update(call_type_params)
        format.html { redirect_to @call_type, notice: 'Call type was successfully updated.' }
        format.json { render :show, status: :ok, location: @call_type }
      else
        format.html { render :edit }
        format.json { render json: @call_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /call_types/1
  # DELETE /call_types/1.json
  def destroy
    @call_type.destroy
    respond_to do |format|
      format.html { redirect_to call_types_url, notice: 'Call type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_call_type
      @call_type = CallType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def call_type_params
      params.require(:call_type).permit(:id, :name)
    end
end

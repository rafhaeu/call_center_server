class CallsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :create
  before_action :set_call, only: [:show, :edit, :update, :destroy]

  def today
    @calls = Call.includes(:call_type, :internal, :client).ordering_last_ones
    respond_to do |format|
      format.html 
      format.json do 
        render(
          json: @calls,
          include: {
            call_type: {
              only: [:id,:name]
            },
            internal: {
              only: [:id, :name]
            },
            client: {
              only: [:id, :name]
            }
          }
        )
      end
    end
  end

  # GET /calls
  # GET /calls.json
  def index
    if(params[:client].present?)
      @calls = Call.includes(:call_type, :internal, :client).where(client_id: params[:client])
    else
      @calls = Call.includes(:call_type, :internal, :client).all_with_ordering
    end
    respond_to do |format|
      format.html 
      format.json do 
        render(
          json: @calls,
          include: {
            call_type: {
              only: [:id,:name]
            },
            internal: {
              only: [:id, :name]
            },
            client: {
              only: [:id, :name]
            }
          }
        )
      end
    end
  end

  # GET /calls/1
  # GET /calls/1.json
  def show
  end

  # GET /calls/new
  def new
    @call = Call.new
  end

  # GET /calls/1/edit
  def edit
  end

  # POST /calls
  # POST /calls.json
  def create
    @call = Call.new(call_params)
    @call.client = ClientPhone.find_by(phone: @call.phone).try(:client)
    @call.internal = Internal.find(params[:call][:internal_id])
    @call.call_type = CallType.find(params[:call][:call_type_id])

    respond_to do |format|
      if @call.save
        format.html { redirect_to @call, notice: 'Call was successfully created.' }
        format.json { render :show, status: :created, location: @call }
      else
        format.html { render :new }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calls/1
  # PATCH/PUT /calls/1.json
  def update
    @call.client = ClientPhone.find_by(phone: @call.phone).client
    respond_to do |format|
      if @call.update(call_params)
        format.html { redirect_to @call, notice: 'Call was successfully updated.' }
        format.json { render :show, status: :ok, location: @call }
      else
        format.html { render :edit }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calls/1
  # DELETE /calls/1.json
  def destroy
    @call.destroy
    respond_to do |format|
      format.html { redirect_to calls_url, notice: 'Call was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_call
      @call = Call.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def call_params
      params.require(:call).permit(:phone, :called_at, :duration, :internal_id, :call_type_id)
    end
end

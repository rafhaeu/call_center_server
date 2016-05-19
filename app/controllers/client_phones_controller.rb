class ClientPhonesController < ApplicationController
  before_action :set_client_phone, only: [:show, :edit, :update, :destroy]

  # GET /client_phones
  # GET /client_phones.json
  def index
    @client_phones = ClientPhone.all
  end

  # GET /client_phones/1
  # GET /client_phones/1.json
  def show
  end

  # GET /client_phones/new
  def new
    @client_phone = ClientPhone.new
  end

  # GET /client_phones/1/edit
  def edit
  end

  # POST /client_phones
  # POST /client_phones.json
  def create
    @client_phone = ClientPhone.new(client_phone_params)

    respond_to do |format|
      if @client_phone.save
        format.html { redirect_to @client_phone, notice: 'Client phone was successfully created.' }
        format.json { render :show, status: :created, location: @client_phone }
      else
        format.html { render :new }
        format.json { render json: @client_phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /client_phones/1
  # PATCH/PUT /client_phones/1.json
  def update
    respond_to do |format|
      if @client_phone.update(client_phone_params)
        format.html { redirect_to @client_phone, notice: 'Client phone was successfully updated.' }
        format.json { render :show, status: :ok, location: @client_phone }
      else
        format.html { render :edit }
        format.json { render json: @client_phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client_phones/1
  # DELETE /client_phones/1.json
  def destroy
    @client_phone.destroy
    respond_to do |format|
      format.html { redirect_to client_phones_url, notice: 'Client phone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_phone
      @client_phone = ClientPhone.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_phone_params
      params.require(:client_phone).permit(:client_id, :phone)
    end
end

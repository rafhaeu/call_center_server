class CallsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :create
  before_action :set_call, only: [:show, :edit, :update, :destroy]

  def today
    @calls = Call.select("id, phone, internal_id, called_at, call_type_id, internal_id, client_id, duration").includes(:call_type, :client).ordering_last_ones
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

  def report
  end

  def show_report
    from_date = Date.parse(params[:from])
    to_date = Date.parse(params[:to])
    from_hours, from_minutes = params[:from_hours].split(':')
    to_hours, to_minutes = params[:to_hours].split(':')
    call_types = params[:call_types]
    sectors = params[:sectors]
    number_of_top_calls = params[:number_of_top_calls]
    internals = Internal.where(sector: sectors)
    calls = Call.where(called_at: from_date.beginning_of_day..to_date.end_of_day).where(call_type_id: call_types).where("duration > ?", 0).where(internal: internals)
    @call_types = CallType.all.map { |ct| [ct.name, ct.id] }
    @calls = filter_calls_by_time(calls, from_hours, from_minutes, to_hours, to_minutes)
    @top_calls = @calls.sort_by { |call| call.duration }.reverse!.first(number_of_top_calls.to_i)
    @internals = []
    internals.each do |i|
      count = 0
      @calls.each do |c|
        count += 1 if c.internal_id == i.id
      end
      @internals << {internal: i, count: count}
    end
    @internals.sort_by! { |internal| internal[:count] }.reverse!
  end

  def filter_calls_by_time(calls, from_hours, from_minutes, to_hours, to_minutes)
    calls.select do |call|
      temp_from_time = temp_time(call, from_hours, from_minutes)
      temp_to_time = temp_time(call, to_hours, to_minutes)
      call.called_at.time >= temp_from_time && call.called_at.time <= temp_to_time
    end
  end

  # GET /calls
  # GET /calls.json
  def index
    if(params[:client].present?)
      @calls = Call.includes(:call_type, :internal, :client).where(client_id: params[:client]).all_with_ordering
    elsif(params[:internal].present?)
      @calls = Call.includes(:call_type, :internal, :client).where(internal_id: params[:internal]).all_with_ordering
    elsif(params[:called_at].present?)
      date = Date.parse(params[:called_at])
      dates = date.beginning_of_day..date.end_of_day
      @calls = Call.includes(:call_type, :internal, :client).where(called_at: dates).all_with_ordering
    else
      @calls = Call.includes(:call_type, :internal, :client).today.all_with_ordering
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
        format.json { render status: :ok, json: @call }
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

    def temp_time(call, hour, min)
      Time.new(call.called_at.year, call.called_at.month, call.called_at.day, hour.to_i, min.to_i, 0)
    end
end

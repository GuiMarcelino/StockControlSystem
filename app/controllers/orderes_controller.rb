class OrderesController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orderes or /orderes.json
  def index
    @orderes = Order.all
  end

  # GET /orderes/1 or /orderes/1.json
  def show
  end

  # GET /orderes/new
  def new
    @order = Order.new
  end

  # GET /orderes/1/edit
  def edit
  end

  # POST /orderes or /orderes.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orderes/1 or /orderes/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orderes/1 or /orderes/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orderes_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:client_id, :value_total)
    end
end

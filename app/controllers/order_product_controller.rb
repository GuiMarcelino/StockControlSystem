class OrderProductController < ApplicationController
  before_action :set_order_product, only: %i[ show edit update destroy ]
  before_action :set_order
  # GET /order_product or /order_product.json
  def index
    @order_product = OrderProduct.all
  end

  # GET /order_product/1 or /order_product/1.json
  def show
  end

  # GET /order_product/new
  def new
    @order_product = OrderProduct.new
  end

  # GET /order_product/1/edit
  def edit
  end

  # POST /order_product or /order_product.json
  def create
    @order_product = OrderProduct.new(order_product_params)
    @order_product.orderes = @orderes

    respond_to do |format|
      if @order_product.save
        format.html { redirect_to orderes_order_product_path(@orderes), notice: "Order product was successfully created." }
        format.json { render :show, status: :created, location: @order_product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_product/1 or /order_product/1.json
  def update
    respond_to do |format|
      if @order_product.update(order_product_params)
        format.html { redirect_to orderes_order_products_path(@orderes), notice: "Order product was successfully updated." }
        format.json { render :show, status: :ok, location: @order_product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_product/1 or /order_product/1.json
  def destroy
    @order_product.destroy

    respond_to do |format|
      format.html { redirect_to orderes_order_products_path(@orderes), notice: "Order product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:order_id])
    end

    def set_order_product
      @order_product = OrderProduct.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_product_params
      params.require(:order_product).permit(:order_id, :product_id, :value)
    end
end

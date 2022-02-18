class ProductController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /product or /product.json
  def index
    @product = Product.all
  end

  # GET /product/1 or /product/1.json
  def show
  end

  # GET /product/new
  def new
    @product = Product.new
  end

  # GET /product/1/edit
  def edit
  end

  # POST /product or /product.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product/1 or /product/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product/1 or /product/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to product_index_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :description, :amount, :due_date, :value_buy, :value_sale)
    end
end

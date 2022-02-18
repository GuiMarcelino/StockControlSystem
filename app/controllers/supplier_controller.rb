class SupplierController < ApplicationController
  before_action :set_supplier, only: %i[ show edit update destroy ]

  # GET /supplier or /supplier.json
  def index
    @supplieres = Supplier.all
  end

  # GET /supplier/1 or /supplier/1.json
  def show
  end

  # GET /supplier/new
  def new
    @supplier = Supplier.new
  end

  # GET /supplier/1/edit
  def edit
  end

  # POST /supplier or /supplier.json
  def create
    @supplier = Supplier.new(supplier_params)

    respond_to do |format|
      if @supplier.save
        format.html { redirect_to supplier_url(@supplier), notice: "Supplier was successfully created." }
        format.json { render :show, status: :created, location: @supplier }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supplier/1 or /supplier/1.json
  def update
    respond_to do |format|
      if @supplier.update(supplier_params)
        format.html { redirect_to supplier_url(@supplier), notice: "Supplier was successfully updated." }
        format.json { render :show, status: :ok, location: @supplier }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supplier/1 or /supplier/1.json
  def destroy
    @supplier.destroy

    respond_to do |format|
      format.html { redirect_to supplieres_url, notice: "Supplier was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def supplier_params
      params.require(:supplier).permit(:name, :phone, :email, :site)
    end
end

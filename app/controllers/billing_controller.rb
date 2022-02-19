class BillingController < ApplicationController
  before_action :set_billing, only: %i[ show edit update destroy ]

  # GET /billing or /billing.json
  def index
    @billing = Billing.all
  end

  # GET /billing/1 or /billing/1.json
  def show
  end

  # GET /billing/new
  def new
    @billing = Billing.new
  end

  # GET /billing/1/edit
  def edit
  end

  # POST /billing or /billing.json
  def create
    @billing = Billing.new(billing_params)

    respond_to do |format|
      if @billing.save
        format.html { redirect_to billing_url(@billing), notice: "Billing was successfully created." }
        format.json { render :show, status: :created, location: @billing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @billing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /billing/1 or /billing/1.json
  def update
    respond_to do |format|
      if @billing.update(billing_params)
        format.html { redirect_to billing_url(@billing), notice: "Billing was successfully updated." }
        format.json { render :show, status: :ok, location: @billing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @billing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /billing/1 or /billing/1.json
  def destroy
    @billing.destroy

    respond_to do |format|
      format.html { redirect_to billing_index_url, notice: "Billing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_billing
      @billing = Billing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def billing_params
      params.require(:billing).permit(:name, :description, :value)
    end
end

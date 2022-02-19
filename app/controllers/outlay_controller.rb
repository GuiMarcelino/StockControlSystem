class OutlayController < ApplicationController
  before_action :set_outlay, only: %i[ show edit update destroy ]

  # GET /outlay or /outlay.json
  def index
    @outlay = Outlay.all
  end

  # GET /outlay/1 or /outlay/1.json
  def show
  end

  # GET /outlay/new
  def new
    @outlay = Outlay.new
  end

  # GET /outlay/1/edit
  def edit
  end

  # POST /outlay or /outlay.json
  def create
    @outlay = Outlay.new(outlay_params)

    respond_to do |format|
      if @outlay.save
        format.html { redirect_to outlay_url(@outlay), notice: "Outlay was successfully created." }
        format.json { render :show, status: :created, location: @outlay }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @outlay.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /outlay/1 or /outlay/1.json
  def update
    respond_to do |format|
      if @outlay.update(outlay_params)
        format.html { redirect_to outlay_url(@outlay), notice: "Outlay was successfully updated." }
        format.json { render :show, status: :ok, location: @outlay }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @outlay.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outlay/1 or /outlay/1.json
  def destroy
    @outlay.destroy

    respond_to do |format|
      format.html { redirect_to outlay_index_url, notice: "Outlay was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outlay
      @outlay = Outlay.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def outlay_params
      params.require(:outlay).permit(:name, :description, :value)
    end
end

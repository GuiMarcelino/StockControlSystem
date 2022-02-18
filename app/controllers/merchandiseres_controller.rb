class MerchandiseresController < ApplicationController
  before_action :set_merchandiser, only: %i[ show edit update destroy ]

  # GET /merchandiseres or /merchandiseres.json
  def index
    @merchandiseres = Merchandiser.all
  end

  # GET /merchandiseres/1 or /merchandiseres/1.json
  def show
  end

  # GET /merchandiseres/new
  def new
    @merchandiser = Merchandiser.new
  end

  # GET /merchandiseres/1/edit
  def edit
  end

  # POST /merchandiseres or /merchandiseres.json
  def create
    @merchandiser = Merchandiser.new(merchandiser_params)

    respond_to do |format|
      if @merchandiser.save
        format.html { redirect_to merchandiser_url(@merchandiser), notice: "Fornecedor cadastrado com sucesso." }
        format.json { render :show, status: :created, location: @merchandiser }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @merchandiser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /merchandiseres/1 or /merchandiseres/1.json
  def update
    respond_to do |format|
      if @merchandiser.update(merchandiser_params)
        format.html { redirect_to merchandiser_url(@merchandiser), notice: "Fornecedor atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @merchandiser }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @merchandiser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /merchandiseres/1 or /merchandiseres/1.json
  def destroy
    @merchandiser.destroy

    respond_to do |format|
      format.html { redirect_to merchandiseres_url, notice: "Fornecedor removido com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_merchandiser
      @merchandiser = Merchandiser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def merchandiser_params
      params.require(:merchandiser).permit(:name, :phone, :email, :site)
    end
end

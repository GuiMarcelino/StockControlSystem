class ClientController < ApplicationController
  before_action :set_client, only: %i[ show edit update destroy ]

  # GET /client or /client.json
  def index
    @client = Client.all
  end

  # GET /client/1 or /client/1.json
  def show
  end

  # GET /client/new
  def new
    @client = Client.new
  end

  # GET /client/1/edit
  def edit
  end

  # POST /client or /client.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to client_url(@client), notice: "Cliente adicionado com sucesso" }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /client/1 or /client/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to client_url(@client), notice: "Cliente alterado com sucesso." }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client/1 or /client/1.json
  def destroy
    @client.destroy

    respond_to do |format|
      format.html { redirect_to client_index_url, notice: "Cliente removido com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:name, :email, :phone)
    end
end

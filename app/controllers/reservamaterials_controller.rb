class ReservamaterialsController < ApplicationController
  before_action :set_reservamaterial, only: [:show, :edit, :update, :destroy]

  # GET /reservamaterials
  # GET /reservamaterials.json
  def index
    @reservamaterials = Reservamaterial.all
  end

  # GET /reservamaterials/1
  # GET /reservamaterials/1.json
  def show
  end

  # GET /reservamaterials/new
  def new
    @reservamaterial = Reservamaterial.new
    @reserva     = Reserva.all
    @acessorios  = Acessorio.all
    @municaos    = Municao.all
  end

  # GET /reservamaterials/1/edit
  def edit
    @reservamaterial = Reservamaterial.find(params[:id])
    @reserva     = Reserva.all
    @acessorios  = Acessorio.all
    @municaos    = Municao.all
    
  end

  # POST /reservamaterials
  # POST /reservamaterials.json
  def create
    @reservamaterial = Reservamaterial.new(reservamaterial_params)

    respond_to do |format|
      if @reservamaterial.save
        format.html { redirect_to @reservamaterial, notice: 'Reservamaterial was successfully created.' }
        format.json { render :show, status: :created, location: @reservamaterial }
      else
        format.html { render :new }
        format.json { render json: @reservamaterial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservamaterials/1
  # PATCH/PUT /reservamaterials/1.json
  def update
    respond_to do |format|
      if @reservamaterial.update(reservamaterial_params)
        format.html { redirect_to @reservamaterial, notice: 'Reservamaterial was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservamaterial }
      else
        format.html { render :edit }
        format.json { render json: @reservamaterial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservamaterials/1
  # DELETE /reservamaterials/1.json
  def destroy
    @reservamaterial.destroy
    respond_to do |format|
      format.html { redirect_to reservamaterials_url, notice: 'Reservamaterial was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservamaterial
      @reservamaterial = Reservamaterial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservamaterial_params
      params.require(:reservamaterial).permit(:reserva_id, :municao_id, :acessorio_id, :status, :user_id, :data)
    end
end

class CautelasController < ApplicationController
  before_action :set_cautela, only: [:show, :edit, :update, :destroy]

  # GET /cautelas
  # GET /cautelas.json
  def index
    
    @cautelas = Cautela.page(params['page']).per(7)
    @reservas = Reserva.all
    @militars = Militar.all
  end

  # GET /cautelas/1
  # GET /cautelas/1.json
  def show
  end

  # GET /cautelas/new
  def new
    @reservas = Reserva.all
    @militars = Militar.all
    @cautela = Cautela.new
  end

  # GET /cautelas/1/edit
  def edit
    @reservas = Reserva.all
    @militars = Militar.all
    @cautela  = Cautela.find(params[:id])
  end

  # POST /cautelas
  # POST /cautelas.json
  def create
    @cautela = Cautela.new(cautela_params)

    respond_to do |format|
      if @cautela.save
        format.html { redirect_to @cautela, notice: 'Cautela was successfully created.' }
        format.json { render :show, status: :created, location: @cautela }
      else
        format.html { render :new }
        format.json { render json: @cautela.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cautelas/1
  # PATCH/PUT /cautelas/1.json
  def update
    respond_to do |format|
      if @cautela.update(cautela_params)
        format.html { redirect_to @cautela, notice: 'Cautela was successfully updated.' }
        format.json { render :show, status: :ok, location: @cautela }
      else
        format.html { render :edit }
        format.json { render json: @cautela.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cautelas/1
  # DELETE /cautelas/1.json
  def destroy
    @cautela.destroy
    respond_to do |format|
      format.html { redirect_to cautelas_url, notice: 'Cautela was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cautela
      @cautela = Cautela.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cautela_params
      params.require(:cautela).permit(:militar_id, :reserva_id, :data_cautela, :data_fim_cautela)
    end
end

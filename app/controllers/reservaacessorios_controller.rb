class ReservaacessoriosController < ApplicationController
  before_action :set_reservaacessorio, only: [:show, :edit, :update, :destroy]

  # GET /reservaacessorios
  # GET /reservaacessorios.json
  def index
    @reservaacessorios = Reservaacessorio.page(params['page']).per(5);
  end

  # GET /reservaacessorios/1
  # GET /reservaacessorios/1.json
  def show
  end

  # GET /reservaacessorios/new
  def new
    @reservaacessorio = Reservaacessorio.new
    @acessorios  = Acessorio.all
    @reservas  = Reserva.all
  end

  # GET /reservaacessorios/1/edit
  def edit
    @reservaacessorios = Reservaacessorio.find(params[:id])
    @acessorios  = Acessorio.all
    @reservas  = Reserva.all
  end

  # POST /reservaacessorios
  # POST /reservaacessorios.json
  def create
    @reservaacessorio = Reservaacessorio.new(reservaacessorio_params)

    respond_to do |format|
      if @reservaacessorio.save
        format.html { redirect_to @reservaacessorio, notice: 'Reservaacessorio was successfully created.' }
        format.json { render :show, status: :created, location: @reservaacessorio }
      else
        format.html { render :new }
        format.json { render json: @reservaacessorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservaacessorios/1
  # PATCH/PUT /reservaacessorios/1.json
  def update
    respond_to do |format|
      if @reservaacessorio.update(reservaacessorio_params)
        format.html { redirect_to @reservaacessorio, notice: 'Reservaacessorio was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservaacessorio }
      else
        format.html { render :edit }
        format.json { render json: @reservaacessorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservaacessorios/1
  # DELETE /reservaacessorios/1.json
  def destroy
    @reservaacessorio.destroy
    respond_to do |format|
      format.html { redirect_to reservaacessorios_url, notice: 'Reservaacessorio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservaacessorio
      @reservaacessorio = Reservaacessorio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservaacessorio_params
      params.require(:reservaacessorio).permit(:id_acessorio, :qtd_acessorio, :serie, :id_reserva)
    end
end

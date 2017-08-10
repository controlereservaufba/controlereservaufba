class CautelaacessoriosController < ApplicationController
  before_action :set_cautelaacessorio, only: [:show, :edit, :update, :destroy]

  # GET /cautelaacessorios
  # GET /cautelaacessorios.json
  def index
    @cautelaacessorios = Cautelaacessorio.where(cautela_id: params[:cautela_id]).page(params['page']).per(5);
  end

  # GET /cautelaacessorios/1
  # GET /cautelaacessorios/1.json
  def show
  end

  # GET /cautelaacessorios/new
  def new
    @cautelas  = Cautela.all
    @acessorios  = Reservaacessorio.select("reservaacessorios.id id , acessorios.descricao descricao")
                                    .joins("JOIN acessorios ON acessorios.id=reservaacessorios.acessorio_id")
                                    .where("reservaacessorios.reserva_id=:reserva_id",{reserva_id: params[:reserva_id]}).all
    @cautelaacessorio = Cautelaacessorio.new
  end

  # GET /cautelaacessorios/1/edit
  def edit
    @acessorios  = Reservaacessorio.select("reservaacessorios.id id , acessorios.descricao descricao")
                                    .joins("JOIN acessorios ON acessorios.id=reservaacessorios.acessorio_id")
                                    .where("reservaacessorios.reserva_id=:reserva_id",{reserva_id: params[:reserva_id]}).all
    @cautelas  = Cautela.all
    @cautelaacessorio = Cautelaacessorio .find(params[:id])
  end

  # POST /cautelaacessorios
  # POST /cautelaacessorios.json
  def create
    @cautelaacessorio = Cautelaacessorio.new(cautelaacessorio_params)

    respond_to do |format|
      if @cautelaacessorio.save
        format.html { redirect_to @cautelaacessorio, notice: 'Cautelaacessorio was successfully created.' }
        format.json { render :show, status: :created, location: @cautelaacessorio }
      else
        format.html { render :new }
        format.json { render json: @cautelaacessorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cautelaacessorios/1
  # PATCH/PUT /cautelaacessorios/1.json
  def update
    respond_to do |format|
      if @cautelaacessorio.update(cautelaacessorio_params)
        format.html { redirect_to @cautelaacessorio, notice: 'Cautelaacessorio was successfully updated.' }
        format.json { render :show, status: :ok, location: @cautelaacessorio }
      else
        format.html { render :edit }
        format.json { render json: @cautelaacessorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cautelaacessorios/1
  # DELETE /cautelaacessorios/1.json
  def destroy
    @cautelaacessorio.destroy
    respond_to do |format|
      format.html { redirect_to cautelaacessorios_url, notice: 'Cautelaacessorio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cautelaacessorio
      @cautelaacessorio = Cautelaacessorio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cautelaacessorio_params
      params.require(:cautelaacessorio).permit(:cautela_id, :reservaacessorio_id,:qtd_acessorio, :qtd_acessorio_baixa, :data_baixa, :baixa)
    end
end

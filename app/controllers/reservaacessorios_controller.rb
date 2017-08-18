class ReservaacessoriosController < ApplicationController
  before_action :set_reservaacessorio, only: [:show, :edit, :update, :destroy]

  # GET /reservaacessorios
  # GET /reservaacessorios.json
  def index
     @reservaacessorio = Reservaacessorio.where(reserva_id: params[:reserva_id]).page(params['page']).per(5);
     
  end

  # GET /reservaacessorios/1
  # GET /reservaacessorios/1.json
  def show
  end

  # GET /reservaacessorios/new
  def new
    @acessorios  = Acessorio.all
    @reservas  = Reserva.all
    @reservaacessorio = Reservaacessorio.new

  end

  # GET /reservaacessorios/1/edit
  def edit
    @acessorios  = Acessorio.all
    @reservas  = Reserva.all
    @reservaacessorio = Reservaacessorio.find(params[:id])
 
  end

  # POST /reservaacessorios
  # POST /reservaacessorios.json
  def create
        
    @reservaacessorio = Reservaacessorio.new(reservaacessorio_params)
    respond_to do |format|
      if @reservaacessorio.save
        format.html { redirect_to "/reservaacessorios?reserva_id="+@reservaacessorio.reserva_id.to_s,notice: 'Item criado com sucesso!' }
        format.json { render :show, status: :created, location: @reservaacessorio }
      else
        format.html { render :new }
        format.json { render json: @reservaacessorio.errors, status: :unprocessable_entity }
      end
    end
   
   #Atualização da reserva total quando há a inclusão de um novo acessorio 
     @controle = Controle.where(reserva_id: @reservaacessorio.reserva_id) 
     @controle.each do |controle|
       qtd = controle.qtd_acessorio
       qtd= qtd + @reservaacessorio.qtd_acessorio
       @controle.update(qtd_acessorio: qtd)
    end
    
  end

  # PATCH/PUT /reservaacessorios/1
  # PATCH/PUT /reservaacessorios/1.json
  def update
    respond_to do |format|
      if @reservaacessorio.update(reservaacessorio_params)
        format.html { redirect_to "/reservaacessorios?reserva_id="+@reservaacessorio.reserva_id.to_s, notice: 'Item Editado Com Sucesso!'}
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
       format.html { redirect_to "/reservaacessorios?reserva_id="+@reservaacessorio.reserva_id.to_s, notice: 'Item deletado com Sucesso!' }
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
      params.require(:reservaacessorio).permit(:acessorio_id, :qtd_acessorio, :serie, :reserva_id)
    end
end

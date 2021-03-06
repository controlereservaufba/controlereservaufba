class ReservasController < ApplicationController
  before_action :set_reserva, only: [:show, :edit, :update, :destroy]

  # GET /reservas
  # GET /reservas.json
  def index
    @reservas = Reserva.page(params['page']).per(5);
  end

  # GET /reservas/1
  # GET /reservas/1.json
  def show
  end

  # GET /reservas/new
  def new
    @reserva = Reserva.new
  end

  # GET /reservas/1/edit
  def edit
  end

  # POST /reservas
  # POST /reservas.json
  def create
    @reserva = Reserva.new(reserva_params)

    respond_to do |format|
      if @reserva.save
      #Se a reserva foi salva é inserido um controle para aquela reserva  
      @controle = Controle.where(reserva_id: @reserva.id)
      if  @controle.empty?
        @controle = Controle.new()
        @controle.reserva_id  = @reserva.id
        @controle.data_abertura =  DateTime.now   
        @controle.status  = true
        @controle.qtd_acessorio = 0
        @controle.qtd_municao = 0
        @controle.qtd_armamento = 0
        @controle.save
      end  
      
        format.html { redirect_to @reserva, notice: 'A Reserva foi Criada Com Sucesso!' }
        format.json { render :show, status: :created, location: @reserva }
      else
        format.html { render :new }
        format.json { render json: @reserva.errors, status: :unprocessable_entity }
      end
    end
    

  
  end

  # PATCH/PUT /reservas/1
  # PATCH/PUT /reservas/1.json
  def update
    respond_to do |format|
      if @reserva.update(reserva_params)
        format.html { redirect_to @reserva, notice: 'A Reserva foi Editada Com Sucesso!' }
        format.json { render :show, status: :ok, location: @reserva }
      else
        format.html { render :edit }
        format.json { render json: @reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservas/1
  # DELETE /reservas/1.json
  def destroy
    
    #Se a reserva for destruída, seu controle também é destruído   
    @controle = Controle.where(reserva_id: @reserva.id)
    if  @controle.empty?
        @controle.destroy
    end 
      
    @reserva.destroy
    respond_to do |format|
      format.html { redirect_to reservas_url, notice: 'A Reserva foi Deletada Com Sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reserva
      @reserva = Reserva.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reserva_params
      params.require(:reserva).permit(:sigla, :descricao, :user_id, :status, :data)
    end
end

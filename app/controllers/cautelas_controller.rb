class CautelasController < ApplicationController
  before_action :set_cautela, only: [:show, :edit, :update, :destroy]

  # GET /cautelas
  # GET /cautelas.json
  def index
    
   if can? :admin_reserva, Cautela
        
    @cautelas = Cautela.select("cautelas.id,cautelas.militar_id,cautelas.reserva_id, cautelas.data_cautela",+
                          "cautelas.data_fim_cautela, controles.status status")
                         .joins("JOIN controles ON controles.reserva_id = cautelas.reserva_id ")
                         .order("cautelas.data_cautela desc, cautelas.data_fim_cautela is null")
                         .page(params['page']).per(7)
   else
     @cautelas = Cautela.select("cautelas.id,cautelas.militar_id,cautelas.reserva_id, cautelas.data_cautela",+
                            "cautelas.data_fim_cautela, controles.status status")
                           .joins("JOIN controles ON controles.reserva_id = cautelas.reserva_id ")
                           .joins("JOIN usermilitars ON usermilitars.militar_id = cautelas.militar_id ")
                           .where("usermilitars.user_id=:user_id",{user_id:current_user.id}).all
                           .order("cautelas.data_cautela desc, cautelas.data_fim_cautela is null")
                           .page(params['page']).per(7)                          
        
   end
   @reservas = Reserva.all
   @militars = Militar.all
    
  end

  # GET /cautelas/1
  # GET /cautelas/1.json
  def show
    @cautelas  = Cautela.find(params[:id])
    @cautelaacessorios = Cautelaacessorio.where(cautela_id: params[:id]).all
    @cautelamunicaos = Cautelamunicao.where(cautela_id: params[:id]).all
    @cautelaarmamentos = Cautelaarmamento.where(cautela_id: params[:id]).all
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
  
  def finalizar
    @cautela  = Cautela.find(params[:id])
    @cautelaacessorios = Cautelaacessorio.where(cautela_id: params[:id]).all
    @cautelamunicaos = Cautelamunicao.where(cautela_id: params[:id]).all
    @cautelaarmamentos = Cautelaarmamento.where(cautela_id: params[:id]).all
    
    itens_nao_baixados = 0
    
    @cautelaacessorios.each do |cautelaacessorio|
      if cautelaacessorio.baixa == false
        itens_nao_baixados = itens_nao_baixados+1
      end  
    end  
    
    @cautelamunicaos.each do |cautelamunicao|
      if cautelamunicao.baixa == false
        itens_nao_baixados = itens_nao_baixados+1
      end  
    end  
    
    @cautelaarmamentos.each do |cautelaarmamento|
      if cautelaarmamento.baixa == false
        itens_nao_baixados = itens_nao_baixados+1
      end  
    end
    
    respond_to do |format|
      if itens_nao_baixados == 0
        @cautela.update(data_fim_cautela: Time.zone.now )
        format.html { redirect_to "/cautelas", notice: 'A Cautela Foi Finalizada!' }
        format.json { render :show, status: :ok, location: @cautela }
      else
        format.html { redirect_to "/cautelas", notice:'Verifique Se Todos os Itens foram Baixados!' }
        format.json { render json: @cautela.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /cautelas
  # POST /cautelas.json
  def create
    @cautela = Cautela.new(cautela_params)

    respond_to do |format|
      if @cautela.save
        format.html { redirect_to "/cautelas", notice: 'Cautela was successfully created.' }
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
        format.html { redirect_to "/cautelas", notice: 'Cautela was successfully updated.' }
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

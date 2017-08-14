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
    @cautelas  = Cautela.where(id: params[:cautela_id]).all
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
    @cautelas  = Cautela.where(id: params[:cautela_id]).all
    @cautelaacessorio = Cautelaacessorio .find(params[:id])
  end

  # POST /cautelaacessorios
  # POST /cautelaacessorios.json
  def create
    @cautelaacessorio = Cautelaacessorio.new(cautelaacessorio_params)
    respond_to do |format|
      if @cautelaacessorio.save
      
        #retirando itens cautelados da reserva    
        @reservaacessorio=Reservaacessorio.where(id: @cautelaacessorio.reservaacessorio_id,
                                                  reserva_id: @cautelaacessorio.cautela.reserva_id)
        qtd_reserva=0
        @reservaacessorio.each do |reservaacessorios| 
           qtd_reserva = reservaacessorios.qtd_acessorio
        end
        qtd_acessorio_cautela = @cautelaacessorio.qtd_acessorio
        qtd_atualizar = qtd_reserva - qtd_acessorio_cautela                                   
        @reservaacessorio.update(qtd_acessorio: qtd_atualizar)
        mensagem ='O Item foi Adicionado com Sucesso!'
        
        format.html { redirect_to @cautelaacessorio, notice: mensagem}
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
        if @cautelaacessorio.baixa==false
          if @cautelaacessorio.update(cautelaacessorio_params)
            qtd_acessorio_baixa= @cautelaacessorio.qtd_acessorio_baixa
            #adicionando itens baixados da cautela na reserva 
  
            if qtd_acessorio_baixa > 0
              if qtd_acessorio_baixa <= @cautelaacessorio.qtd_acessorio #qtd de acessorios baixados nao pode ser maior que a de cautelados
                @reservaacessorio=Reservaacessorio.where(id: @cautelaacessorio.reservaacessorio_id,
                                                    reserva_id: @cautelaacessorio.cautela.reserva_id)
                                                    
                 qtd_reserva=0
                 @reservaacessorio.each do |reservaacessorios| 
                     qtd_reserva = reservaacessorios.qtd_acessorio
                 end
                 qtd_acessorio_baixado =@cautelaacessorio.qtd_acessorio_baixa  
                 qtd_realocar= qtd_reserva + qtd_acessorio_baixado                                      
                 @reservaacessorio.update(qtd_acessorio: qtd_realocar)
                 @cautelaacessorio.update( baixa: true)
                  mensagem='O Item foi baixado com Sucesso!'
              else
                     mensagem ='A quantidade de item baixados não pode ser maior que a de itens cautelados!'
              end
            end
          end
         
             format.html { redirect_to @cautelaacessorio, notice: mensagem+qtd_realocar.to_s  }
            format.json { render :show, status: :ok, location: @cautelaacessorio }
        else
          mensagem='Nao sei'
          format.html { redirect_to @cautelaacessorio, notice: mensagem+qtd_realocar.to_s  }
            format.json { render :show, status: :ok, location: @cautelaacessorio }
        end
          
     
        end
    
  end

  # DELETE /cautelaacessorios/1
  # DELETE /cautelaacessorios/1.json
  def destroy
    
            #adicionando itens baixados da cautela na reserva 
              if params[:baixar]=='false' 
                @reservaacessorio=Reservaacessorio.where(id: @cautelaacessorio.reservaacessorio_id,
                                                    reserva_id: @cautelaacessorio.cautela.reserva_id)
                                                    
                 qtd_reserva=0
                 @reservaacessorio.each do |reservaacessorios| 
                     qtd_reserva = reservaacessorios.qtd_acessorio
                 end
                 qtd_acessorio_baixado =@cautelaacessorio.qtd_acessorio
                 qtd_realocar= qtd_reserva + qtd_acessorio_baixado                                      
                 @reservaacessorio.update(qtd_acessorio: qtd_realocar)
                 mensagem='O Item foi excluído com Scuesso!'
              end 
      
  
    @cautelaacessorio.destroy
    respond_to do |format|
      format.html { redirect_to cautelaacessorios_url, notice: mensagem }
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

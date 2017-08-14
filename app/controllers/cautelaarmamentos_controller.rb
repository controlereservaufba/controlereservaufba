class CautelaarmamentosController < ApplicationController
  before_action :set_cautelaarmamento, only: [:show, :edit, :update, :destroy]

  # GET /cautelaarmamentos
  # GET /cautelaarmamentos.json
  def index
    @cautelaarmamentos = Cautelaarmamento.where(cautela_id: params[:cautela_id]).page(params['page']).per(5);
  end

  # GET /cautelaarmamentos/1
  # GET /cautelaarmamentos/1.json
  def show
  end

  # GET /cautelaarmamentos/new
  def new
     @cautelas  = Cautela.where(id: params[:cautela_id]).all
     @armamentos  = Reservaarmamento.select("reservaarmamentos.id id, armamentos.modelo||' - '|| armamentos.fabricante||' - '||reservaarmamentos.serie descricao")
                                    .joins("JOIN armamentos ON armamentos.id=reservaarmamentos.armamento_id")
                                    .where("reservaarmamentos.reserva_id=:reserva_id and reservaarmamentos.qtd_armamento>0",{reserva_id: params[:reserva_id]}).all
    @cautelaarmamento = Cautelaarmamento.new
  end

  # GET /cautelaarmamentos/1/edit
  def edit
     @cautelas  = Cautela.where(id: params[:cautela_id]).all
       @armamentos  = Reservaarmamento.select("reservaarmamentos.id id , armamentos.modelo descricao")
                                    .joins("JOIN armamentos ON armamentos.id=reservaarmamentos.armamento_id")
                                    .where("reservaarmamentos.reserva_id=:reserva_id ",{reserva_id: params[:reserva_id]}).all
       @cautelaarmamento = Cautelaarmamento.find(params[:id])
  end

  # POST /cautelaarmamentos
  # POST /cautelaarmamentos.json
  def create
    @cautelaarmamento = Cautelaarmamento.new(cautelaarmamento_params)

    respond_to do |format|
      if @cautelaarmamento.save
        
        #retirando itens cautelados da reserva    
        @reservaarmamento=Reservaarmamento.where(id: @cautelaarmamento.reservaarmamento_id,
                                                  reserva_id: @cautelaarmamento.cautela.reserva_id)
        qtd_reserva=0
        @reservaarmamento.each do |reservaarmamento| 
           qtd_reserva = reservaarmamento.qtd_armamento
        end
        qtd_armamento_cautela = @cautelaarmamento.qtd_armamento
        qtd_atualizar = qtd_reserva - qtd_armamento_cautela                                   
        @reservaarmamento.update(qtd_armamento: qtd_atualizar)
        mensagem ='O Item foi Adicionado com Sucesso!'
        
        format.html { redirect_to "/cautelaarmamentos?cautela_id="+@cautelaarmamento.cautela_id.to_s+"&reserva_id="+@cautelaarmamento.cautela.reserva_id.to_s, notice: mensagem}
        format.json { render :show, status: :created, location: @cautelaarmamento }
      else
        format.html { render :new }
        format.json { render json: @cautelaarmamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cautelaarmamentos/1
  # PATCH/PUT /cautelaarmamentos/1.json
  def update
    respond_to do |format|

      if @cautelaarmamento.baixa==false
          if @cautelaarmamento.update(cautelaarmamento_params)
            qtd_armamento_baixado= @cautelaarmamento.qtd_armamento_baixa
            #adicionando itens baixados da cautela na reserva 
  
            if qtd_armamento_baixado > 0
              if qtd_armamento_baixado <= @cautelaarmamento.qtd_armamento #qtd de armamentos baixados nao pode ser maior que a de cautelados
                 @reservaarmamento=Reservaarmamento.where(id: @cautelaarmamento.reservaarmamento_id,
                                                          reserva_id: @cautelaarmamento.cautela.reserva_id)
                                                    
                 qtd_reserva=0
                 @reservaarmamento.each do |reservaarmamento| 
                     qtd_reserva = reservaarmamento.qtd_armamento
                 end
                 qtd_realocar= qtd_reserva + qtd_armamento_baixado                                      
                 @reservaarmamento.update(qtd_armamento: qtd_realocar)
                 @cautelaarmamento.update( baixa: true)
                  mensagem='O Item foi baixado com Sucesso!'
              else
                     mensagem ='A quantidade de item baixados não pode ser maior que a de itens cautelados!'
              end
            end
          end
        format.html { redirect_to "/cautelaarmamentos?cautela_id="+@cautelaarmamento.cautela_id.to_s+"&reserva_id="+@cautelaarmamento.cautela.reserva_id.to_s, notice: mensagem}
      else
        format.html { render :edit }
        format.json { render json: @cautelaarmamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cautelaarmamentos/1
  # DELETE /cautelaarmamentos/1.json
  def destroy
     #adicionando itens baixados da cautela na reserva 
    if params[:baixar]=='false' 
       @reservaarmamento=Reservaarmamento.where(id: @cautelaarmamento.reservaarmamento_id,
                                                 reserva_id: @cautelaarmamento.cautela.reserva_id)
        qtd_reserva=0
        @reservaarmamento.each do |reservaarmamento| 
            qtd_reserva = reservaarmamento.qtd_armamento
        end
        qtd_armamento_baixado =@cautelaarmamento.qtd_armamento
        qtd_realocar= qtd_reserva + qtd_armamento_baixado                                      
        @reservaarmamento.update(qtd_armamento: qtd_realocar)
        mensagem='O Item foi excluído com Scuesso!'
    end 
              
    @cautelaarmamento.destroy
    respond_to do |format|
      format.html { redirect_to "/cautelaarmamentos?cautela_id="+@cautelaarmamento.cautela_id.to_s+"&reserva_id="+@cautelaarmamento.cautela.reserva_id.to_s, notice: mensagem}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cautelaarmamento
      @cautelaarmamento = Cautelaarmamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cautelaarmamento_params
      params.require(:cautelaarmamento).permit(:cautela_id, :reservaarmamento_id, :qtd_armamento, :qtd_armamento_baixa, :data_baixa, :baixa)
    end
end

class CautelamunicaosController < ApplicationController
  before_action :set_cautelamunicao, only: [:show, :edit, :update, :destroy]

  # GET /cautelamunicaos
  # GET /cautelamunicaos.json
  def index
    @cautelamunicaos = Cautelamunicao.where(cautela_id: params[:cautela_id]).page(params['page']).per(5);
  end

  # GET /cautelamunicaos/1
  # GET /cautelamunicaos/1.json
  def show
  end

  # GET /cautelamunicaos/new
  def new
      @cautelas  = Cautela.where(id: params[:cautela_id]).all
     @municaos  = Reservamunicao.select("reservamunicaos.id id , municaos.descricao descricao")
                                    .joins("JOIN municaos ON municaos.id=reservamunicaos.municao_id")
                                    .where("reservamunicaos.reserva_id=:reserva_id",{reserva_id: params[:reserva_id]}).all
    @cautelamunicao = Cautelamunicao.new
  end

  # GET /cautelamunicaos/1/edit
  def edit
      @municaos  = Reservamunicao.select("reservamunicaos.id id , municaos.descricao descricao")
                                    .joins("JOIN municaos ON municaos.id=reservamunicaos.municao_id")
                                    .where("reservamunicaos.reserva_id=:reserva_id",{reserva_id: params[:reserva_id]}).all
    @cautelas  = Cautela.where(id: params[:cautela_id]).all
    @cautelamunicao = Cautelamunicao .find(params[:id])
  end

  # POST /cautelamunicaos
  # POST /cautelamunicaos.json
  def create
    @cautelamunicao = Cautelamunicao.new(cautelamunicao_params)

    respond_to do |format|
      if @cautelamunicao.save
         #retirando itens cautelados da reserva    
        @reservamunicao=Reservamunicao.where(id: @cautelamunicao.reservamunicao_id,
                                                  reserva_id: @cautelamunicao.cautela.reserva_id)
        qtd_reserva=0
        @reservamunicao.each do |reservamunicao| 
           qtd_reserva = reservamunicao.qtd_municao
        end
        qtd_municao_cautela = @cautelamunicao.qtd_municao
        qtd_atualizar = qtd_reserva - qtd_municao_cautela                                   
        @reservamunicao.update(qtd_municao: qtd_atualizar)
        mensagem ='O Item foi Adicionado com Sucesso!'
        
        format.html { redirect_to "/cautelamunicaos?cautela_id="+@cautelamunicao.cautela_id.to_s+"&reserva_id="+@cautelamunicao.cautela.reserva_id.to_s, notice: mensagem}
        format.json { render :show, status: :created, location: @cautelamunicao }
      else
        format.html { render :new }
        format.json { render json: @cautelamunicao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cautelamunicaos/1
  # PATCH/PUT /cautelamunicaos/1.json
  def update
    respond_to do |format|
     
        
      if @cautelamunicao.baixa==false
          if @cautelamunicao.update(cautelamunicao_params)
            qtd_municao_baixa= @cautelamunicao.qtd_municao_baixado
            #adicionando itens baixados da cautela na reserva 
  
            if qtd_municao_baixa > 0
              if qtd_municao_baixa <= @cautelamunicao.qtd_municao #qtd de acessorios baixados nao pode ser maior que a de cautelados
                @reservamunicao=Reservamunicao.where(id: @cautelamunicao.reservamunicao_id,
                                                    reserva_id: @cautelamunicao.cautela.reserva_id)
                                                    
                 qtd_reserva=0
                 @reservamunicao.each do |reservamunicaos| 
                     qtd_reserva = reservamunicaos.qtd_municao
                 end
                 qtd_municao_baixado =@cautelamunicao.qtd_municao_baixado  
                 qtd_realocar= qtd_reserva + qtd_municao_baixado                                      
                 @reservamunicao.update(qtd_municao: qtd_realocar)
                 @cautelamunicao.update( baixa: true)
                  mensagem='O Item foi baixado com Sucesso!'
              else
                     mensagem ='A quantidade de item baixados não pode ser maior que a de itens cautelados!'
              end
            end
          end
        format.html { redirect_to "/cautelamunicaos?cautela_id="+@cautelamunicao.cautela_id.to_s+"&reserva_id="+@cautelamunicao.cautela.reserva_id.to_s, notice: mensagem}
        format.json { render :show, status: :ok, location: @cautelamunicao }
      else
        format.html { render :edit }
        format.json { render json: @cautelamunicao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cautelamunicaos/1
  # DELETE /cautelamunicaos/1.json
  def destroy
     #adicionando itens baixados da cautela na reserva 
              if params[:baixar]=='false' 
                 @reservamunicao=Reservamunicao.where(id: @cautelamunicao.reservamunicao_id,
                                                    reserva_id: @cautelamunicao.cautela.reserva_id)
                                                    
                 qtd_reserva=0
                 @reservamunicao.each do |reservamunicaos| 
                     qtd_reserva = reservamunicaos.qtd_municao
                 end
                 qtd_municao_baixado =@cautelamunicao.qtd_municao
                 qtd_realocar= qtd_reserva + qtd_municao_baixado                                      
                 @reservamunicao.update(qtd_municao: qtd_realocar)
                 mensagem='O Item foi excluído com Scuesso!'
              end 
              
    @cautelamunicao.destroy
    respond_to do |format|
      format.html { redirect_to "/cautelamunicaos?cautela_id="+@cautelamunicao.cautela_id.to_s+"&reserva_id="+@cautelamunicao.cautela.reserva_id.to_s, notice: mensagem}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cautelamunicao
      @cautelamunicao = Cautelamunicao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cautelamunicao_params
      params.require(:cautelamunicao).permit(:cautela_id, :reservamunicao_id, :qtd_municao, :qtd_municao_baixado, :data_baixa, :baixa)
    end
end

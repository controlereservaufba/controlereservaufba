class ControlesController < ApplicationController
  before_action :set_controle, only: [:show, :edit, :update, :destroy]

  # GET /controles
  # GET /controles.json
  def index
    @controles = Controle.page(params['page']).per(7);
    @reservas = Reserva.all;
  end

  # GET /controles/1
  # GET /controles/1.json
  def show
    @total=Reservaacessorio.where(reserva_id: @controle.reserva_id).total+
           Reservamunicao.where(reserva_id: @controle.reserva_id).total+
           Reservaarmamento.where(reserva_id: @controle.reserva_id).total;
           
    @controles       = Reservaacessorio.select(" reserva_id,acessorio_id, sum(qtd_acessorio) as total_qtd")
                                       .where(reserva_id: @controle.reserva_id)
                                       .group("reserva_id,acessorio_id").page(params['page']).per(200);
    @controlesmunicao = Reservamunicao.select(" reserva_id,municao_id, sum(qtd_municao) as total_qtd")
                                      .where(reserva_id: @controle.reserva_id)
                                      .group("reserva_id,municao_id").page(params['page']).per(200);
    @controlesarma    = Reservaarmamento.select(" reserva_id,armamento_id, sum(qtd_armamento) as total_qtd")
                                        .where(reserva_id: @controle.reserva_id)
                                       .group("reserva_id,armamento_id ").page(params['page']).per(200);
  end

  # GET /controles/new
  def new
    @controle = Controle.new
    @reservas = Reserva.all;
  end

  # GET /controles/1/edit
  def edit
        @reservas = Reserva.all;
        @controle = Controle.find(params[:id])
  end
  

  
  def abrir
     @controle = Controle.find(params[:id])
     respond_to do |format|
      if @controle.status  == 'true'
          menssagem= 'Reserva Já está Aberta!'
      else
           @reserva=Reserva.where(id: @controle.reserva_id)
           @reserva.update(status: true)
           @controle.update(status: true)
          menssagem= 'Reserva Aberta com Sucesso!!'  
       
      end  
      format.html { redirect_to "/controles/", notice: menssagem}
     end  
  end 
  
  def fechar
     @controle = Controle.find(params[:id])
     
     respond_to do |format|
      if @controle.status  == 'false'
          menssagem= 'Reserva Já está Fechada!'
      else
          @reserva=Reserva.where(id: @controle.reserva_id)
          @reserva.update(status: false)
          @controle.update(status: false)
          menssagem= 'Reserva Fechada com Sucesso!' 
     
      end  
      format.html { redirect_to "/controles/", notice: menssagem}
     end  
  end      
        
  # POST /controles
  # POST /controles.json
  def create
    @controle = Controle.new(controle_params)

    respond_to do |format|
      if @controle.save
        format.html { redirect_to @controle, notice: 'Controle was successfully created.' }
        format.json { render :show, status: :created, location: @controle }
      else
        format.html { render :new }
        format.json { render json: @controle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /controles/1
  # PATCH/PUT /controles/1.json
  def update
    respond_to do |format|
      if @controle.update(controle_params)
        format.html { redirect_to @controle, notice: 'Controle was successfully updated.' }
        format.json { render :show, status: :ok, location: @controle }
      else
        format.html { render :edit }
        format.json { render json: @controle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /controles/1
  # DELETE /controles/1.json
  def destroy
    @controle.destroy
    respond_to do |format|
      format.html { redirect_to controles_url, notice: 'Controle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_controle
      @controle = Controle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def controle_params
      params.require(:controle).permit(:reserva_id, :data_fechamento, :data_abertura, :status, :qtd_municao, :qtd_armamento, :qtd_acessorio)
    end
end

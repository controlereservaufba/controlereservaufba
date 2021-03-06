class ReservaarmamentosController < ApplicationController
  before_action :set_reservaarmamento, only: [:show, :edit, :update, :destroy]

  # GET /reservaarmamentos
  # GET /reservaarmamentos.json
  def index
    @reservaarmamentos = Reservaarmamento.where(reserva_id: params[:reserva_id]).page(params['page']).per(5);
  end

  # GET /reservaarmamentos/1
  # GET /reservaarmamentos/1.json
  def show
  end

  # GET /reservaarmamentos/new
  def new
    @armamentos  = Armamento.all
    @reservas  = Reserva.all
    @reservaarmamento = Reservaarmamento.new
  end

  # GET /reservaarmamentos/1/edit
  def edit
    @armamentos  = Armamento.all
    @reservas  = Reserva.all
    @reservaarmamento = Reservaarmamento.find(params[:id])
  end

  # POST /reservaarmamentos
  # POST /reservaarmamentos.json
  def create
   @reservaarmamento = Reservaarmamento.new(reservaarmamento_params)
   serie=@reservaarmamento.serie
   if serie.blank?
      redirect_to "/reservaarmamentos?reserva_id="+@reservaarmamento.reserva_id.to_s,notice: 'Informe um número de série!' 
   else 
    
       respond_to do |format|
       if @reservaarmamento.save
         format.html { redirect_to "/reservaarmamentos?reserva_id="+@reservaarmamento.reserva_id.to_s,notice: 'Item criado com sucesso!' }
         format.json { render :show, status: :created, location: @reservaarmamento }
       else
         format.html { render :new }
         format.json { render json: @reservaarmamento.errors, status: :unprocessable_entity }
       end
     end
   end  
  end

  # PATCH/PUT /reservaarmamentos/1
  # PATCH/PUT /reservaarmamentos/1.json
  def update
    respond_to do |format|
      if @reservaarmamento.update(reservaarmamento_params)
        format.html { redirect_to "/reservaarmamentos?reserva_id="+@reservaarmamento.reserva_id.to_s,notice: 'Item Editado com sucesso!' }
        format.json { render :show, status: :ok, location: @reservaarmamento }
      else
        format.html { render :edit }
        format.json { render json: @reservaarmamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservaarmamentos/1
  # DELETE /reservaarmamentos/1.json
  def destroy
    @reservaarmamento.destroy
    respond_to do |format|
      format.html { redirect_to "/reservaarmamentos?reserva_id="+@reservaarmamento.reserva_id.to_s,notice: 'Item Deletado com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservaarmamento
      @reservaarmamento = Reservaarmamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservaarmamento_params
      params.require(:reservaarmamento).permit(:armamento_id, :reserva_id, :qtd_armamento, :serie)
    end
end

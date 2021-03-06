class ReservamunicaosController < ApplicationController
  before_action :set_reservamunicao, only: [:show, :edit, :update, :destroy]

  # GET /reservamunicaos
  # GET /reservamunicaos.json
  def index
    @reservamunicao = Reservamunicao.where(reserva_id: params[:reserva_id]).page(params['page']).per(5);
  end

  # GET /reservamunicaos/1
  # GET /reservamunicaos/1.json
  def show
    @reservas  = Reserva.all
    @municaos = Municao.all
  end

  # GET /reservamunicaos/new
  def new
    @reservas  = Reserva.all
    @municaos = Municao.all
    @reservamunicao = Reservamunicao.new
   
  end

  # GET /reservamunicaos/1/edit
  def edit
    @reservas  = Reserva.all
    @municaos = Municao.all
    @reservamunicao = Reservamunicao.find(params[:id])
  end

  # POST /reservamunicaos
  # POST /reservamunicaos.json
  def create
    @reservamunicao = Reservamunicao.new(reservamunicao_params)
    if  @reservamunicao.qtd_municao.nil? ||@reservamunicao.qtd_municao<=0
      redirect_to "/reservamunicaos?reserva_id="+@reservamunicao.reserva_id.to_s,notice: 'Informe uma quantidade válida!' 
    else 
      respond_to do |format|
        if @reservamunicao.save
          format.html { redirect_to "/reservamunicaos?reserva_id="+@reservamunicao.reserva_id.to_s,notice: 'Item criado com sucesso!' }
          format.json { render :show, status: :created, location: @reservamunicao }
        else
          format.html { render :new }
          format.json { render json: @reservamunicao.errors, status: :unprocessable_entity }
        end
      end
    end  
  end

  # PATCH/PUT /reservamunicaos/1
  # PATCH/PUT /reservamunicaos/1.json
  def update
    respond_to do |format|
      if @reservamunicao.update(reservamunicao_params)
        format.html { redirect_to "/reservamunicaos?reserva_id="+@reservamunicao.reserva_id.to_s,notice: 'Item Editado com sucesso!' }
        format.json { render :show, status: :ok, location: @reservamunicao }
      else
        format.html { render :edit }
        format.json { render json: @reservamunicao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservamunicaos/1
  # DELETE /reservamunicaos/1.json
  def destroy
    @reservamunicao.destroy
    respond_to do |format|
      format.html { redirect_to "/reservamunicaos?reserva_id="+@reservamunicao.reserva_id.to_s,notice: 'Item Deletado com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservamunicao
      @reservamunicao = Reservamunicao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservamunicao_params
      params.require(:reservamunicao).permit(:municao_id, :qtd_municao, :serie, :reserva_id)
    end
end

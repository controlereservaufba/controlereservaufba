class ArmamentosController < ApplicationController
  before_action :set_armamento, only: [:show, :edit, :update, :destroy]

  # GET /armamentos
  # GET /armamentos.json
  def index
    @armamentos = Armamento.page(params['page']).per(5);
  end

  # GET /armamentos/1
  # GET /armamentos/1.json
  def show
  end

  # GET /armamentos/new
  def new
    @armamento = Armamento.new
  end

  # GET /armamentos/1/edit
  def edit
  end

  # POST /armamentos
  # POST /armamentos.json
  def create
    @armamento = Armamento.new(armamento_params)

    respond_to do |format|
      if @armamento.save
        format.html { redirect_to @armamento, notice: 'O Armamento foi criado com sucesso!' }
        format.json { render :show, status: :created, location: @armamento }
      else
        format.html { render :new }
        format.json { render json: @armamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /armamentos/1
  # PATCH/PUT /armamentos/1.json
  def update
    respond_to do |format|
      if @armamento.update(armamento_params)
        format.html { redirect_to @armamento, notice: 'O Armamento foi editado com sucesso!' }
        format.json { render :show, status: :ok, location: @armamento }
      else
        format.html { render :edit }
        format.json { render json: @armamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /armamentos/1
  # DELETE /armamentos/1.json
  def destroy
    @armamento.destroy
    respond_to do |format|
      format.html { redirect_to armamentos_url, notice: 'O Armamento foi deletado com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_armamento
      @armamento = Armamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def armamento_params
      params.require(:armamento).permit(:serie, :modelo, :fabricante)
    end
end

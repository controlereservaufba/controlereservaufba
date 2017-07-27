class ControlesController < ApplicationController
  before_action :set_controle, only: [:show, :edit, :update, :destroy]

  # GET /controles
  # GET /controles.json
  def index
    @controles = Controle.page(params['page']).per(5);
    
  end

  # GET /controles/1
  # GET /controles/1.json
  def show
  end

  # GET /controles/new
  def new
    @controle = Controle.new
  end

  # GET /controles/1/edit
  def edit
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

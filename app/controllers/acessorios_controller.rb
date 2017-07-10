class AcessoriosController < ApplicationController
  before_action :set_acessorio, only: [:show, :edit, :update, :destroy]

  # GET /acessorios
  # GET /acessorios.json
  def index
    @acessorios = Acessorio.page(params['page']).per(5);
  end

  # GET /acessorios/1
  # GET /acessorios/1.json
  def show
  end

  # GET /acessorios/new
  def new
    @acessorio = Acessorio.new
  end

  # GET /acessorios/1/edit
  def edit
  end

  # POST /acessorios
  # POST /acessorios.json
  def create
    @acessorio = Acessorio.new(acessorio_params)

    respond_to do |format|
      if @acessorio.save
        format.html { redirect_to @acessorio, notice: 'Acessorio was successfully created.' }
        format.json { render :show, status: :created, location: @acessorio }
      else
        format.html { render :new }
        format.json { render json: @acessorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /acessorios/1
  # PATCH/PUT /acessorios/1.json
  def update
    respond_to do |format|
      if @acessorio.update(acessorio_params)
        format.html { redirect_to @acessorio, notice: 'Acessorio was successfully updated.' }
        format.json { render :show, status: :ok, location: @acessorio }
      else
        format.html { render :edit }
        format.json { render json: @acessorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acessorios/1
  # DELETE /acessorios/1.json
  def destroy
    @acessorio.destroy
    respond_to do |format|
      format.html { redirect_to acessorios_url, notice: 'Acessorio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_acessorio
      @acessorio = Acessorio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def acessorio_params
      params.require(:acessorio).permit(:descricao)
    end
end

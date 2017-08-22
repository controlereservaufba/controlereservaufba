class MunicaosController < ApplicationController
  before_action :set_municao, only: [:show, :edit, :update, :destroy]

  # GET /municaos
  # GET /municaos.json
  def index
    @municaos = Municao.page(params['page']).per(5);
  end

  # GET /municaos/1
  # GET /municaos/1.json
  def show
  end

  # GET /municaos/new
  def new
    @municao = Municao.new
  end

  # GET /municaos/1/edit
  def edit
  end

  # POST /municaos
  # POST /municaos.json
  def create
    @municao = Municao.new(municao_params)

    respond_to do |format|
      if @municao.save
        format.html { redirect_to @municao, notice: 'A Munição foi criada com sucesso!' }
        format.json { render :show, status: :created, location: @municao }
      else
        format.html { render :new }
        format.json { render json: @municao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /municaos/1
  # PATCH/PUT /municaos/1.json
  def update
    respond_to do |format|
      if @municao.update(municao_params)
        format.html { redirect_to @municao, notice: 'A Munição foi editada com sucesso!' }
        format.json { render :show, status: :ok, location: @municao }
      else
        format.html { render :edit }
        format.json { render json: @municao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /municaos/1
  # DELETE /municaos/1.json
  def destroy
    @municao.destroy
    respond_to do |format|
      format.html { redirect_to municaos_url, notice: 'A Munição foi deletada com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_municao
      @municao = Municao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def municao_params
      params.require(:municao).permit(:calibre, :descricao)
    end
end

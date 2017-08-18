class UsermilitarsController < ApplicationController
  before_action :set_usermilitar, only: [:show, :edit, :update, :destroy]

  # GET /usermilitars
  # GET /usermilitars.json
  def index
    @usermilitars = Usermilitar.page(params['page']).per(5);
  end

  # GET /usermilitars/1
  # GET /usermilitars/1.json
  def show
  end

  # GET /usermilitars/new
  def new
    @militar  = Militar.all
    @user     = User.select("id,nome||' - '||email nome").all
    @usermilitar = Usermilitar.new
  end

  # GET /usermilitars/1/edit
  def edit
    @militar  = Militar.all
    @user     = User.select("id,nome||' - '||email nome").all
    @usermilitar = Usermilitar.find(params[:id])
  end
  

  # POST /usermilitars
  # POST /usermilitars.json
  def create
    @usermilitar = Usermilitar.new(usermilitar_params)

    respond_to do |format|
      if @usermilitar.save
        format.html { redirect_to @usermilitar, notice: 'Relação Criada com Sucesso!' }
        format.json { render :show, status: :created, location: @usermilitar }
      else
        format.html { render :new }
        format.json { render json: @usermilitar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usermilitars/1
  # PATCH/PUT /usermilitars/1.json
  def update
    respond_to do |format|
      if @usermilitar.update(usermilitar_params)
        format.html { redirect_to @usermilitar, notice: 'Relação Editada com Sucesso!' }
        format.json { render :show, status: :ok, location: @usermilitar }
      else
        format.html { render :edit }
        format.json { render json: @usermilitar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usermilitars/1
  # DELETE /usermilitars/1.json
  def destroy
    @usermilitar.destroy
    respond_to do |format|
      format.html { redirect_to usermilitars_url, notice: 'Relação Deletada com Sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usermilitar
      @usermilitar = Usermilitar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usermilitar_params
      params.require(:usermilitar).permit(:militar_id, :user_id, :data)
    end
end

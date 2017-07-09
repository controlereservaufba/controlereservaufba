class MilitarsController < ApplicationController
  before_action :set_militar, only: [:show, :edit, :update, :destroy]

  # GET /militars
  # GET /militars.json
  def index
    @militars = Militar.page(params['page']).per(5);
  end

  # GET /militars/1
  # GET /militars/1.json
  def show
  end

  # GET /militars/new
  def new
    @militar = Militar.new
  end

  # GET /militars/1/edit
  def edit
  end

  # POST /militars
  # POST /militars.json
  def create
    @militar = Militar.new(militar_params)

    respond_to do |format|
      if @militar.save
        format.html { redirect_to @militar, notice: 'Militar was successfully created.' }
        format.json { render :show, status: :created, location: @militar }
      else
        format.html { render :new }
        format.json { render json: @militar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /militars/1
  # PATCH/PUT /militars/1.json
  def update
    respond_to do |format|
      if @militar.update(militar_params)
        format.html { redirect_to @militar, notice: 'Militar was successfully updated.' }
        format.json { render :show, status: :ok, location: @militar }
      else
        format.html { render :edit }
        format.json { render json: @militar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /militars/1
  # DELETE /militars/1.json
  def destroy
    @militar.destroy
    respond_to do |format|
      format.html { redirect_to militars_url, notice: 'Militar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_militar
      @militar = Militar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def militar_params
      params.require(:militar).permit(:nome, :nome_guerra, :posto)
    end
end

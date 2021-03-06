class UserController < ApplicationController
  
  
  def index
     @users = User.order(:nome).page(params['page']).per(5);
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
     redirect_to "/user", notice: 'O Usuário foi criado com sucesso!' 
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    #flash[:notice] = "O usuário foi atualizado com sucesso."
      redirect_to "/user",notice: 'O Usuário foi atualizado com sucesso.!' 
    #  redirect_to root_path
    else
      render :action => 'edit'
    end
  end
  
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to "/user",notice: 'O Usuário foi deletado com sucesso.!' 
    end
  end
 
 private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
     params.require(:user).permit(:email,:nome,:admin,:admin_reserva,:username,:usuario)
    end
     

end


 
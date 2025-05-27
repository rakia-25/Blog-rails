class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "Rôle mis à jour avec succès."
    else
      render :edit, alert: "Erreur lors de la mise à jour du rôle."
    end
  end

  private

    def authenticate_admin!
      redirect_to root_path, alert: "Accès réservé aux administrateurs." unless current_user.role_admin?
    end

    def user_params
      params.require(:user).permit(:role_admin)
    end
end


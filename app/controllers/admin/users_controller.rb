class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_user, except: %i[index]

  def index
    @users = User.all
  end

  def show
    @movies = @user.movies
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end
end

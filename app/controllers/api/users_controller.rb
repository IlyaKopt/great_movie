class Api::UsersController < ActionController::API
  # before_action :set_user, only: [:show, :edit, :update, :destroy]
  include Response
  
  def show
    if params[:username].present?
      @user = User.find_by_username(params[:username])
      json_response(@user)
    else
      render json: {}, status: 401
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      json_response(@user)
    else
      render json: @user.errors, status: 422
    end
  end

  # def update
  #   respond_to do |format|
  #     if @user.update(user_params)
  #       format.json { render :show, status: :ok, location: @user }
  #     else
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # def destroy
  #   @user.destroy
  #   respond_to do |format|
  #     format.json { head :no_content }
  #   end
  # end

  private
    def user_params
      params.require(:user).permit(:username)
    end
end

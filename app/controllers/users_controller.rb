class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = policy_scope(User).page(params[:page])
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: @user.updated_message }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: @user.destroyed_message }
      format.json { head :no_content }
    end
  end

private
  def set_user
    @user = User.friendly.find params[:id]
    authorize @user
  end

    def user_params
      if current_user.admin?
        return params.require(:user).permit(:name, :description, :password, :avatar, :color, :locale_id, :role)
      end

      if @user == current_user
        return params.require(:user).permit(:name, :description, :password, :avatar, :color, :locale_id)
      end

      return params.require(:user).permit()
    end
end

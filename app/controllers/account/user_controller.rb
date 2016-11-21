class Account::UserController < Account::AccountController

  before_action :set_user, only: [:update]

  def index
    @user = current_user
  end

  # PATCH/PUT /account/user/1
  # PATCH/PUT /account/user/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to account_user_index_path, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :index }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email,:firstname, :lastname, :password, :password_confirmation)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(current_user.id)
    end
end

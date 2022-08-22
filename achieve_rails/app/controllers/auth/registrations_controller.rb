class Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  private

  def sign_up_params
    params.permit(:name, :email, :password, :password_confirmation)
    # params.require(:registration).permit(:name, :email, :password, :password_confirmation)
  end
end

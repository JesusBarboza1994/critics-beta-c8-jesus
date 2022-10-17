class SessionsController < ApplicationController
  # GET /login
  def new
    # render "new"
  end

  # POST /sessions => form: {email: ,...., password:,...}
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      # Estamos registrados
      log_in(user)

      redirect_to root_path
    else
      flash.now[:error] = "Invalid credentials"
      render "new", status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, status: :see_other
  end
end

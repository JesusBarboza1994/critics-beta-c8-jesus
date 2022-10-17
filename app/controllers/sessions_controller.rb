class SessionsController < ApplicationController
  # GET /login
  def new
    
    # render "new"
  end

  # POST /sessions => form: {email: ,...., password:,...}
  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      # Estamos registrados
      session[:user_id] = user.id

      redirect_to root_path
    else
      render "new"
    end
  end
end

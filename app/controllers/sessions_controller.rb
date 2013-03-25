class SessionsController < ApplicationController

	def new
  end

  def create
  	user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user, notice: 'Bienvenido a Nuestros Precios.'
    else
      flash.now[:error] = 'Combinacion email/password invalida'
      render 'new'
    end
  end

  def create_omniauth
    auth_hash = request.env['omniauth.auth']
    # render :json => auth_hash

    if signed_in?
      # Means our user is signed in. Add the authorization to the user
      user = User.find(current_user.id).add_provider(auth_hash)
    else
      # Log him in or sign him up
      auth = Authorization.find_or_create(auth_hash)

      # Create the session
      user = User.find(auth.user.id)
      sign_in user
    end
      redirect_to user, notice: 'Bienvenido a Nuestros Precios.'
  end

  def destroy
    sign_out
    redirect_to root_url, notice: 'Tu sesion se ha cerrado correctamente, regresa pronto.'
  end
end

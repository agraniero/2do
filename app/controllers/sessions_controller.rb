class SessionsController < ApplicationController
  
  def new
  end

  def create
    # if auth_hash = request.env['omniauth.auth']
    #   @user = User.find_or_create_by_omniauth(auth_hash)
    #     session[:user_id] = @user.id

      
    #   else
    #     @user = User.create(:email => oauth_email, :password => 'SecureRandom.hex')
    #     session[:user_id] = @user.id
    #   end
     
    #   redirect_to lists_path
      @user = User.find_by(:email => params[:email])
      if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to lists_path and return
          
     raise params elsif @user = User.find_by(:email => auth['info']['email'])
        
          if @user.uid.nil?
            @user.update(:uid => auth['uid'])
          end
      else
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
          u.name = auth['info']['name']
          u.email = auth['info']['email']
          u.image = auth['info']['image']
          u.password = SecureRandom.hex
        end
      end
      session[:user_id] = @user.id
      redirect_to lists_path   
  end

  def destroy
    reset_session
    redirect_to login_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
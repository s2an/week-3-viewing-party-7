class UsersController <ApplicationController 
  def new 
    @user = User.new()
  end 

  def show 
    @user = User.find(params[:id])
  end 

  def create 
    user = User.create(user_params)
    if user.save
      redirect_to user_path(user)
    else  
      flash[:alert] = "field cannot be blank" # <--- can I make this dynamic via the params??
      flash[:error] = user.errors.full_messages.to_sentence
      redirect_to register_path
    end 
  end 

  def login_form; end
  
  def login_user
    # require "pry"; binding.pry
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      cookies[:location] = params[:location]
      # session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.email}!"
      redirect_to user_path(user)
    else
      # sad path, bad credentials
      flash[:error] = "Incorrect password/credentials"
      render :login_form
    end
  end

  def logout
    session.delete(:user_id)

    flash[:success] = "You have been logged out."
    redirect_to root_path
  end
  

  private 

  def user_params 
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end 
end 
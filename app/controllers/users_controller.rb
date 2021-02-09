class UsersController < ApplicationController

  def new
  end

  # def authenticate_with_credentials(email, password)
  #   if User.where("email = ?, password = ?", :email, :password) != nil
  #     return User.find_by_email(:email)
  #   else
  #     return nil
  # end
  

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

private

def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
end

end

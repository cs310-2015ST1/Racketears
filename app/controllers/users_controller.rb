class UsersController < ApplicationController

  def show
  	@user = User.find(params[:id])
  end

	
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      toggle_admin(@user)
  		log_in @user
  		flash[:success] = "Welcome to H2GO!!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  private 

  	def user_params
    	params.require(:user).permit(:name, :email, :password,
                                   	:password_confirmation)
  	end

    def toggle_admin(user)
      admin_emails = ['bollain@gmail.com', 'ptranx23@gmail.com', 'seandibango@gmail.com', 'r1ya3n@gmail.com']
      if (admin_emails.include? user.email)
        user.update_attribute :admin, true
      end
    end
end

class UsersController < ApplicationController
  

  def profile
    @user = User.find(params[:id])
    @record = Record.joins(:user).where(:user_id => 2).select('records.id, records.wins')
  end

  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success] = "Welcome to the betting pit!"
  		redirect_to user_url(@user)
  	else
  		render 'new'
  	end
  end

  private

  	def user_params
  		params.require(:user).permit(:name, :email, :password,
  			:password_confirmation)
  	end

end

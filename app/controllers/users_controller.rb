class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def profile
    @user = User.find(params[:id])
    @record = Record.where(user_id: @user.id)

  end

  def add_victory
    @recordid = Record.find_by_id(params[:id])
    @recordid.wins +=1
      if @recordid.save
        redirect_back(fallback_location: records_path)
     end
  end

  def add_loss
    @recordid = Record.find_by_id(params[:id])
    @recordid.losses +=1
      if @recordid.save
        redirect_back(fallback_location: records_path)
     end
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

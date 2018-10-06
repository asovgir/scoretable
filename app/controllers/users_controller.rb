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
    @record_category_id = @recordid.category_id
    @competitor_user_id = @recordid.competitor_user_id  
    @competitor_record_id = Record.where("user_id LIKE ? AND category_id LIKE ?", @competitor_user_id, @record_category_id).first
      # puts "Record Category identifier is " + @record_category_id.inspect
      # puts "Competitor User identifier is " + @competitor_user_id.inspect
      # puts "Competitor Record identifier is " + @competitor_record_id.inspect
      # puts "User id: " + @recordid.user_id.inspect
    
    @recordid.wins +=1

    if @competitor_record_id === nil
      # Create Competitor Record if it does not exist
      Record.create(:user_id =>  @competitor_user_id, :category_id => @recordid.category_id, 
          :competitor_user_id => @recordid.user_id, :wins => 0, :losses => 1)
      redirect_back(fallback_location: records_path)
    else 
      # Add loss to opponent
      @competitor_record_id.losses +=1 
      if @recordid.save & @competitor_record_id.save
        redirect_back(fallback_location: records_path)
      end
    end     
  end

  def add_loss
    @recordid = Record.find_by_id(params[:id])
    @record_category_id = @recordid.category_id
    @competitor_user_id = @recordid.competitor_user_id  
    @competitor_record_id = Record.where("user_id LIKE ? AND category_id LIKE ?", @competitor_user_id, @record_category_id).first
    
    @recordid.losses +=1

      if @competitor_record_id === nil
        # Create Competitor Record if it does not exist
        Record.create(:user_id =>  @competitor_user_id, :category_id => @recordid.category_id, 
          :competitor_user_id => @recordid.user_id, :wins => 1, :losses => 0)
        redirect_back(fallback_location: records_path)
      else
        # Add win to opponent
        @competitor_record_id.wins +=1 
        if @recordid.save & @competitor_record_id.save
          redirect_back(fallback_location: records_path)
        end
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

class RecordsController < ApplicationController
  before_action :set_record, only: [:show, :edit, :update, :destroy]


  # GET /records
  # GET /records.json
  def index
    @records = Record.all
  end

  # GET /records/1
  # GET /records/1.json
  def show
  end

  def leaderboard
    @records = Record.all.sort_by{ |i| i.user_id }
    @categories = Category.all.sort_by{ |i| i }
    @users = User.all
  end

  def add_victory
    @recordid = Record.where('user_id LIKE ? and category_id LIKE ?', params[:user_id], params[:category_id]).first    
    @recordid.wins +=1
      if @recordid.save
        redirect_back(fallback_location: records_path)
     end
  end

  def add_loss
    @recordid = Record.where('user_id LIKE ? and category_id LIKE ?', params[:user_id], params[:category_id]).first    
    @recordid.losses +=1
      if @recordid.save
        redirect_back(fallback_location: records_path)
     end
  end

  # GET /records/new
  def new
    @record = Record.new
    @categories = Category.all
    @users = User.all
  end

  # GET /records/1/edit
  def edit
    @categories = Category.all
    @users = User.all
  end

  # POST /records
  # POST /records.json
  def create
    @record = Record.new(record_params)

    respond_to do |format|
      if @record.save
        format.html { redirect_to @record, notice: 'Record was successfully created.' }
        format.json { render :show, status: :created, location: @record }
      else
        format.html { render :new }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /records/1
  # PATCH/PUT /records/1.json
  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to @record, notice: 'Record was successfully updated.' }
        format.json { render :show, status: :ok, location: @record }
      else
        format.html { render :edit }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    @record.destroy
    respond_to do |format|
      format.html { redirect_to records_url, notice: 'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = Record.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def record_params
      params.require(:record).permit(:wins, :losses, :user_id, :category_id)
    end

end

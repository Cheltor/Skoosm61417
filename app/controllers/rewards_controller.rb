class RewardsController < ApplicationController
  before_action :set_reward, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_business!, :except => [:index, :show]
  before_action :authorized_business, only: [:edit, :update]

  # GET /rewards
  # GET /rewards.json
  def index
    @rewards = Reward.all.paginate(page: params[:page], per_page: 7)
  end

  # GET /myrewards
  def myrewards
    @rewards = Reward.all.where(business: current_business).order("created_at DESC").paginate(page: params[:page], per_page: 7)
  end

  # GET /rewards/1
  # GET /rewards/1.json
  def show
  end

  # GET /rewards/new
  def new
    @reward = current_business.rewards.build
  end

  # GET /rewards/1/edit
  def edit
  end

  # POST /rewards
  # POST /rewards.json
  def create
    @reward = current_business.rewards.build(reward_params)
    @reward.business = current_business

    respond_to do |format|
      if @reward.save
        format.html { redirect_to @reward, notice: 'Reward was successfully created.' }
        format.json { render :show, status: :created, location: @reward }
      else
        format.html { render :new }
        format.json { render json: @reward.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rewards/1
  # PATCH/PUT /rewards/1.json
  def update
    respond_to do |format|
      if @reward.update(reward_params)
        format.html { redirect_to @reward, notice: 'Reward was successfully updated.' }
        format.json { render :show, status: :ok, location: @reward }
      else
        format.html { render :edit }
        format.json { render json: @reward.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rewards/1
  # DELETE /rewards/1.json
  def destroy
    @reward.destroy
    respond_to do |format|
      format.html { redirect_to rewards_url, notice: 'Reward was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reward
      @reward = Reward.find(params[:id])
    end

    def authorized_business
      @reward = current_business.rewards.find_by(id: params[:id])
      redirect_to rewards_path, notice: "Not authorized to edit this reward" if @reward.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reward_params
      params.require(:reward).permit(:name, :cost, :description)
    end
end

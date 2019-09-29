class FightersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_fighter, only: %i[show update]

  def index
    @fighters = Fighter.all.order('exp DESC')
    @battle = Battle.new
  end

  def show
    @all_equipments = Equipment.all
    @equipments = Equipment.can_handle(@fighter)
  end

  def new
    @fighter = Fighter.new
  end

  def create
    @fighter = Fighter.create(fighter_params)
    if @fighter.save
      redirect_to fighters_path
    else
      render :new
    end
  end

  def update
    @fighter.update(fighter_params)
    respond_to do |format|
      if @fighter.save
        format.html { redirect_to fighter_path(@fighter) }
        format.js
      else
        format.html { redirect_to fighters_path }
      end
    end
  end

  def destroy
  end

  private

  def set_fighter
    @fighter = Fighter.find(params[:id])
  end

  def fighter_params
    params.require(:fighter).permit(:name, :health, :attack, :left_hand_id, :right_hand_id)
  end
end

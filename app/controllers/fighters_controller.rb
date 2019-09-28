class FightersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_fighter, only: %i[show edit update]

  def index
    @fighters = Fighter.all
    @battle = Battle.new
  end

  def show
    @equipments = Equipment.all
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

  def edit
  end

  def update
    @fighter.update(fighter_params)
    if @fighter.save
      redirect_to fighter_path(@fighter)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def set_fighter
    @fighter = Fighter.find(params[:id])
  end

  def fighter_params
    params.require(:fighter).permit(:name, :health, :attack)
  end
end

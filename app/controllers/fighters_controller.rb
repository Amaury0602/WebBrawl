class FightersController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @fighters = Fighter.all
  end

  def show
    @fighter = Fighter.find(params[:id])
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
    @fighter = Fighter.find(params[:id])
  end

  def update
    @fighter = Fighter.find(params[:id])
    @fighter.update(fighter_params)
    if @fighter.save
      redirect_to fighter_path(@fighter)
    else
      render :edit
    end
  end

  def destroy
  end

  def fighter_params
    params.require(:fighter).permit(:name, :health, :attack)
  end
end

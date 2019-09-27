class BattlesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @battles = Battle.where(completed: true)
  end

  def show
    @battle = Battle.find(params[:id])
  end

  def create
    if battle_params
      @battle = Battle.create(battle_params)
      @battle.winner_id = @battle.your_fighter_id # THIS NEEDS TO CHANGE
      if @battle.save
        redirect_to battle_path(@battle)
      else
        redirect_to fighters_path
      end
    else
      redirect_to fighters_path
    end
  end

  def update
    raise
    @battle = Battle.find(params[:id])
    if params["battle"]["winner_id"]
      @battle.winner_id = params["battle"]["winner_id"]
      @battle.completed = true
      @battle.save
      redirect_to result_battle_path(@battle)
    else
      redirect_to fighters_path
    end
  end

  def result
    @battle = Battle.find(params[:id])
  end

  def battle_params
    params.require(:battle).permit(:enemy_fighter_id, :your_fighter_id, :winner_id)
  end
end

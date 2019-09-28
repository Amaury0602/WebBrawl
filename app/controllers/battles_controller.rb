class BattlesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_battle, only: %i[create new]

  def index
    @battles = Battle.all
  end

  def new
  end

  def create
    @battle.winner_id = params["battle"]["winner_id"]
    @battle.save
    redirect_to result_battle_path(@battle)
  end

  def result
    @battle = Battle.find(params[:id])
  end

  private

  def set_battle
    @battle = Battle.new
    @battle.enemy_fighter_id = params["battle"]["enemy_fighter_id"]
    @battle.your_fighter_id = params["battle"]["your_fighter_id"]
  end

  def battle_params
    params.require(:battle).permit(:enemy_fighter_id, :your_fighter_id, :winner_id)
  end
end

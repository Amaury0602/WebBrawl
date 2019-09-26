class BattlesController < ApplicationController
  skip_before_action :authenticate_user!

  def show

  end

  def create
    raise
    @battle = Battle.new
    # if @battle.save
    # redirect
  end


  def battle_params
    params.require(:battle).permit(:enemy_fighter_id, :your_fighter_id, :winner_id)
  end
end

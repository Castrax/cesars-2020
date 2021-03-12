class WinnersController < ApplicationController
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  def show
    @winner = Winner.find(params[:id])
    @users = User.all
  end
end

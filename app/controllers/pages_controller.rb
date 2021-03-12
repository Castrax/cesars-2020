class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @home_page = true
    @category = Category.first
    @winner = Winner.first
  end

  def resultats
    @users = User.all
    @categories = Category.all
    @winners_blank = Winner.where(nominee_id: nil, category_id: nil).all?
    @winners_not_blank = Winner.where.not(nominee_id: nil, category_id: nil).any?
    @all_winners = Winner.where.not(nominee_id: nil, category_id: nil).all?
  end
end

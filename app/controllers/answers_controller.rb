class AnswersController < ApplicationController
  def create
    @category = Category.find(params[:category_id])
    @nominee = Nominee.find(params[:nominee_id])
    @user = current_user
    @answer = Answer.new(category_id: @category.id, nominee_id: @nominee.id, user_id: @user.id)
    if @answer.save!
      redirect_to answer_voted_path(@answer)
      authorize @answer
    else
      render 'categories/show'
    end
  end

  def self.update
    Answer.all.each do |a|
      a.update(points_earned: 50)
    end
  end

  def voted
    @answer = Answer.find(params[:answer_id])
    @nominee = @answer.nominee
    authorize @answer
  end

  def destroy
    @answer = Answer.find(params[:id])
    @category = @answer.category
    if @answer.destroy
      redirect_to category_path(@category)
      authorize @answer
    else
      render 'categories/show'
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:category_id, :nominee_id, :user_id)
  end
end

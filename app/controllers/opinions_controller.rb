class OpinionsController < ApplicationController
  before_action :require_user

  def index
    @opinion = Opinion.new
  	@opinions = Opinion.order_by_most_recent
  end

  def create
  	@opinion = current_user.opinions.build(opinion_params)
  	if @opinion.save
  	  flash[:notice] = 'Opinion was created successfully'
      redirect_to root_path
  	else
  	  flash.now[:alert] = 'Something went wrong...'
  	end
  end

  private

  def opinion_params
    params.require(:opinion).permit(:text)
  end
end

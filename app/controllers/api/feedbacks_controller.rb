module Api
  class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show, :artists, :stations, :update]
  before_action :set_promoter, only: [:index, :show, :artists, :stations, :update]
  respond_to :json
  before_action :promoter_logged_in?, only: [:index, :update, :show]
  before_action :station_logged_in?, only: [:create]

  def index
    if session[:user_id] == @promoter.id
      @feedbacks = @promoter.all_unresponded_feedback
      respond_with :api, @feedbacks
    else
      redirect_to root_url, notice: "No access to review this feedback"
    end
  end

  def show
    if session[:user_id] == @promoter.id && @promoter.id == @feedback.promoter.id
      respond_with :api, @feedback
    else
      redirect_to root_url, notice: "No access to review this feedback"
    end
  end

  def create
      Feedback.create(comment: params[:comment], request: params[:request], station_id: session[:user_id], artist_id: params[:artist_id], reviewed: false, responded: false)
      respond_with :api, @feedback
  end

  def update
    if session[:user_id] == @feedback.promoter.id
      @feedback.update!(request: params[:request], reviewed: params[:reviewed], responded: params[:responded])
      respond_with :api, @feedback
    else
      redirect_to root_url, notice: "No access to review this artist feedback."
    end
  end

  private
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    def set_promoter
      @promoter = Promoter.find(params[:promoter_id])
    end

    def feedback_params
      params.require(:promoter).permit(:comment, :request, :artist_id, :station_id, :reviewed, :responded)
    end
  end
end

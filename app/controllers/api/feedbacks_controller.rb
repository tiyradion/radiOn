module Api
  class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show, :artists, :stations, :update]
  before_action :set_promoter, only: [:index, :show, :artists, :stations, :update]
  respond_to :json
  before_action :promoter_logged_in?, only: [:index, :update, :show]
  before_action :station_logged_in?, only: [:create]

  def index
    if session[:user_id] == @promoter.id
      if params[:station_id].present? == true
        all_feedbacks = @promoter.all_unresponded_feedback
        @feedbacks = all_feedbacks.select {|f| f.station_id == params[:station_id].to_i}
      else
        @feedbacks = @promoter.all_unresponded_feedback
      end
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
    # byebug
      @feedback = Feedback.new(feedback_params)
      @feedback.update(station_id: session[:user_id], artist_id: params[:artist_id], reviewed: false, responded: false)
      if @feedback.save
        respond_with :api, @artist
      end
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
      params.require(:feedback).permit(:comment, :request, :artist_id, :station_id, :reviewed, :responded)
    end
  end
end

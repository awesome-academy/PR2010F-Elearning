class LikesController < ApplicationController
  before_action :logged_in_user, only: [:destroy,:create]
  before_action :find_course
  def create
    @like = Like.new(like_params)
    if @like.save
      respond_to do |format|
        format.html { redirect_to @course }
        format.js
      end
    else
      @like= Like.new
    end
  end

  def destroy
    @like = Like.find_by id:(params[:id])
    @like.destroy
    respond_to do |format|
      format.html { redirect_to @course }
      format.js
    end
  end

  private
  def like_params
    params.require(:like).permit(:course_id, :student_id)
  end
  def find_course
    @course = Course.find_by id:(params[:course_id])
  end
end

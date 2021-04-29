class TestsController < ApplicationController
  before_action :find_test, only: [:show]
  before_action :logged_in_user, only: [:new,:create]
  def new
    @test = Test.new
    @results = @test.results.build
    @course = Course.find_by id: (params[:course_id])
  end

  def show
    @course = @test.course
    @results = @test.results
  end

  def create
    i = 0
    @test = current_student.tests.build test_params
    @test.results.each do |result|
      @test.mark = i
      if result.answer.present? && result.answer.correct?
          i = i + 1
          @test.mark = i
      end
    end
    if @test.save!
      Notification.create event: "You have a notice", student_id: current_student.id
      flash[:success] = "You can review the results in the report section"
      redirect_to current_student
    else
      render :new
    end
  end

  private
  def find_test
    @test = Test.find_by id: params[:id]
    unless @test.present?
      flash[:success] = "Test doesn't exist"
      redirect_to courses_url
    end
  end
  def test_params
    params.require(:test).permit(:course_id,:quantity,:student_id, results_attributes:[:question_id,:answer_id])
  end
end

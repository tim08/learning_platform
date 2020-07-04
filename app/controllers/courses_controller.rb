class CoursesController < ApplicationController
  before_action :set_course, only: [:show]
  def index
    @courses = Course.all_with_sort_by_start_date(params)
  end

  def show
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end
end

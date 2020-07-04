class CoursesController < ApplicationController
  before_action :set_course, only: [:show]
  def index
    @courses = Course.includes(:training_groups).all
  end

  def show
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end
end

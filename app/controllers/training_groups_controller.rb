class TrainingGroupsController < ApplicationController
  before_action :set_training_group
  def add_new_student
  end

  def join
    if @training_group.join_student(training_group_params[:email])
      redirect_to course_path(@training_group.course), notice: "Student join."
    else
      render :add_new_student
    end
  end

  private

  def set_training_group
    @training_group = TrainingGroup.find(params[:id])
  end

  def training_group_params
    params.require(:training_group).permit(:email)
  end
end

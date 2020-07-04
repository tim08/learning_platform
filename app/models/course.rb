class Course < ApplicationRecord
  has_many :training_groups
  validates :name, presence: true, uniqueness: true

  def nearest_training
    training_groups.active_and_order_by_start_date.take
  end

  def nearest_training_date
    nearest_training.try(:start_date)
  end

  def nearest_training_students_number
    if nearest_training.present?
      nearest_training.students.count
    end
  end

  def self.all_with_sort_by_start_date(params)
    params[:sort_by_nearest_start_date].present? ?
        Course.includes(:training_groups).joins(:training_groups).merge(TrainingGroup.active_and_order_by_start_date).uniq :
        Course.includes(:training_groups).all
  end
end

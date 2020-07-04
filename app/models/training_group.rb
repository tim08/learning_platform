class TrainingGroup < ApplicationRecord
  belongs_to :course
  has_and_belongs_to_many :students
  default_scope { includes(:students) }
  validates_presence_of :course
  validates :start_date, :end_date, presence: true
  validate :start_date_greater_than_today
  validate :end_date_after_start_date

  scope :active_and_order_by_start_date, -> { where("start_date >=?", Date.current).order(start_date: :asc) }

  def dates
    "#{start_date} #{end_date}"
  end

  def join_student(email)
    # TODO: mb collection.create(attributes = {})?
    student = Student.find_or_create_by(email: email)
    if student.invalid?
      student.errors.full_messages.each do |message|
        errors.add(:student, message)
      end
      return false
    end

    if students.include?(student)
      errors.add(:student, "with email #{email} already joined")
      false
    else
      students << student
    end
  end

  private

  def start_date_greater_than_today
    return if start_date.blank?
    if start_date < Date.current
      errors.add(:start_date, "must be today or later")
    end
  end

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?
    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end

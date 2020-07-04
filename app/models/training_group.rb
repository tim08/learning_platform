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
    # может ли студент записываться в группу если он уже записн в другую группу которая пересекается с текущей?
    student = Student.find_or_create_by(email: email)
    if student.invalid?
      student.errors.full_messages.each do |message|
        errors.add(:student, message)
      end
      return false
    end

    # может ли студент записываться в группу которая уже идет?
    if start_date < Date.current
      # если курс ещё идет или уже закончился
      if end_date >= Date.current
        # если по требованиям можно записаться в группу которая уже идет убираем это условие
        errors.add(self.class.to_s, "is already on")
        return false
      else
        # в группу что уже закончилась точно нельзя записаться
        # TODO: убрать кнокпу записи на фронте
        errors.add(self.class.to_s, "is already over")
        return false
      end
    end

    # уже записан
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

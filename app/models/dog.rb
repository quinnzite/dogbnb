class Dog < ApplicationRecord
  belongs_to :user
  has_many :fosterings, dependent: :destroy
  has_many :reviews, through: :fosterings
  validates :name, :breed, :location, :age, :description, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  mount_uploader :photo, PhotoUploader

  def next_dog
    # search for all the dogs with the id bigger than the actual dog one and give me the first dog
    @dog = Dog.where("id > ?", id).first
  end

  def previous_dog
    @dog = Dog.where("id < ?", id).last
  end

  def unavailable_dates
    fosterings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end

  def first_available_date
    all_fosterings = []

    fosterings.pluck(:start_date, :end_date).map do |range|
      all_fosterings << [range[0], range[1]]
    end

    return Date.today if all_fosterings.empty?

    x = 0

    while x < all_fosterings.length
      previous_end_date_next_day = all_fosterings.sort[x][1] + 1
      if x + 1 < all_fosterings.length
        next_start_date = all_fosterings.sort[x + 1][0]
        if previous_end_date_next_day < next_start_date
          return previous_end_date_next_day
        elsif x == all_fosterings.length
          return previous_end_date_next_day
        else
          x += 1
        end
      else
        return previous_end_date_next_day
      end
    end
  end

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end

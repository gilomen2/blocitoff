class Item < ActiveRecord::Base
  belongs_to :user

  validates :name, length: { minimum: 1 }, presence: true

  def days_left
    7 - (Time.zone.now.to_date - created_at.to_date).to_i
  end
end

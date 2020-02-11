class Customer < ApplicationRecord
  has_many :students
  accepts_nested_attributes_for :students, reject_if: :all_blank

  validates :name, presence: true
  validates :furigana, presence: true
end

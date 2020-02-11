class Student < ApplicationRecord
  belongs_to :customer

  validates :name, presence: true
  validates :furigana, presence: true

  #validates_presence_of :customer
end

class Corgi < ApplicationRecord
  validates :name, presence: true
  has_many :toys
end

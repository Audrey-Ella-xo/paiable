class Task < ApplicationRecord
  belongs_to :user

  has_many :taskings
  has_many :projects, -> { distinct }, through: :taskings, dependent: :destroy
  before_save { self.name = name.humanize }
  validates :name, presence: true, case_sensitive: false
  validates :activity, presence: true
end

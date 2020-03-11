# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :groupings
  has_many :projects, -> { distinct }, through: :groupings, dependent: :destroy
  before_save { self.name = name.humanize }
  mount_uploader :icon, PictureUploader
  validates :name, presence: true, case_sensitive: false 
  validate :icon_size

  private

  # Validates the size of an uploaded picture.
  def icon_size
    errors.add(:icon, 'should be less than 5MB') if icon.size > 5.megabytes
  end
end

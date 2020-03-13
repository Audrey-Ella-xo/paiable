# frozen_string_literal: true

class User < ApplicationRecord
  has_many :projects, foreign_key: :author_id, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :tasks, dependent: :destroy
  mount_uploader :picture, PictureUploader
  validates :username, presence: true, length: { maximum: 12 }, uniqueness: { case_sensitive: false }
  validates :name, presence: true
  validates :lastname, presence: true
  validates :password, presence: true, length: { maximum: 6 }
  validate :picture_size

  private

  # Validates the size of an uploaded picture.
  def picture_size
    errors.add(:picture, 'should be less than 5MB') if picture.size > 5.megabytes
  end
end

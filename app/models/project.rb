# frozen_string_literal: true

class Project < ApplicationRecord
  default_scope { order(created_at: :desc) }
  belongs_to :author, class_name: 'User'
  has_many :groupings
  has_many :groups, -> { distinct }, through: :groupings
  has_many :taskings
  has_many :tasks, -> { distinct }, through: :taskings, dependent: :destroy
  validates :name, presence: true
  validates :worked_hours, presence: true

  scope :with_grouping, -> { joins(:groupings).distinct }
  scope :without_grouping, -> { includes(:groupings).where(groupings: { group_id: nil } )}
end

# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :groupings
  has_many :groups, -> { distinct }, through: :groupings
  validates :name, presence: true
  validates :worked_hours, presence: true
end

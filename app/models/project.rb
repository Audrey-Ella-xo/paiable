# frozen_string_literal: true

class Project < ApplicationRecord
    belongs_to :author, class_name: 'User', foreign_key: 'user_id'
    validates :name, presence: true
    validates :worked_hours, presence: true
end

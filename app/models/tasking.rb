# frozen_string_literal: true

class Tasking < ApplicationRecord
  belongs_to :task
  belongs_to :project
end

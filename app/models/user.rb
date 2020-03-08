# frozen_string_literal: true

class User < ApplicationRecord
    validates :username, presence: true, length: { maximum: 12 }, uniqueness: { case_sensitive: false }
    validates :firstname, presence: true
    validates :lastname, presence: true
    validates :password, presence: true, length: { maximum: 6 }
end

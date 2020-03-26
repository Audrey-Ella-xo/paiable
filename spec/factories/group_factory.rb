# frozen_string_literal: true

FactoryBot.define do
  factory :group do
    name { 'Test Group' }
    icon { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/app/assets/images/chibi.jpeg'))) }
  end
end

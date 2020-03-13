# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Group, type: :model do
  context 'Validation tests' do
    subject { Group.new }

    # it 'valid with valid attributes' do
    #   subject.name = 'Any name'
    #   subject.icon = fixture_file_upload('test/fixtures/rails.png', 'image/png')
    #   expect(subject).to be_valid
    # end

    it 'not valid without a name' do
      subject.name = 'Any last name'
      expect(subject).to_not be_valid
    end

    it 'not valid without an icon' do
      subject.icon = fixture_file_upload('test/fixtures/rails.png', 'image/png')
      expect(subject).to_not be_valid
    end

    it 'not valid without valid attributes' do
      expect(subject).to_not be_valid
    end

    it 'creates a group' do
      expect { Group.create(name: 'Chifumnanya', lastname: 'Peña') }.not_to raise_error
    end

    it 'expects groupname to not be too long' do
      subject.groupname = 'a' * 15
      expect(subject).to_not be_valid
    end

    it 'expects password to not be too long' do
      subject.password = 'a' * 8
      expect(subject).to_not be_valid
    end
  end
end

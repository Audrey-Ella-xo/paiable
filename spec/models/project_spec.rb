# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Project, type: :model do
  context 'Validation tests' do
    subject { Project.new }
    let(:user) { User.create(username: 'Maru', name: 'maria', lastname: 'Odiaka', password: 'foobar') }

    it 'valid with valid attributes' do
      subject.worked_hours = 200
      subject.name = 'Any name'
      subject.author_id = user.id
      expect(subject).to be_valid
    end

    it 'not valid without a name' do
      subject.worked_hours = 567
      expect(subject).to_not be_valid
    end

    it 'not valid without an worked_hours' do
      subject.name = 'Any name'
      expect(subject).to_not be_valid
    end

    it 'not valid without valid attributes' do
      expect(subject).to_not be_valid
    end

    it 'creates a project' do
      expect { Project.create(name: 'Chifumnanya', worked_hours: 667) }.not_to raise_error
    end
  end
end

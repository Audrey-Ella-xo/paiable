# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  context 'Validation tests' do
    subject { Task.new }
    let(:user) { User.create(username: 'Maru', name: 'maria', lastname: 'Odiaka', password: 'foobar') }

    it 'valid with valid attributes' do
      subject.activity = 'Anonimous'
      subject.name = 'Any name'
      subject.user_id = user.id
      expect(subject).to be_valid
    end

    it 'not valid without a name' do
      subject.activity = 'Any last name'
      expect(subject).to_not be_valid
    end

    it 'not valid without an activity' do
      subject.name = 'Any name'
      expect(subject).to_not be_valid
    end

    it 'not valid without valid attributes' do
      expect(subject).to_not be_valid
    end

    it 'creates a task' do
      expect { Task.create(name: 'Chifumnanya', activity: 'Peña') }.not_to raise_error
    end
  end
end

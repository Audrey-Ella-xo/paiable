# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validation tests' do
    subject { User.new }

    it 'valid with valid attributes' do
      subject.username = 'Anonimous'
      subject.firstname = 'Any name'
      subject.lastname = 'Any last name'
      subject.password = 'foobar'
      expect(subject).to be_valid
    end

    it 'not valid without a name' do
      subject.lastname = 'Any last name'
      expect(subject).to_not be_valid
    end

    it 'not valid without a last name' do
      subject.username = 'Any name'
      expect(subject).to_not be_valid
    end

    it 'not valid without valid attributes' do
      expect(subject).to_not be_valid
    end

    it 'creates a user' do
      expect { User.create(firstname: 'Chifumnanya', lastname: 'Peña') }.not_to raise_error
    end

    it "expects username to not be too long" do
      subject.username = 'a'* 15
      expect(subject).to_not be_valid
    end

    it "expects password to not be too long" do
      subject.password = 'a'* 8
      expect(subject).to_not be_valid
    end
  end
end

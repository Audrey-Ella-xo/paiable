# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validation tests' do
    subject { User.new }

    it 'valid with valid attributes' do
      subject.username = 'Anonimous'
      subject.name = 'Any name'
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
      expect { User.create(name: 'Chifumnanya', lastname: 'Peña') }.not_to raise_error
    end

    it 'expects username to not be too long' do
      subject.username = 'a' * 15
      expect(subject).to_not be_valid
    end

    it 'expects name to not be too long' do
      subject.name = 'a' * 20
      expect(subject).to_not be_valid
    end

    it 'expects lastname to not be too long' do
      subject.lastname = 'a' * 20
      expect(subject).to_not be_valid
    end

    it 'expects password to not be too long' do
      subject.password = 'a' * 8
      expect(subject).to_not be_valid
    end

    it 'creates a user' do
      expect { User.create(username: 'maria', name: 'Chifumnanya', lastname: 'Peña', password: '123456') }.not_to raise_error
    end

    it 'adds a new user' do
      count = User.count
      subject.update(username: 'maria', name: 'Chifumnanya', lastname: 'Peña', password: '123456')
      expect(User.count).to eq(count + 1)
    end
  end

  context 'Associations tests' do
    let(:user) { User.create(username: 'maria', name: 'Chifumnanya', lastname: 'Peña', password: '123456') }
    let(:group) {Group.create(name: 'Test Group',
                                       icon: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root,
                                                                                              '/app/assets/images/chibi.jpeg'))), user_id: user.id)}
    let(:project) { Project.create(name: 'party', worked_hours: 120, author_id: user.id) }
    let(:task) { Task.create(name: 'party', activity: 'Activity', user_id: user.id) }

    it 'has many groups' do
      expect(user.respond_to?(:groups)).to be_truthy
      expect(user.groups).to include(group)
    end

    it 'has many projects' do
      expect(user.respond_to?(:projects)).to be_truthy
      expect(user.projects).to include(project)
    end

    it 'has many tasks' do
      expect(user.respond_to?(:tasks)).to be_truthy
      expect(user.tasks).to include(task)
    end
  end
end

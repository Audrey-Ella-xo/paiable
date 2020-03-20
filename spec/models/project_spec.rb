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

  context 'Associations tests' do
    let(:user) { User.create(username: 'maria', name: 'Chifumnanya', lastname: 'Peña', password: '123456') }
    let(:group) do
      Group.create(name: 'Test Group',
                   icon: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root,
                                                                          '/app/assets/images/chibi.jpeg'))),
                   user_id: user.id)
    end
    let(:task) { Task.create(name: 'party', activity: 'Activity', user_id: user.id) }
    let(:project) do
      Project.create(name: 'party',
                     worked_hours: 120,
                     author_id: user.id,
                     groups: [group],
                     tasks: [task])
    end

    it 'has many groups' do
      expect(project.respond_to?(:groups)).to be_truthy
      expect(project.groups).to include(group)
    end

    it 'has many tasks' do
      expect(project.respond_to?(:tasks)).to be_truthy
      expect(project.tasks).to include(task)
    end
  end
end

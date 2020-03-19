require 'rails_helper'

RSpec.describe Group, type: :model do
	context 'validations' do
		before(:all) do
				@user = create(:user)
				@group = @user.groups.build(name: 'Test Group',
																				icon: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root,
																																																'/app/assets/images/chibi.jpeg'))))
		end

		it 'valid with valid attributes' do
				expect(@group).to be_valid
		end
	end
  context 'Associations tests' do
    let(:user) { User.create(username: 'maria', name: 'Chifumnanya', lastname: 'Peña', password: '123456') }
    let(:project) { Project.create(name: 'party', worked_hours: 120, author_id: user.id ) }
    let(:group) {Group.create(name: 'Test Group',
                                       icon: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root,
                                                                                              '/app/assets/images/chibi.jpeg'))), user_id: user.id,  projects: [project] )}

    it 'has many projects' do
      expect(group.respond_to?(:projects)).to be_truthy
      expect(group.projects).to include(project)
    end
  end
end
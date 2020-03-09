# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
 
  describe 'GET #index' do
    it 'returns http success' do
      get :index, params: { project.nameuser.project}
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #edit' do
    it 'returns http success' do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end
end

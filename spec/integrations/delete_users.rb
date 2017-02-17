require 'spec_helper'

describe 'delete users' do
  let(:user_ids) { [1] }

  subject(:delete_users) do
    api.delete_users(external_ids: user_ids)
  end

  context 'with success', vcr: true do
    it 'responds with success' do
      expect(delete_users.status).to be 201
    end

    it 'responds with success message' do
      expect(JSON.parse(delete_users.body)).to eq(
          'deleted' => 1,
          'message' => 'success'
        )
    end
  end

  context 'unauthorized', vcr: true do
    let(:app_group_id) { 'non-existent' }

    it 'responds with unauthorized' do
      expect(delete_users.status).to be 401
    end
  end
end

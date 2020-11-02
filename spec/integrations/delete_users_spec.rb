require 'spec_helper'

describe 'delete users' do
  let(:external_ids) { build(:external_ids) }

  subject(:delete_users) do
    api.delete_users(external_ids)
  end

  context 'with success', vcr: true do
    it 'responds with created' do
      expect(delete_users.status).to be 201
    end

    it 'responds with success message' do
      expect(JSON.parse(delete_users.body)).to eq(
          'deleted' => 2,
          'message' => 'success'
        )
    end
  end

  context 'unauthorized', vcr: true do
    let(:api_key) { 'non-existent' }

    it 'responds with unauthorized' do
      expect(delete_users.status).to be 401
    end
  end
end

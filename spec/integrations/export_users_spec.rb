require 'spec_helper'

describe 'export users' do
  subject(:export_users) do
    api.export_users(external_ids: [1])
  end

  context 'with success', vcr: true do
    it 'responds with a user object' do
      expect(export_users.first).to be_an_instance_of(Appboy::Resource::User)
    end
  end

  context 'unauthorized' do

  end
end

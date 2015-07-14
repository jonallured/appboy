require 'spec_helper'

describe 'send messages' do
  let(:user_ids) { [1] }
  let(:messages) { build(:messages) }

  subject(:send_messages) do
    api.send_messages(messages: messages, external_user_ids: user_ids)
  end

  context 'with success', vcr: true do
    it 'responds with success message' do
      expect(send_messages).to eq(
          'message' => 'success'
        )
    end
  end

  context 'unauthorized', vcr: true do
    let(:app_group_id) { 'non-existent' }

    it 'responds with unauthorized' do
      expect(send_messages["message"]).to eq("Invalid or missing App Group API Identifier: non-existent")
    end
  end
end

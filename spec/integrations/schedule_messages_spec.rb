require 'spec_helper'

describe 'schedule messages' do
  let(:user_ids) { [1] }
  let(:messages) { build(:messages) }

  subject(:schedule_messages) do
    api.schedule_messages(send_at: test_time,
      messages: messages, segment_id: segment_id)
  end

  context 'with success', vcr: true do
    it 'responds with success message' do
      expect(schedule_messages).to eq(
          'message' => 'success'
        )
    end
  end

  context 'unauthorized', vcr: true do
    let(:app_group_id) { 'non-existent' }

    it 'responds with unauthorize' do
      expect(schedule_messages["message"]).to eq("Invalid or missing App Group API Identifier: non-existent")
    end
  end
end

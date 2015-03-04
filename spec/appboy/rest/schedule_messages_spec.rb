require 'spec_helper'

describe Appboy::REST::ScheduleMessages do
  let(:payload) {{
    send_at: :send_at,
    segment_ids: [:segment_id],
    deliver_in_local_timezone: :local_timezone,
    messages: :messages
  }}

  it 'makes an http call to the schedule messages endpoint' do
    expect(http).to receive(:post).with *arguments

    subject.perform send_at: :send_at, segment_id: :segment_id,
      local_timezone: :local_timezone, messages: :messages
  end

  def arguments
    ['/messages/schedule', payload.merge({ app_group_id: :app_group_id })]
  end
end

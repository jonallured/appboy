require 'spec_helper'

describe Appboy::REST::ScheduleMessages do
  let(:http) { double(:http) }

  let(:payload) {{
    time: :time,
    external_user_ids: [:external_user_ids],
    local_timezone: :local_timezone,
    messages: :messages
  }}

  let(:api_key) { :api_key }

  subject { described_class.new(api_key, payload) }

  before { subject.http = http }

  it 'makes an http call to the schedule messages endpoint' do
    expect_schedule_messages_http_call

    subject.perform
  end

  def expect_schedule_messages_http_call
    expect(http).to receive(:post).with '/messages/schedule/create', {
      external_user_ids: [:external_user_ids],
      schedule: {
        time: :time,
        in_local_time: :local_timezone
      },
      messages: :messages
    }
  end
end

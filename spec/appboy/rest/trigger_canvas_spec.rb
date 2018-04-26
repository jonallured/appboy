require 'spec_helper'

describe Appboy::REST::TriggerCanvas do
  let(:http) { double(:http) }

  let(:payload) do
    {
      audience: :audience,
      broadcast: :broadcast,
      canvas_id: :canvas_id,
      canvas_entry_properties: :canvas_entry_properties,
      recipients: :recipients
    }
  end

  let(:api_key) { :api_key }

  subject do
    described_class.new(
      api_key,
      audience: :audience,
      broadcast: :broadcast,
      canvas_id: :canvas_id,
      canvas_entry_properties: :canvas_entry_properties,
      recipients: :recipients
    )
  end

  before { subject.http = http }

  it 'makes an http call to the send messages endpoint' do
    expect_send_messages_http_call

    subject.perform
  end

  def expect_send_messages_http_call
    expect(http).to receive(:post).with '/canvas/trigger/send', {
      api_key: :api_key,
      audience: :audience,
      broadcast: :broadcast,
      canvas_id: :canvas_id,
      canvas_entry_properties: :canvas_entry_properties,
      recipients: :recipients
    }
  end
end

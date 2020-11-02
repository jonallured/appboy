require 'spec_helper'

describe Appboy::REST::TriggerCampaign do
  let(:http) { double(:http) }

  let(:payload) do
    {
      audience: :audience,
      broadcast: :broadcast,
      campaign_id: :campaign_id,
      recipients: :recipients,
      send_id: :send_id,
      trigger_properties: :trigger_properties
    }
  end

  let(:api_key) { :api_key }

  subject do
    described_class.new(
      api_key,
      audience: :audience,
      broadcast: :broadcast,
      campaign_id: :campaign_id,
      recipients: :recipients,
      send_id: :send_id,
      trigger_properties: :trigger_properties
    )
  end

  before { subject.http = http }

  it 'makes an http call to the send messages endpoint' do
    expect_send_messages_http_call

    subject.perform
  end

  def expect_send_messages_http_call
    expect(http).to receive(:post).with '/campaigns/trigger/send', {
      audience: :audience,
      broadcast: :broadcast,
      campaign_id: :campaign_id,
      recipients: :recipients,
      send_id: :send_id,
      trigger_properties: :trigger_properties
    }
  end
end

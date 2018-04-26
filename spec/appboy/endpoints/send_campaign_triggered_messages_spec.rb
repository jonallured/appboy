require 'spec_helper'
require 'appboy/endpoints/send_campaign_triggered_messages'

class API
  include Appboy::Endpoints::SendCampaignTriggeredMessages

  def app_group_id
    :api_key
  end
end

describe Appboy::Endpoints::SendCampaignTriggeredMessages do
  let(:api) { API.new }
  let(:performer) do
    instance_double "Appboy::REST::SendCampaignTriggeredMessages"
  end

  before do
    allow(api.send(:send_campaign_triggered_messages_service))
      .to receive(:new).and_return(performer)
    allow(performer).to receive(:perform).and_return true
  end

  describe '#send_campaign_triggered_messages_service', vcr: true do
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

    subject(:send_campaign_triggered_messages!) do
      api.send_campaign_triggered_messages(payload)
    end

    it 'sends a campaign message with recipients' do
      expect(api.send(:send_campaign_triggered_messages_service))
        .to receive(:new).with(:api_key, payload)

      send_campaign_triggered_messages!
    end
  end
end

require 'spec_helper'
require 'appboy/endpoints/trigger_campaign'

class API
  include Appboy::Endpoints::TriggerCampaign

  def api_key
    :api_key
  end
end

describe 'Appboy::Endpoints::TriggerCampaign' do
  let(:api) { API.new }
  let(:performer) do
    instance_double 'Appboy::REST::TriggerCampaign'
  end

  before do
    allow(api.send(:trigger_campaign_service))
      .to receive(:new).and_return(performer)
    allow(performer).to receive(:perform).and_return true
  end

  describe '#trigger_campaign_service', vcr: true do
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

    subject(:trigger_campaign!) do
      api.trigger_campaign(payload)
    end

    it 'sends a campaign message with recipients' do
      expect(api.send(:trigger_campaign_service))
        .to receive(:new).with(:api_key, payload)

      trigger_campaign!
    end
  end
end

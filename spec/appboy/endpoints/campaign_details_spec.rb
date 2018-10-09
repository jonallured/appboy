require 'spec_helper'

# Force autoload.
Appboy::API

class API
  include Appboy::Endpoints::CampaignDetails

  def app_group_id
    :app_group_id
  end
end

describe Appboy::Endpoints::CampaignDetails do
  let(:api) { API.new }
  let(:campaign_details_service) { double(:campaign_details_service) }

  before { expect(api).to receive(:campaign_details_service).and_return(campaign_details_service) }

  describe '#campaign_details_service' do
    let(:payload) {{
      campaign_id: 1,
    }}

    subject(:campaign_details!) { api.campaign_details(payload) }

    it 'triggers campaign' do
      expect(campaign_details_service).to receive(:perform).with(:app_group_id, payload)

      campaign_details!
    end
  end
end

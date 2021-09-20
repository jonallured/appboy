require 'spec_helper'

describe 'list canvas' do
  subject(:list_canvas) { api.list_canvas }

  let(:expected_response) { {"canvases" => [{"id"=>"2f28a304-d5bf-4032-a90f-03385d1b0330", "last_edited"=>"2017-09-05T20:57:55+00:00", "name"=>"ONBOARDING_NEW SUBSCRIBERS", "tags"=>[]}, {"id"=>"eb7e3341-4734-4cc0-ae39-942e564c0c55", "last_edited"=>"2017-09-05T20:58:34+00:00", "name"=>"ONBOARDING_COI", "tags"=>[]}, {"id"=>"d8bd2da6-d3ee-4a56-aa26-9c88e7f59cd8", "last_edited"=>"2017-09-05T21:14:17+00:00", "name"=>"RESUBSCRIBERS", "tags"=>[]}, {"id"=>"c27f07fa-d3e7-8b57-fc7c-bfdbb5e0fb34", "last_edited"=>"2020-10-12T14:01:46+00:00", "name"=>"NEWSLETTER_DAILY_StagingTest", "tags"=>[]}], "message" => "success"} }

  context 'with success', :vcr do
    it 'responds with success' do
      expect(list_canvas).to eq expected_response
    end

    it 'responds with a list of segments' do
      expect(canvases.count).to be 4

      expect(canvases.first['name']).to eq 'ONBOARDING_NEW SUBSCRIBERS'
    end

    def canvases
      list_canvas['canvases']
    end
  end
end

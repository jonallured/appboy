require 'spec_helper'

describe Appboy::REST::DeleteUsers do
  let(:http) { double(:http) }

  let(:payload) {{
    external_ids: :external_ids,
    appboy_ids: :appboy_ids
  }}

  let(:api_key) { :api_key }

  subject { described_class.new(:api_key, external_ids: :external_ids, appboy_ids: :appboy_ids) }

  before { subject.http = http }

  it 'makes an http call to the track user endpoint' do
    expect(http).to receive(:post).with '/users/delete',
        payload

    subject.perform
  end
end

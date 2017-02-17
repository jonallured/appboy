require 'spec_helper'

describe Appboy::REST::DeleteUsers do
  let(:http) { double(:http) }

  let(:payload) {{
    external_ids: :external_ids,
    appboy_ids: :appboy_ids
  }}

  let(:app_group_id) { :app_group_id }

  subject { described_class.new(app_group_id,
    external_ids: :external_ids,
    appboy_ids: :appboy_ids
  ) }

  before { subject.http = http }

  it 'makes an http call to the delete users endpoint' do
    expect_delete_users_http_call

    subject.perform
  end

  def expect_delete_users_http_call
    expect(http).to receive(:post).with '/users/delete', {
      app_group_id: :app_group_id,
      external_ids: :external_ids,
      appboy_ids: :appboy_ids
    }
  end
end

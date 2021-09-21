require 'spec_helper'

describe Appboy::REST::EmailBounceRemove do
  let(:http) { double(:http) }

  let :payload do
    {
      app_group_id: :app_group_id,
      email: :email,
    }
  end

  let(:app_group_id) { :app_group_id }

  subject do
    described_class.new(:app_group_id, email: :email)
  end

  before { subject.http = http }

  it 'makes an HTTP call to the email bounce remove endpoint' do
    expect(http).to receive(:post).with('/email/bounce/remove', payload)

    subject.perform
  end
end

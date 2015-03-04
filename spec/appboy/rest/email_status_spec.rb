require 'spec_helper'

describe Appboy::REST::EmailStatus do
  let(:payload) {{ email: :email, subscription_state: :status }}

  it 'makes an http call to the email status endpoint' do
    expect(http).to receive(:post).with *arguments

    subject.perform email: :email, status: :status
  end

  def arguments
    ['/email/status', payload.merge({ app_group_id: :app_group_id })]
  end
end

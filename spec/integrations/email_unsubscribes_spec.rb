require 'spec_helper'

describe 'email unsubscribes' do
  let(:email) { 'john@example.com' }

  subject do
    api.email_unsubscribes(email: email)
  end

  context 'existing email', vcr: true do
    it 'responds with success message' do
      expect(subject).to eq(
        'message' => 'success',
        'emails' => [],
      )
    end
  end

  context 'unknown email', vcr: true do
    let(:email) { 'doesntexist@example.com' }

    it 'responds with error message' do
      expect(subject).to eq(
        'message' => 'There is no user with the provided email'
      )
    end
  end
end

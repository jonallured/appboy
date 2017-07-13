require 'spec_helper'

describe 'email status' do
  let(:email) { 'john@example.com' }
  let(:status) { :unsubscribed }

  subject do
    api.email_status(email: email, status: status)
  end

  context 'existing email', vcr: true do
    it 'responds with success message' do
      expect(subject).to eq(
        'message' => 'success'
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

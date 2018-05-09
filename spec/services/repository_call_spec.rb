require 'rails_helper'

describe RepositoryCall do
  subject { RepositoryCall.new(stub_omniauth)}
  context 'initialize' do
    it 'exists with a valid user' do
      expect(subject).to be_a(RepositoryCall)
    end
  end
end

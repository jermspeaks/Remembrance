require "rails_helper"

RSpec.describe InviteMailer, :type => :mailer do
  pending "add some examples to (or delete) #{__FILE__}"
end

 
require 'spec_helper'
 
describe Notifier do
  describe 'instructions' do
    let(:user) { mock_model User, name: 'Lucas', email: 'lucas@email.com' }
    let(:mail) { Notifier.instructions(user) }
 
    it 'renders the subject' do
      expect(mail.subject).to eql('Instructions')
    end
 
    it 'renders the receiver email' do
      expect(mail.to).to eql([user.email])
    end
 
    it 'renders the sender email' do
      expect(mail.from).to eql(['noreply@company.com'])
    end
 
    it 'assigns @name' do
      expect(mail.body.encoded).to match(user.name)
    end
 
    it 'assigns @confirmation_url' do
      expect(mail.body.encoded).to match("http://aplication_url/#{user.id}/confirmation")
    end
  end
end
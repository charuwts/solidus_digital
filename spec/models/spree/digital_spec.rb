# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Spree::Digital do
  context 'validation' do
    it { is_expected.to belong_to(:variant) }
  end

  describe "#destroy" do
    it "destroys associated digital_links" do
      digital = create(:digital)
      3.times { digital.digital_links.create!(line_item: create(:line_item)) }
      expect(Spree::DigitalLink.count).to eq(3)
      expect {
        digital.destroy
      }.to change(Spree::DigitalLink, :count).by(-3)
    end
  end
end

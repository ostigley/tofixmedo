require "spec_helper"

RSpec.describe Tofixmedo do
  it "has a version number" do
    expect(Tofixmedo::VERSION).not_to be nil
  end

  describe "Scan" do

    describe '#new' do
      path = './'
      let(:scan) { Tofixmedo::Scan.new(path) }
      it 'returns a new scan instance' do
        expect(scan).to be_a Tofixmedo::Scan
      end
    end
  end


end

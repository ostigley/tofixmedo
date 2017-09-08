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

    context "A folder with 1 file with 5 TODOS" do
      scan = Tofixmedo::Scan.new("#{__dir__}/test_folders/folder_with_1_file")

      it 'calls scan_file method once' do
        expect(scan).to receive(:scan_file).once

        scan.begin
      end

      it '#scan writes something to stdout' do
        expect { scan.begin }.to output.to_stdout

        scan.begin
      end
    end
  end


end

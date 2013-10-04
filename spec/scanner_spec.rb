require 'spec_helper'

describe Lutra::Scanner do
  subject { described_class }

  context ".new" do
    it "with default tags" do
      expect(subject.new.tags).to eq ['TODO', 'FIXME', 'OPTIMIZE']
    end

    it "with custom tags" do
      expect(subject.new(['X']).tags).to eq ['X']
    end
  end

  context "#scan_file" do
    let(:notes) do
      subject.new.scan_file("#{File.dirname(__FILE__)}/example").notes
    end

    it "have todo, fixme and optimize" do
      expect(notes.map(&:tag)).to eq ['TODO', 'FIXME', 'OPTIMIZE']
    end
  end

  context "#scan" do
    let(:notes) { subject.new.scan(example_data).notes }

    it "have todo, fixme and optimize" do
      expect(notes.map(&:tag)).to eq ['TODO', 'FIXME', 'OPTIMIZE']
    end

    it "have only 3 items" do
      expect(notes.size).to eq 3
    end
  end
end

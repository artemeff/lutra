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

    it "with default comments" do
      expect(subject.new.comments).to eq ["#", "%", ";", "//", "--"]
    end

    it "with custom comments" do
      expect(subject.new(['X'], ['#']).comments).to eq ["#"]
    end
  end

  context "#scan_file" do
    let(:notes) do
      scanner = subject.new
      scanner.scan_file("#{File.dirname(__FILE__)}/example")
      scanner.notes
    end

    it "have todo, fixme and optimize" do
      expect(notes.map(&:tag)).to eq ['TODO', 'FIXME', 'OPTIMIZE']
    end
  end
end

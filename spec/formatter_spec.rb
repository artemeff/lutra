require 'spec_helper'

describe Lutra::Formatter do
  subject { described_class }

  context ".new" do
    it "have one formatter" do
      expect(subject.new.formatters.size).to eq(1)
    end

    it "have default formatter" do
      expect(subject.new.formatters.first[:name]).to eq(:default)
    end
  end

  context "#add" do
    it "adds new formatter" do
      expect(subject.new.add(:new, :n, Lutra::Formatters::Default).size).to eq(2)
    end
  end

  context "#get" do
    subject { described_class.new }

    it "finds formatter by name" do
      expect(subject.get(:default)[:name]).to eq(:default)
    end

    it "finds formatter short name" do
      expect(subject.get(:d)[:name]).to eq(:default)
    end
  end

  context "#set" do
    subject { described_class.new }

    it "sets default formatter" do
      subject.set(:default)
      expect(subject.current).to eq(:default)
    end

    it "raise error when formatter dont exist" do
      expect {
        subject.set(:poke)
      }.to raise_error(Lutra::FormatterNotFound)
    end
  end

  it "#print"
end

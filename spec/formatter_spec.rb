require 'spec_helper'

describe Lutra::Formatter do
  subject { described_class }

  it "throw exception" do
    expect {
      subject.new([]).print
    }.to raise_error(Lutra::NotImplementedError)
  end
end

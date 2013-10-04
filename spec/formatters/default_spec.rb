require 'spec_helper'

describe Lutra::DefaultFormatter do
  subject { described_class }

  it "works" do
    tags = ['tag', 'another tag']

    expect(subject.new(tags).print).to eq tags
  end
end

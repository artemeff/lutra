require 'spec_helper'

describe Lutra::Note do
  subject do
    described_class.new('X', 'text', 1, 'ex.rb')
  end

  it "#tag" do
    expect(subject.tag).to eq 'X'
  end

  it "#line" do
    expect(subject.line).to eq 1
  end

  it "#file" do
    expect(subject.file).to eq 'ex.rb'
  end

  it "#text" do
    expect(subject.text).to eq 'text'
  end
end

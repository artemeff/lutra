require 'spec_helper'

describe Lutra::Note do
  subject do
    raw = { tag: 'X', source: 'X text', line: 1, file: 'ex.rb' }
    described_class.new(raw)
  end

  it "#tag" do
    expect(subject.tag).to eq 'X'
  end

  it "#source" do
    expect(subject.source).to eq 'X text'
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

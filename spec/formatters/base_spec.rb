require 'spec_helper'

describe Lutra::Formatters::Base do
  subject { described_class }

  it ".new raise exception" do
    expect {
      subject.new([]).prepare
    }.to raise_error(Lutra::NotImplementedError)
  end
end

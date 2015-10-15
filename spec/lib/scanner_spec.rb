require 'benchmark'

describe Lutra::Scanner do
  context '.new' do
    subject { described_class }

    it 'default formatter' do
      expect(subject.new.formatter).to be_a(Lutra::Formatters::Default)
    end
  end

  context '#extract' do
    let(:path) { data_file('sample') }
    let(:file) { File.open(path) }
    let(:tags) { Lutra::TAGS }
    let(:comm) { Lutra::COMMENTS }

    subject { described_class.new.send(:extract, file, path, tags, comm) }

    it 'have todo, fixme and optimize' do
      expect(subject.map(&:tag)).to eq(['TODO', 'FIXME', 'OPTIMIZE'])
    end

    context 'with custom tags' do
      let(:tags) { ['TODO'] }

      it 'returns notes with only specified tag' do
        expect(subject.map(&:tag)).to eq(['TODO'])
      end
    end

    context 'with custom comments' do
      let(:comm) { ['#'] }

      it 'returns notes with only specified comments' do
        expect(subject.map(&:comment)).to eq(['#'])
      end
    end
  end
end

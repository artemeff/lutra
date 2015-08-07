require 'benchmark'

describe Lutra::Scanner do
  context '.new' do
    subject { described_class }

    it 'default tags' do
      expect(subject.new.tags).to eq(['TODO', 'FIXME', 'OPTIMIZE'])
    end

    it 'custom tags' do
      expect(subject.new(tags: ['X']).tags).to eq(['X'])
    end

    it 'default comments' do
      expect(subject.new.comments).to eq(['#', '%', ';', '//', '--'])
    end

    it 'custom comments' do
      expect(subject.new(comments: ['#']).comments).to eq(['#'])
    end
  end

  context '#scan_file' do
    let(:filename) { data_file('sample') }
    let(:notes)    { subject.notes }

    before { subject.scan_file(filename) }

    it 'have todo, fixme and optimize' do
      expect(notes.map(&:tag)).to eq(['TODO', 'FIXME', 'OPTIMIZE'])
    end

    context 'with custom tags' do
      subject { described_class.new(tags: ['TODO']) }

      it 'returns notes with only specified tag' do
        expect(notes.map(&:tag)).to eq(['TODO'])
      end
    end

    context 'with custom comments' do
      subject { described_class.new(comments: ['#']) }

      it 'returns notes with only specified comments' do
        expect(notes.map(&:comment)).to eq(['#'])
      end
    end
  end
end

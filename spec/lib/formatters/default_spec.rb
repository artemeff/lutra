describe Lutra::Formatters::Default do
  let(:note) { Lutra::Note.new('TODO', '#', 'test', 113, '.././app/lib/test.rb') }

  context '#display' do
    let(:out)   { capture_stdout { subject.display([note]) } }
    let(:lines) { out.split("\n") }

    it 'has filename in first line' do
      expect(lines[0]).to eq('app/lib/test.rb:')
    end

    it 'has todo entry in seconds line' do
      expect(lines[1]).to eq(' * [113] [TODO] test')
    end
  end
end

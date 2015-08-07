describe Lutra::Formatters::Base do
  it '.new raise exception' do
    expect {
      subject.display([])
    }.to raise_error(Lutra::NotImplementedError)
  end
end

module DataSupport
  def load_data_file(name)
    File.open(data_file(name)).read
  end

  def data_file(name)
    "#{File.dirname(__FILE__)}/../fixtures/#{name}"
  end
end

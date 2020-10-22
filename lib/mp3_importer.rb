class MP3Importer
  attr_accessor :path

  def initialize(path)
    self.path = path
  end

  def files
    Dir.children(path)
  end

  def import
    files.each do |file|
      Song.new_by_filename(file)
    end
  end
end
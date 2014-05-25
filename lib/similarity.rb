class Similarity
  attr_reader :all_lines
  attr_accessor :smilar_lines

  def initialize(all_lines)
    @all_lines = all_lines
    @smilar_lines = 0
  end

  def precentage_similarity
    (100*smilar_lines)/all_lines
  end
end
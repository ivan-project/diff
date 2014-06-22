# encoding: utf-8
require 'similar_text'

class Similar
  attr_reader :source_file_path, :suspicious_file_path, :similarity, :lines
  attr_accessor :all_lines, :similar_lines

  def initialize(source_file_path_path, suspicious_file_path_path)
    @source_file_path = source_file_path_path
    @suspicious_file_path = suspicious_file_path_path
    @all_lines = 0
    @similar_lines = 0
    @lines = []
  end

  def get_result
    diff_documents
    parse_result
  end

  def precentage_similarity
    (100*similar_lines)/all_lines
  end

private

  def diff_documents
    File.foreach(source_file_path).with_index { |source_line, source_index|
      if source_line.split.size > 4
        first_similar = true
        self.all_lines += 1
        File.foreach(suspicious_file_path).with_index { |suspicious_line, suspicious_index|
          if suspicious_line.split.size > 4
            if source_line.to_s.similar(suspicious_line.to_s) >= 75
              if first_similar
                self.similar_lines +=1
                first_similar = false
              end
              lines << { sourceLineId: source_index + 1, similarLineId: suspicious_index + 1}
            end
          end
        }
      end
    }

  end

  def parse_result
    if lines.any?
      result = {
                 percentageSimilarity: precentage_similarity,
                 lines: lines
               }
    else
      result = {}
    end
  end

end
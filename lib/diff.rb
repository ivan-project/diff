# encoding: utf-8
require 'diffy'


class Diff
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
      self.all_lines += 1
      File.foreach(suspicious_file_path).with_index { |suspicious_line, suspicious_index|
        if Diffy::Diff.new(source_line.to_s, suspicious_line.to_s).diff.empty?
          self.similar_lines +=1
          lines << { sourceLineId: source_index + 1, similarLineId: suspicious_index + 1}
        end
      }
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
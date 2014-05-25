# encoding: utf-8
require 'diffy'


class Diff
  attr_reader :source_document, :suspicious_document, :similarity, :lines

  def initialize(source_file_path, suspicious_file_path)
    @source_document = Document.new(source_file_path, 'source')
    @suspicious_document = Document.new(suspicious_file_path, 'suspicious')
    @similarity = Similarity.new(source_document.text.lines.count)
    @lines = []
  end

  def get_result
    diff_documents
    parse_result
  end

private

  def diff_documents
    source_document.text.each_line.with_index do |source_line, source_index|
      next if source_index == 0
      suspicious_document.text.each_line.with_index do |suspicious_line, suspicious_index|
        next if suspicious_index == 0
        if Diffy::Diff.new(source_line.lstrip.chop, suspicious_line.lstrip.chop).diff.empty?
          similarity.smilar_lines +=1
          lines << { sourceLineId: source_index + 1, similarLineId: suspicious_index + 1}
        end
      end
    end
  end

  def parse_result
    if lines.any?
      result ={
               id: suspicious_document.id,
               percentageSimilarity: similarity.precentage,
               lines: lines
              }
    else
      nil
    end
  end
end
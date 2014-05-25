# encoding: utf-8
require 'diffy'


class Diff
  attr_reader :source_document, :suspicious_document, :similarity

  def initialize(source_file_path, suspicious_file_path)
    @source_document = Document.new(source_file_path, 'source')
    @suspicious_document = Document.new(suspicious_file_path, 'suspicious')
    @similarity = Similarity.new(source_document.text.lines.count)
  end

  def get_result
    diff_documents

  end

  def diff_documents
    source_document.text.each_line do |source_line|
      suspicious_document.text.each_line do |suspicious_line|
        similarity.smilar_lines +=1 if Diffy::Diff.new(source_line, suspicious_line).diff.empty?
      end
    end
  end

end
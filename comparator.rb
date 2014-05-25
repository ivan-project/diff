# encoding: utf-8

$LOAD_PATH << '.'
project_root = File.dirname(File.absolute_path(__FILE__))
Dir.glob(project_root + '/lib/*', &method(:require))

raise Errors::BadCallArgumentsNumber unless ARGV.length == 2
source_file_path = ARGV[0]
result_file_path = ARGV[1]
raise Errors::NotAFile unless File.file?(source_file_path)

documents = []
Dir.glob('inputFiles/*.json') do |suspicious_file_path| #tu będzie połączenie z bazą danych
  documents << Diff.new(source_file_path, suspicious_file_path) if source_file_path != suspicious_file_path
end


documents.each do |d|
  p d.source_document.id.to_s + '->' + d.suspicious_document.id.to_s
  p d.get_result
  p d.similarity.precentage_similarity
  p '------------'
end
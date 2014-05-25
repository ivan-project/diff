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

similarFiles = []
documents.each do |d|
  result = d.get_result
  similarFiles << result if !result.nil?
end

result = {
    sourceFileId: documents.first.source_document.id,
    similarFiles: similarFiles
}


puts JSON.pretty_generate(result)

File.open(result_file_path,"w") do |f|
  f.write(result.to_json)
end
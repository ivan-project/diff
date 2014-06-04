# encoding: utf-8
require 'json'

$LOAD_PATH << '.'
project_root = File.dirname(File.absolute_path(__FILE__))
Dir.glob(project_root + '/lib/*', &method(:require))

raise Errors::BadCallArgumentsNumber unless ARGV.length == 3

source_file_path = ARGV[0]
suspicious_file_path = ARGV[1]
result_file_path = ARGV[2]
raise Errors::NotAFile unless File.file?(source_file_path) && File.file?(suspicious_file_path)

# comparator = Diff.new(source_file_path, suspicious_file_path)
comparator = Similar.new(source_file_path, suspicious_file_path)

result = comparator.get_result

# puts JSON.pretty_generate(result)

File.open(result_file_path,"w") do |f|
  f.write(result.to_json)
end
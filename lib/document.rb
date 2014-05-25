# encoding: utf-8
require 'json'

class Document
  attr_reader :id, :type, :text
  def initialize(file_path, type)
    file_content = JSON.parse(IO.read(file_path))
    @id = file_content["fileId"]
    @text = file_content["text"]
    @type = type
  end
end
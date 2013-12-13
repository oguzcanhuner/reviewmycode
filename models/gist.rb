class Gist < Struct.new(:response)
  def content
    response[:files][:reviewmycode][:content]
  end
end

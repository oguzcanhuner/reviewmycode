class Gist < Struct.new(:response)
  def content
    binding.pry
    response.fetch('files').fetch('reviewmycode').fetch('content')
  end
end

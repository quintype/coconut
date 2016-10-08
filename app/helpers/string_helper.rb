#encoding: utf-8
module StringHelper

  def base64_to_string(string)
    Base64.decode64(string).force_encoding('UTF-8')
  end

end

class Story < Quintype::API::Story
  def to_liquid
    ActiveSupport::HashWithIndifferentAccess.new to_h
  end
end

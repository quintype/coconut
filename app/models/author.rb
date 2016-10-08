class Author < Quintype::API::Author
  def to_liquid
    ActiveSupport::HashWithIndifferentAccess.new to_h
  end
end

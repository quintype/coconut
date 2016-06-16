# Every single one of these to be reimplemented in JS in /app/assets/javascripts/liquid_helpers
module LiquidHelper
  def focusedImage(slug, metadata, aspect_ratio, *opts)
    image = FocusedImage.new(slug, metadata)
    aspect_ratio = aspect_ratio.split("x").map { |i| i.to_i}
    "//" + QtConfig.get.cdn_image + "/" + image.path(aspect_ratio, Hash[*opts])
  end
end

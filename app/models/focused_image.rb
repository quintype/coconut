# Pardon the stupid style. Direct port of the JS stuff
class FocusedImage
  def initialize(slug, metadata)
    @slug = slug
    @metadata = metadata
  end

  def path(aspectRatio, opts)
    rectOpts = {}
    if(@metadata && @metadata["height"] && @metadata["width"] && @metadata["focus-point"])
      rectOpts["rect"] = imageBounds([@metadata["width"], @metadata["height"]], aspectRatio, @metadata["focus-point"])
    end

    return @slug + imgixPath(opts.merge(rectOpts))
  end

  private

  def findLeftBound(imageWidth, halfCropWidth, focusPoint)
    if (focusPoint - halfCropWidth < 0)
      return 0
    elsif (focusPoint + halfCropWidth > imageWidth)
      return imageWidth - halfCropWidth
    else
      return focusPoint - halfCropWidth
    end
  end

  def findBounds(imageWidth, cropWidth, focusPoint)
    leftBound = findLeftBound(imageWidth, cropWidth / 2, focusPoint)
    if (leftBound + cropWidth > imageWidth)
      return (imageWidth - cropWidth)
    else
      return leftBound
    end
  end

  def imageBounds(imageDimensions, aspectRatio, focusPoint)
    if (imageDimensions[0] * aspectRatio[1] < imageDimensions[1] * aspectRatio[0])
      # Use the entire width
      expectedHeight = (imageDimensions[0] * aspectRatio[1]) / aspectRatio[0]
      bound          = findBounds(imageDimensions[1], expectedHeight, focusPoint[1])
      return [0, bound.round, imageDimensions[0], expectedHeight.round]
    else
      # Use the entire height
      expectedWidth = (imageDimensions[1] * aspectRatio[0]) / aspectRatio[1]
      bound         = findBounds(imageDimensions[0], expectedWidth, focusPoint[0])
      return [bound.round, 0, expectedWidth.round, imageDimensions[1]]
    end
  end

  def imgixPath(opts)
    if(opts.empty?)
      return ""
    end

    args = opts.map { |key, value| "#{key}=#{value.is_a?(Array) ? value.join(',') : value}" }

    return "?" + args.join("&")
  end
end

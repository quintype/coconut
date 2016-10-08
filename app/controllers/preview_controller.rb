class PreviewController < ApplicationController
  def story
    @page = { 'type' => 'preview-story' }
    render 'preview/story'
  end

  def home
    @page = { 'type' => 'preview-home' }
    render 'preview/home'
  end
end

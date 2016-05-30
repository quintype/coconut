class SystemController < ApplicationController
  def ping
    render json: { success: true, publisher_id: QtConfig.get.publisher_id }
  end
end

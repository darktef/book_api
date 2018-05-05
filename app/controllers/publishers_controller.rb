class PublishersController < ApplicationController
  def show
    render json: @publisher, serializer: PublisherSerializer
  end
end

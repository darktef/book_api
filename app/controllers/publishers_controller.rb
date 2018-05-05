class PublishersController < ApplicationController
  def show
    json_response(@publisher)
  end
end

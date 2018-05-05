class ApplicationController < ActionController::API
  include ExceptionHandler

  before_action :set_resource, only: :show

  protected

  # Set the resource
  def set_resource
    @resource = model_class.find(params[:id])
    instance_variable_set("@#{object_name}", @resource)
  end

  # Extract the model class from controller
  def model_class
    controller_name.classify.constantize
  end

  # Extract the singular object name from controller
  def object_name
    controller_name.singularize
  end
end

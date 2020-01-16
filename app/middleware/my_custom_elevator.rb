require 'apartment/elevators/generic'

# app/middleware/my_custom_elevator.rb
class MyCustomElevator < Apartment::Elevators::Generic

  # @return {String} - The tenant to switch to
  def parse_tenant_name(request)
    # request is an instance of Rack::Request

    # example: look up some tenant from the db based on this request
    # tenant_name = SomeModel.from_request(request)
    tenant_name = request.path.split('/').second
    return tenant_name
  end
end
# frozen_string_literal: true

require 'apartment/elevators/generic'

# app/middleware/my_custom_elevator.rb
class MyCustomElevator < Apartment::Elevators::Generic
  # @return {String} - The tenant to switch to
  def parse_tenant_name(request)
    # request is an instance of Rack::Request

    # example: look up some tenant from the db based on this request
    # tenant_name = SomeModel.from_request(request)

    # request.path.split('/').second
    case request.ip
    when '192.168.0.70'
      't1'
    else
      't2'
    end

  rescue Apartment::TenantNotFound
    [301, { 'Location' => 'http://localhost:3000/t1/projects' }, ['redirect']]
  end
end

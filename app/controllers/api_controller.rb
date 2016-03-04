class ApiController < ApplicationController
  def show
    @entity_types_test = EntityType.all.to_xml
  end
end
class StaticPagesController < ApplicationController
  def home
    @entity_types = EntityType.new
    @entities = Entity.new
    @property_types = PropertyType.new
    @properties = Property.new
  end
  def show
    @entity_types = EntityType.all
    @entities = Entity.all
    @property_types = PropertyType.all
    @properties = Property.all
  end
end
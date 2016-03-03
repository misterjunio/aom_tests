class EntityTypesController < ApplicationController
  def create
    @entity_type = EntityType.new(entity_type_params)
    if @entity_type.save
=begin
      temp = EntityTypeClass.new("#{@entity_type[:name]}", {});
      @entity = temp.type_name
=end
      redirect_to show_path
    else
      redirect_to root_url
    end
  end

  private

    def entity_type_params
      params.require(:entity_type).permit(:name)
    end
end
=begin
require 'date'

class EntityTypeClass
  attr_accessor :type_name
  attr_accessor :property_names_and_types
  def initialize(type_name, property_names_and_types)
    @type_name = type_name
    @property_names_and_types = property_names_and_types
  end
  def property_type(property_name)
    @property_names_and_types[property_name]
  end
end

class EntityClass
  attr_accessor :entity_type
  attr_accessor :properties
  def initialize(entity_type, attrs = {})
    @entity_type = entity_type
    bind_properties(entity_type.property_names_and_types)
    attrs.each do |name, value|
      instance_variable_set("@#{name}", value)
    end
  end
  def bind_properties(property_names_and_types)
    (class << self; self; end).module_eval do
      property_names_and_types.each do |name, type|
        define_method name.to_sym do
          instance_variable_get("@#{name}")
        end
        define_method "#{name}=" do |value|
          instance_variable_set("@#{name}", value)
        end
      end
    end
  end
end
=end
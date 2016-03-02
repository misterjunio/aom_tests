require 'date'

class EntityType
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

class Entity
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

vehicle_type = EntityType.new('Vehicle', {
    'maker' => 'String',             # class.name
    'model' => 'String',
    'yearCreated' => 'Time',
    'speed' => 'Fixnum',
    'miles' => 'Decimal'});

vehicle = Entity.new(vehicle_type, {
    'maker' => 'Toyota',
    'model' => 'Highlander',
    'yearCreated' => DateTime.parse('1-1-2003'),
    'speed' => 120,
    'miles' => 3000});
    
class << vehicle
  def drive
    "driving"
  end
  def stop
    "stopping"
  end
  def perform_maintenance
    "performing maintenance"
  end
end
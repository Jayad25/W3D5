require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
    x = DBConnection.execute2(<<-SQL)
  SELECT
    *
  FROM
    "#{self.table_name}"
  SQL
    x.first.map {|y| y.to_sym}
  end

  def self.finalize!

    columns.each do |col|
      define_method("#{col}") do

        instance_variable_get("@#{col}")
        col.each do |att|
          instance_variable_get("@#{att}")
        end
      end

      define_method("#{col}=") do |val|
        instance_variable_set("@#{col}", val)
      end
    end

  end

  def self.table_name=(table_name)
    @table_name = table_name
    # table_name = table_name
    # ...
  end

  def self.table_name
    # ...

    @table_name ||= self.name.tableize
    # @table_name = self.name.tableize
  end

  def self.all
    # ...

  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # ...
    @params = {}
  end

  def attributes
    # ...
    @attributes ||= {}
  # @attributes
  end

  def attribute_values
    # ...
    @attributes.values
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end

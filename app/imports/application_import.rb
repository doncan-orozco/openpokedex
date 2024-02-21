# frozen_string_literal: true

class ApplicationImport
  def initialize(record, response)
    @record = record
    @response = response.with_indifferent_access
  end

  def self.call(record, response)
    new(record, response).import
  end

  def import
    raise NotImplementedError
  end

  private

  attr_reader :record, :response
end

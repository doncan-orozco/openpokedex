# frozen_string_literal: true

# Queries are used to encapsulate complex SQL queries and keep the controllers clean.
# Examples of queries are: ExchangeRateQuery, ActiveLegalFilesQuery, etc.
class ApplicationQuery
  attr_reader :q

  def initialize(scope: klass, **q)
    @scope = scope || klass
    @q = q
  end

  def self.call(scope: nil, **q)
    new(scope: scope, **q).query
  end

  def query
    raise NotImplementedError
  end

  def klass
    self.class.name.gsub("Query", "").constantize
  end
end

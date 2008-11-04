class GoogleResultSet < Array
  
  # Expects an array outputs an enhanced array
  def initialize(results)
    results['responseData']['results'].each do |result|
      self.push(GoogleResult.new(result))
    end
  end
end

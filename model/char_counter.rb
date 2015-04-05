class CharCounter
  def CharCounter.count(str)
    hash = if str.nil?
        Hash.new;
      else
        str.gsub(' ', '').split(//).inject(Hash.new(0)) { |acum, e| acum[e] += 1; acum }
      end
    hash.default = nil ; hash
  end
end

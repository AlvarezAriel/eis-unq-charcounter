class CharCounter

  # La interfaz que se pide del diccionario no me parece adecuada
  # Se supone que es un diccionario que me dice cuántas veces apareció un char, con lo cual, si pregunto por un
  # char que no estaba, debería devolver 0, que es exactamente la cantidad de veces que apareció, no nil!
  # Porque nil ni siquiera es del mismo tipo!

  def CharCounter.count(str)
    hash = if str.nil?
        Hash.new;
      else
        str.gsub(' ', '').split(//).inject(Hash.new(0)) { |acum, e| acum[e] += 1; acum }
      end
    hash.default = nil ; hash
  end
end

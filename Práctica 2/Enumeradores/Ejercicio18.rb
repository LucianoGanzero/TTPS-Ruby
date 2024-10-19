#18. Escribí un enumerador que calcule la serie de Fibonacci.

fibonacci = Enumerator.new do |caller|
  i1, i2 = 1, 1
  loop do
    caller.yield i1
    i1, i2 = i2, i1+i2
  end
end
6.times { puts fibonacci.next }

puts fibonacci.first(1000).last

puts fibonacci.next
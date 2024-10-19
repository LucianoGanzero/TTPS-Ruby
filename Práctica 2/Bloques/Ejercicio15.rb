def da_nil?
  result = yield 
  puts result.nil?  
end


da_nil? { }
# => true
da_nil? do
  'Algo distinto de nil'
end
# => false
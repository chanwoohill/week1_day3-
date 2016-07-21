list = {'yvr' => 'Vancouver'}, {'yba' => 'Banff'}, {'yyz' => 'Toronto'}, {'yxx' => 'Abbotsford'}, {'ybw' => 'Calgary'}

# Why is it returning nil instead of first element of the list above
# list is hash, not an array.

p list.first


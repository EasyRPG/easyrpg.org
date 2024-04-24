
# use a hash to avoid caching issues

require 'ruby-xxhash'

def asset_hash(item)
  sum = XXhash.xxh32(File.read(@item[:filename]), 0xEA51)
  return sum.to_s
end

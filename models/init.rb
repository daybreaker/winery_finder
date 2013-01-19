require_relative 'config'
require_relative 'winery'

# Perform basic sanity checks and initialize all relationships
# Call this when you've defined all your models
DataMapper.finalize

# automatically create the post table
Winery.auto_upgrade!

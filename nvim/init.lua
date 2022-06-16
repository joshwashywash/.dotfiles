require('impatient')

local files = {
  'autocommands',
  'keymaps',
  'options',
  'plugins',
}

for _, file in ipairs(files) do
  require(string.format('josh.%s', file))
end

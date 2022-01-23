local ok, schemastore = pcall(require, 'schemastore')
local settings = {}

if ok then
  settings = {
    json = {
      schemas = schemastore.json.schemas(),
    },
  }
end
return settings

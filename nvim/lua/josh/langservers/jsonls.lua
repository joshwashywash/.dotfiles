local ok, schemastore = pcall(require, 'schemastore')

if ok then
  return {
    settings = {
      json = {
        schemas = schemastore.json.schemas,
      },
    },
  }
else
  return {}
end

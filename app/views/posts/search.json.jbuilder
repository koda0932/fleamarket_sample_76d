json.array! @childrens do |child|
  json.id child.id
  json.name child.name
end

json.array! @grandChild do |gc|
  json.id gc.id
  json.name gc.name
end


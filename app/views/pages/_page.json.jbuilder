json.id page.id.to_s
json.parent page.parent_id ? page.parent_id.to_s : "#"
json.text page.name
json.children !page.leaf?
json.icon page.leaf? ? 'file icon' : 'folder icon'

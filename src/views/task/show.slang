h1 Show Task
p = task.task
p = task.description
p
  == link_to("Back", "/tasks", class: "btn btn-light btn-sm")
  == link_to("Edit", "/tasks/#{task.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/tasks/#{task.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")

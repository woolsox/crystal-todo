- if task.errors
  ul.errors
    - task.errors.each do |error|
      li = error.to_s

== form(action: "/tasks/#{task.id.to_s}", method: task.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "task", value: task.task, placeholder: "Task", class: "form-control")
  .form-group
    == text_area(name: "description", content: task.description, placeholder: "Description", class: "form-control", size: "30x10")
  == submit("Submit", class: "btn btn-success btn-sm")
  == link_to("Back", "/tasks", class: "btn btn-light btn-sm")

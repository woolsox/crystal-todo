.row
  .col-sm-11
    h2 Tasks
  .col-sm-1
    a.btn.btn-success.btn-sm href="/tasks/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Task
        th Description
        th Status
        th Actions
    tbody
      - tasks.each do |task|
        tr
          td = task.task
          td = task.description
          td = task.status
          td
            span
              == link_to("Show", "/tasks/#{task.id}", class: "btn btn-info btn-sm")
              == link_to("Edit", "/tasks/#{task.id}/edit", class: "btn btn-success btn-sm")
              == link_to("Delete", "/tasks/#{ task.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
              == link_to("Toggle Completion", "", "data-method": "delete", "data-confirm": "Are you sure this task is complete?", class: "btn btn-toggle btn-sm")

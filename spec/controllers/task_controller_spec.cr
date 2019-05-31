require "./spec_helper"

def task_hash
  {"task" => "Fake", "description" => "Fake"}
end

def task_params
  params = [] of String
  params << "task=#{task_hash["task"]}"
  params << "description=#{task_hash["description"]}"
  params.join("&")
end

def create_task
  model = Task.new(task_hash)
  model.save
  model
end

class TaskControllerTest < GarnetSpec::Controller::Test
  getter handler : Amber::Pipe::Pipeline

  def initialize
    @handler = Amber::Pipe::Pipeline.new
    @handler.build :web do
      plug Amber::Pipe::Error.new
      plug Amber::Pipe::Session.new
      plug Amber::Pipe::Flash.new
    end
    @handler.prepare_pipelines
  end
end

describe TaskControllerTest do
  subject = TaskControllerTest.new

  it "renders task index template" do
    Task.clear
    response = subject.get "/tasks"

    response.status_code.should eq(200)
    response.body.should contain("tasks")
  end

  it "renders task show template" do
    Task.clear
    model = create_task
    location = "/tasks/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Task")
  end

  it "renders task new template" do
    Task.clear
    location = "/tasks/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Task")
  end

  it "renders task edit template" do
    Task.clear
    model = create_task
    location = "/tasks/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Task")
  end

  it "creates a task" do
    Task.clear
    response = subject.post "/tasks", body: task_params

    response.headers["Location"].should eq "/tasks"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a task" do
    Task.clear
    model = create_task
    response = subject.patch "/tasks/#{model.id}", body: task_params

    response.headers["Location"].should eq "/tasks"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a task" do
    Task.clear
    model = create_task
    response = subject.delete "/tasks/#{model.id}"

    response.headers["Location"].should eq "/tasks"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end

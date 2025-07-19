# Task Manager

A simple task management web app built with Ruby On Rails.

##  Live Demo

https://mojtaskmanager-d5c3fde9596b.herokuapp.com/


## Features

- Create tasks with a title, description, and due date
- View a list of all tasks
- Delete tasks asynchronously with Javascript (Turbo + Stimulus)
- Clean, responsive UI built with Tailwind CSS

## Tech Stack

- **Ruby on Rails** 7.2.2
- **Tailwind CSS** 4
- **StimulusJS**
- **Hotwire / Turbo**
- **Minitest** for testing
- **SimpleCov** with over **97% test coverage**
- Deployed on **Heroku**

## Installation

To run the app locally:

```
git clone https://github.com/your-username/task-manager.git
cd task-manager
bundle install
yarn install
rails db:setup
bin/dev
```

## How to run the test suite
```rails test```

## Test coverage
```
open coverage/index.html

```

## Endpoints

### Root
- **GET /**  
  Displays the home page.  
  **Controller**: `HomeController#index`

### Tasks

#### View All Tasks
- **GET /tasks**  
  Lists all tasks, ordered by creation date.  
  **Named route**: `tasks_path`  
  **Controller**: `TasksController#index`

#### New Task Form
- **GET /tasks/new**  
  Displays a form to create a new task.  
  **Named route**: `new_task_path`  
  **Controller**: `TasksController#new`

#### Show Task
- **GET /tasks/:id**  
  Shows a specific task by ID.  
  **Named route**: `task_path(:id)`  
  **Controller**: `TasksController#show`

#### Edit Task Form
- **GET /tasks/:id/edit**  
  Displays a form to edit an existing task.  
  **Named route**: `edit_task_path(:id)`  
  **Controller**: `TasksController#edit`

#### Create Task
- **POST /tasks**  
  Creates a new task.  
  **Params** (in `params[:task]`):  
  - `title` (string)  
  - `description` (string)  
  - `status` (string) — e.g., `"In progress"`  
  - `due` (date)  
  Redirects to tasks list on success.  
  **Named route**: `create_task_path`  
  **Controller**: `TasksController#create`

#### Update Task
- **PATCH /tasks/:id**  
  Updates an existing task.  
  **Params** (in `params[:task]`):  
  - `title`, `description`, `status`, `due`  
  Redirects on success, re-renders form on failure.  
  **Named route**: `update_task_path(:id)`  
  **Controller**: `TasksController#update`

#### Delete Task
- **DELETE /tasks/:id/delete**  
  Deletes the task by ID.  
  Responds with redirect or Turbo Stream.  
  **Named route**: `task_delete_path(:id)`  
  **Controller**: `TasksController#delete`

#### Find Task (Redirect)
- **POST /tasks/find**  
  Redirects to the show page for the given task ID (`params[:id]`).  
  **Named route**: `find_task_path`  
  **Controller**: `TasksController#find`

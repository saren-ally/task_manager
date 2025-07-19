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

```bash
git clone https://github.com/your-username/task-manager.git
cd task-manager
bundle install
yarn install
rails db:setup
bin/dev

## test suite
rails test
open coverage/index.html

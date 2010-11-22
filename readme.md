# Geoportal

Geoportal is a template for creating CMS-based projects with geospatial information. It's based on [Refinery CMS](http://refinerycms.com/) and loads by default a set of extensions from refinery:

  - refinerycms-inquiries
  - refinerycms-blog
  - refinerycms-i18n
  - refinerycms-events
  - refinerycms-galleries
  - refinerycms-features


## Dependencies

  - Ruby 1.8.7
  - Rails 3
  - PostgreSQL
  - PostGIS extensions

## How to create a new project based on geoportal

This are the suggested steps to create a new project on github, based on geoportal.

By default we are going to have a different gemset per project.

    rvm use 1.8.7
    rvm gemset create new_project
    rvm use 1.8.7@new_project
    gem install bundler
    curl -F 'login=Vizzuality' -F 'token=<your_token>' https://github.com/api/v2/json/repos/create -F 'name=new_project'  -F 'public=1'
    git clone git://github.com/Vizzuality/geoportal.git new_project
    cd new_project
    rm -rf .git/
    git init
    git add *
    git commit -m "Creating new_project"
    git remote add origin git@github.com:Vizzuality/new_project.git
    git push origin master
    bundle install
    # edit config/database.yml
    rake db:setup
    rails s

## Developing and extending geoportal

Create a gemset:

    rvm use 1.8.7
    rvm gemset create geoportal
    rvm use 1.8.7@geoportal

Download the project, fork it and make a **pull request**.

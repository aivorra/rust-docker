#!/bin/bash
<< //
Script:     create_project.sh project_name
Parameter:  project_name (no spaces or special characters)
Author:     Agustin Ivorra <agustinivorra@gmail.com>
//

project=$1;
rustver="1.60.0";

if [ -z $project ]; then
    echo "You MUST set a project name as argument of script.";
    exit 1;
fi

cd projects;

sudo docker run --rm --user "$(id -u)":"$(id -g)" -v "$PWD":/usr/src/$project -w /usr/src/$project rust:$rustver cargo new $project
if [ $? -ne 0 ]; then
    echo "Create project failed.";
    cd ..
    exit 1;
fi

cd ..

echo "The project was created.";
exit 0;
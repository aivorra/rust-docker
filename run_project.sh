#!/bin/bash
<< //
Script:     run_project.sh project_name
Parameter:  project_name (a project already created)
Author:     Agustin Ivorra <agustinivorra@gmail.com>
//

project=$1;
rustver="1.60.0";

if [ -z $project ]; then
    echo "You MUST call a project name as argument of script.";
    exit 1;
fi

cd projects/$project && sudo docker run --rm  --user "$(id -u)":"$(id -g)" -v "$PWD":/usr/src/$project -w /usr/src/$project rust:$rustver cargo run
if [ $? -ne 0 ]; then
    echo "Fail to run the project '"$project"'.";
    cd ..
    exit 1;
fi

cd ../../

echo "^^^^^^^^^^";
echo "The project '"$project"' was executed correctly.";
exit 0;
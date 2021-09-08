#!/bin/bash

PROJECT_NAME=$1
if [ -z "$PROJECT_NAME" ]; then
    echo "Please specify a project name"
    exit 1
fi

echo Creating Gradle project in $PWD/$PROJECT_NAME...
mkdir -p $PROJECT_NAME/src/{main,test}/{java,resources}

echo "apply plugin: 'java'

repositories {
    mavenCentral()
}

dependencies {
    compile group: 'org.apache.commons', name: 'commons-lang3', version: '3.12.0'
    testCompile group: 'org.junit.jupiter', name: 'junit-jupiter', version: '5.7.2'
    testCompile group: 'org.easytesting', name: 'fest-assert', version: '1.4'
    testCompile group: 'org.mockito', name: 'mockito-all', version: '1.10.19'
}
" > $PROJECT_NAME/build.gradle

echo ".idea
.gradle
*.iml
*.ipr
*.iws
out
build" > $PROJECT_NAME/.gitignore

cd $PROJECT_NAME
git init
git add -- build.gradle .gitignore
git commit -m "Added build script and .gitignore"

echo "All done. You can now import the project into your IDE."

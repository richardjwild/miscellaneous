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
    compile group: 'org.apache.commons', name: 'commons-lang3', version: '3.7'
    testCompile group: 'junit', name: 'junit', version: '4.12'
    testCompile group: 'org.easytesting', name: 'fest-assert', version: '1.4'
    testCompile group: 'org.mockito', name: 'mockito-all', version: '1.10.19'
    testCompile group: 'pl.pragmatists', name: 'JUnitParams', version: '1.1.0'
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

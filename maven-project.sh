#!/bin/bash

PROJECT_NAME=$1
if [ -z "$PROJECT_NAME" ]; then
    echo "Please specify a project name"
    exit 1
fi

echo Creating Gradle project in $PWD/$PROJECT_NAME...
mkdir -p $PROJECT_NAME/src/{main,test}/{java,resources}

echo "<project>
  <modelVersion>4.0.0</modelVersion>
  <groupId>com.github.$USER</groupId>
  <artifactId>$PROJECT_NAME</artifactId>
  <version>1</version>
  <dependencies>
    <dependency>
      <groupId>org.apache.commons</groupId>
      <artifactId>commons-lang3</artifactId>
      <version>3.7</version>
    </dependency>
    <dependency>
      <groupId>junit</groupId>
      <artifactId>junit</artifactId>
      <version>4.12</version>
    </dependency>
    <dependency>
      <groupId>org.easytesting</groupId>
      <artifactId>fest-assert</artifactId>
      <version>1.4</version>
    </dependency>
    <dependency>
      <groupId>org.mockito</groupId>
      <artifactId>mockito-all</artifactId>
      <version>1.10.19</version>
    </dependency>
    <dependency>
      <groupId>pl.pragmatists</groupId>
      <artifactId>JUnitParams</artifactId>
      <version>1.1.0</version>
    </dependency>
  </dependencies></project>
" > $PROJECT_NAME/pom.xml

echo ".idea
*.iml
*.ipr
*.iws
target" > $PROJECT_NAME/.gitignore

cd $PROJECT_NAME
git init
git add -- pom.xml .gitignore
git commit -m "Added build script and .gitignore"

echo "All done. You can now import the project into your IDE."

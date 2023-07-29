# Gradle
Gradle builds are used to define a project and its tasks. At least one Gradle build [build.gradle] file is located in the root folder of the project. A task represents the work that a Gradle build has to perform, e.g., compiling the source code of the program. You can execute multiple tasks at a time under one build file.

***What is the order of execution in Gradle?***
Gradle runs these phases in order: first initialization, then configuration, and finally execution. Detects the settings file. Evaluates the settings file to determine which projects and included builds participate in the build.

***Install Gradle with the script: [install-gradle.sh]***

```
chmod +x install-gradle.sh
./install-gradle.sh

source /etc/profile.d/gradle.sh
```

## Sample projects
- basic
- application

### FirstProject (Basic)

```
mkdir firstProject && cd firstProject

gradle init         # select basic, groovy
```

***Will install these files***

.
├── build.gradle
├── gradle
│   └── wrapper
│       ├── gradle-wrapper.jar
│       └── gradle-wrapper.properties
├── gradlew
├── gradlew.bat
└── settings.gradle

- The [build.gradle] is the core component of your build process and has all of the instructions necessary to compile your app from source.
- The [settings.gradle] is where you will find the project settings. you can add miltiple projects here if u have.
- The [Wrapper] allows for verification of the downloaded Gradle distribution via SHA-256

***Build the gradle project, you can add a task in the build.gradle file***

```
gradle tasks
gradle tasks  --all
```

add this task in the build.gradle file

```groovy
task firstTask{
    println 'My first gradle task!!!'
}
```

Then run:

```
gradle firstTask

OR, Use the wrapper command, OR

./gradlew firstTask
```

### First Java Project (application)

```
mkdir firstJavaProject && cd firstJavaProject

gradle init         # select application --> Java --> Groovy --> JUnit 4
```

it created this tree structure

.
├── app
│   ├── build.gradle
│   └── src
│       ├── main
│       │   ├── java
│       │   │   └── firstjavaproject
│       │   │       └── App.java
│       │   └── resources
│       └── test
│           ├── java
│           │   └── firstjavaproject
│           │       └── AppTest.java
│           └── resources
├── gradle
│   └── wrapper
│       ├── gradle-wrapper.jar
│       └── gradle-wrapper.properties
├── gradlew
├── gradlew.bat
└── settings.gradle


***NOTE:*** You can rename the [app] to what ever name you choose, but you also have to make that change in the [settings.gradle]

***Compile the gradle project, you can add a task in the build.gradle file***

```
gradle tasks  --all
gradle compileJava      # Will create a bill folder in the app folder

gradle clean  [OPTIONAL]:
gradle test  [OPTIONAL]:
```

***OPTIONAL NOTE***: you can also create a jar file and use it to run same application

```
gradle jar
gradle run
```

### Gradle dependencies
Dependencies refer to the things that supports in building your project, such as required JAR file from other projects and external JARs like JDBC JAR or Eh-cache JAR in the class path. Or repositories like JFrog

Search this on the web [junit:junit:4.13.2]
Will lead you to the artifactory [https://mvnrepository.com/artifact/junit/junit/4.13.2](https://mvnrepository.com/artifact/junit/junit/4.13.2)

## Groovy

Install from: [https://spring.io/tools](https://spring.io/tools)


FROM adoptopenjdk/openjdk11

ENV APP_HOME /app/

COPY tracing-demo/target/tracing-demo-0.0.1-SNAPSHOT.jar $APP_HOME

EXPOSE 8080

WORKDIR $APP_HOME

# set env variables when starting the container
CMD java -jar tracing-demo-0.0.1-SNAPSHOT.jar

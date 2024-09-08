FROM eclipse-temurin:21

RUN mkdir /opt/languagetool
COPY ./build /opt/languagetool
RUN touch /opt/languagetool/server.properties

CMD ["/bin/bash", "-c", "java -cp /opt/languagetool/languagetool-server.jar org.languagetool.server.HTTPServer --config /opt/languagetool/server.properties --port 8081 --public --allow-origin |& tee /var/log/languagetool-pcm/languagetool.log"]
EXPOSE 8081

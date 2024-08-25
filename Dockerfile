FROM eclipse-temurin:21

LABEL org.opencontainers.image.source=https://github.com/Naija-Guru/languagetool
LABEL org.opencontainers.image.description="Nigerian Pidgin (pcm-NG) LanguageTool server"

RUN mkdir /opt/languagetool
COPY ./build /opt/languagetool
RUN touch /opt/languagetool/server.properties

CMD ["java", "-cp", "/opt/languagetool/languagetool-server.jar", "org.languagetool.server.HTTPServer", "--config", "/opt/languagetool/server.properties", "--port", "8081", "--public", "--allow-origin"]
EXPOSE 8081

FROM mcr.microsoft.com/mssql/server:2019-latest

ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=TuPasswordSeguro123!
ENV MSSQL_PID=Express
ENV MSSQL_MEMORY_LIMIT_MB=512

USER root
RUN /opt/mssql/bin/mssql-conf set network.forceencryption 0

COPY backup.bak /tmp/backup.bak

RUN chmod 777 /tmp/backup.bak

USER mssql

EXPOSE 1433
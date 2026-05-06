FROM mcr.microsoft.com/mssql/server:2022-latest

ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=TuPasswordSeguro123!
ENV MSSQL_PID=Express
ENV MSSQL_MEMORY_LIMIT_MB=1024

USER root
RUN /opt/mssql/bin/mssql-conf set network.forceencryption 0

COPY backup.bak /tmp/backup.bak
COPY PFDB2.sql /tmp/PFDB2.sql

RUN chmod 777 /tmp/backup.bak
RUN chmod 777 /tmp/PFDB2.sql

USER mssql

EXPOSE 1433
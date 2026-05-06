FROM mcr.microsoft.com/mssql/server:2022-latest

ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=TuPasswordSeguro123!
ENV MSSQL_PID=Express
ENV MSSQL_ENCRYPT=0

USER root

RUN /opt/mssql/bin/mssql-conf set network.forceencryption 0

USER mssql

EXPOSE 1433
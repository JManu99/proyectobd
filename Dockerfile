FROM mcr.microsoft.com/mssql/server:2022-latest

ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=TuPasswordSeguro123!
ENV MSSQL_PID=Developer
ENV MSSQL_MEMORY_LIMIT_MB=1024

USER root
RUN /opt/mssql/bin/mssql-conf set network.forceencryption 0

RUN rm -f /var/opt/mssql/data/PFBD2.mdf
RUN rm -f /var/opt/mssql/data/PFBD2.ldf
RUN rm -f /var/opt/mssql/data/PFDB2.mdf
RUN rm -f /var/opt/mssql/data/PFDB2.ldf

COPY backup.bak /tmp/backup.bak
COPY db.sql /tmp/db.sql

RUN chmod 777 /tmp/backup.bak
RUN chmod 777 /tmp/db.sql

USER mssql

EXPOSE 1433
FROM puckel/docker-airflow:latest

ARG AIRFLOW_USER_HOME=/usr/local/airflow

COPY requirements.txt /requirements.txt

RUN sudo chmod 777 /requirements.txt

RUN chown -R airflow: ${AIRFLOW_USER_HOME}

EXPOSE 8080 5555 8793

USER airflow
WORKDIR ${AIRFLOW_USER_HOME}
ENTRYPOINT ["/entrypoint.sh"]
CMD ["webserver"]


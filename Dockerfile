FROM puckel/docker-airflow:latest

ARG AIRFLOW_USER_HOME=/usr/local/airflow

RUN pip install apache-airflow-providers-databricks

RUN pip install apache-airflow-providers-databricks

RUN pip install apache-airflow-providers-microsoft-azure

RUN chown -R airflow: ${AIRFLOW_USER_HOME}

EXPOSE 8080 5555 8793

USER airflow
WORKDIR ${AIRFLOW_USER_HOME}
ENTRYPOINT ["/entrypoint.sh"]
CMD ["webserver"]


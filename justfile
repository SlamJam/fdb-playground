up:
    docker compose up --remove-orphans -d

stop:
    docker compose stop

cli:
    #on coordinator there is fbd.cluster file
    docker compose exec -i fdb-coordinator fdbcli

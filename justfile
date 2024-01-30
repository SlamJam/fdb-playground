up:
    docker compose up --remove-orphans -d

stop:
    docker compose stop

down:
    @ /bin/echo -n "Are you sure?: "
    @ read answer && [ $answer = "y" ]
    docker compose down --remove-orphans --volumes

cli:
    #on coordinator there is fbd.cluster file
    docker compose exec -i fdb-coordinator fdbcli


DOCKER := "docker"

up:
    {{DOCKER}} compose up --remove-orphans -d

stop:
    {{DOCKER}} compose stop

down:
    @ /bin/echo -n "Are you sure?: "
    @ read answer && [ $answer = "y" ]
    {{DOCKER}} compose down --remove-orphans --volumes

cli-cluster:
    #on coordinator there is fbd.cluster file
    {{DOCKER}} compose exec -i fdb-coordinator fdbcli

cli-single-node:
    {{DOCKER}} compose exec -i fdb-single-node fdbcli

# DOCKER

## Mysql

- mysql -P 8083 --protocol=tcp -u root -p

## Commands

- docker-compose -f docker-compose-dev.yml build
- docker-compose -f docker-compose-dev.yml up
- docker-compose -f docker-compose-dev.yml run web rails db:create
- docker-compose -f docker-compose-dev.yml run web rails db:migrate

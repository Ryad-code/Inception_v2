all: 
	sudo mkdir -p /home/mlaouedj/data/wordpress
	sudo mkdir -p /home/mlaouedj/data/mariadb
	sudo grep -q "mlaouedj.42.fr" /etc/hosts || sudo sed -i '1 i\127.0.0.1 mlaouedj.42.fr' /etc/hosts 
	docker compose -f ./srcs/docker-compose.yml up -d

re:
	docker compose -f ./srcs/docker-compose.yml up -d --build

clean:
	docker compose -f ./srcs/docker-compose.yml down;\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\

.PHONY: all re clean

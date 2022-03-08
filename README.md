# Spring Boot MySQL Example
> - Setting up the dev, and production envs for a springboot stack (springboot, and mysql).
> - [Source repo](https://github.com/springframeworkguru/spring-boot-mysql-example) for the springboot app 

---
## TOC
1. [**Deploy using docker and docker-compose**](#deploy-locally-using-docker)
1. [**Deploy in Kuberentes**](provide a link for the docs here)

---
## Deploy locally using Docker
1. Create `.env` file with the below content for storing the db credentials
	```
	MYSQL_DB_HOST=db  #mysqldb service name
	MYSQL_DB_PORT=3306 #default port for mysql
	MYSQL_DB_USERNAME= #your username
	MYSQL_DB_PASSWORD= #your password
	MYSQL_DB_DNAME=springbootdb #your default database name
	```
1. run the below command for starting both the database and the spring-boot service
	```
	docker-compose up --build .
	```
1. Tag your docker image and push it to dockerhub
	```
	docker build -t image_name your_username/image_name:version
	```

	```
	docker push your_username/image_name:version
	```

---
## Deploy on k8s (tested in minikube)
1. **Create `mysql-secret.yaml` for storing your db credentials**
	
	To put any values in a Secret file in kuberntes it needs to be base64 encoded
	```
	echo -n your_lovely_name | base64
	echo -n your_strong_complicated_password | base64
	```

	`mysql-secret.yaml` file
	```
	apiVersion: v1
	kind: Secret
	metadata:
	  name: mysql-secret
	data:
	  MYSQL_DB_USERNAME: #your_lovely encode username
	  MYSQL_DB_PASSWORD: #your_strong and complicated pass 
	```
	
	Connect to mysql pod
	```
	exec -it pod/mysql-depl-57969854d7-fqc8h -- /bin/bash
	mysql -u root -p # enter your pw in the prompt
	```

1. Run the files:
	```
	kubectl apply -f mysql-configmap.yml && kubectl apply -f mysql-secrets.yml
	```
	```
	kubectl apply -f mysql-pvm-pvmc.yml
	```
	```
	kubectl apply -f mysql-deployment.yml
	```
	```
	kubectl apply -f mysql-service.yml
	```
	```
	kubectl apply -f springboot-depl.yml
	```
	```
	kubectl apply -f mysql-service.yml
	```
	```
	kubectl apply -f springboot-depl.yml
	```
	```
	kubectl apply -f springboot-service.yml
	```
1. Get the port to accesss your springboot app
	```
	minikube service --url springboot-srv
	```

1. Commands for debugging:
	
	check logs of a deployment
	```
	kubectl logs -f pod/springboot-depl-
	```

---
## Errors and trouble shooting
1. Debendancies in the `pom.xml` file specfically
	- Updating the springboot version to `2.1.6.RELEASE`
	- Adding the `maven-surefire-plugin`
1. If your mysql pod doesn't start prompting this error `mysql: [ERROR] unknown option '--"'`
	- This means you have problem with the encoding you shall use an encoding website instead of the echo command


## Improvements can be made
- [ ] Try to enable hot reload for the local dev environment
	- [ ] Search for a way that enables you to hot reload in springboot (e.g flask server in python)
	- [ ] Mount the source dir to the docker image
- [ ] putting an ingress intop of the service
	

---
## Resources
- The option `-DskipTests` for skipping the unit tests from the build process [Resource](https://www.journaldev.com/33645/maven-commands-options-cheat-sheet)
- [Enable cashing for mvn](https://stackoverflow.com/a/7233762)
- [How to create secrets for kuberntes](https://docs.oracle.com/en/industries/communications/cloud-native-core/2.2.0/nssf_install/create-kubernetes-secret-storing-database-username-and-password.html)
- [ConfigMaps from k8s official docs](https://kubernetes.io/docs/concepts/configuration/configmap/)
- [Why data in secrets is base64 encoded](https://stackoverflow.com/a/57670114)
- [Creating a mysql volume and volume claim](https://dev.to/musolemasu/deploy-a-mysql-database-server-in-kubernetes-static-dpc)
- [**Deploying a fullstack mysql+springboot+react using k8s**](https://www.callicoder.com/deploy-spring-mysql-react-nginx-kubernetes-persistent-volume-secret/)
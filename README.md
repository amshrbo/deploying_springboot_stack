# Spring Boot MySQL Example
> - Setting up the dev, and production envs for a springboot stack (springboot, and mysql).
> - [Source repo](https://github.com/springframeworkguru/spring-boot-mysql-example) for the springboot app 

## Dev environment
- [ ] Create the dev env
	- [ ] Create a docker file for springboot app
	- [ ] Create a compose file that runs app and mysql database
- [ ] Create prod env
	- [ ] Create a Deployment mainfest file for the app
	- [ ] Create a service mainfest file for the app
	- [ ] Creaet the database

---
## Ways of deployment
1. [**Deploy using docker and docker-compose**](#docker-docs-goes-here)
1. [**Deploy in Kuberentes**](provide a link for the docs here)

---
## Docker docs goes here
1. Create `.env` file with the below content for storing the db credentials
	```
	MYSQL_DB_HOST=db  #this one is necessary as it is the service name in docker-compose.yaml file
	MYSQL_DB_PORT=3306 #this is the default port used by mysql official image so don't choose any port else
	MYSQL_DB_USERNAME=amshrbo #your username
	MYSQL_DB_PASSWORD=amshrbopass #your password
	MYSQL_DB_DNAME=springbootdb #your default database username
	```
1. run the below command for starting both the database and the spring-boot service
	```
	docker-compose up --build .
	```

---
## kuberntes docs goes here



---
## Errors and trouble shooting
1. Debendancies in the `pom.xml` file specfically
	- Updating the springboot version to `2.1.6.RELEASE`
	- Adding the `maven-surefire-plugin`

## Resources
- The option `-DskipTests` for skipping the unit tests from the build process [Resource](https://www.journaldev.com/33645/maven-commands-options-cheat-sheet)
- [Enable cashing for mvn](https://stackoverflow.com/a/7233762)
- [How to create secrets for kuberntes](https://docs.oracle.com/en/industries/communications/cloud-native-core/2.2.0/nssf_install/create-kubernetes-secret-storing-database-username-and-password.html)
- [Why data in secrets is base64 encoded](https://stackoverflow.com/a/57670114)
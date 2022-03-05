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


## Errors
1. Debendancies in the `pom.xml` file specfically
	- Updating the springboot version to `2.1.6.RELEASE`
	- Adding the `maven-surefire-plugin`

## Resources
- The option `-DskipTests` for skipping the unit tests from the build process [Resource](https://www.journaldev.com/33645/maven-commands-options-cheat-sheet)
- 
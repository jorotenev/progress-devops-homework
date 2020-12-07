# progress-devops-homework
General tip: lines that start with a `$` mean that they should be executed in a CLI with the $ omitted :)

---

1. Register for Bitbucket
2. Register for DockerHub
   1. Remember your username & password :)
3. Clone this repo locally via `git`
4. Create your BitBucket repo (name it however you want)
   1. You might need to create a Project too - this is like a namespace, name is irrelevant)
   2. Don't add a readme and .gitignore so that you get a completely empty repo
5. Get the repo git https address from bitbucket (top right corner on the bitbucket repo) and add it as the origin of the repo you cloned
   1. the address should look like this `https://<your_name>@bitbucket.org/<your_name>/<your project>.git`
   2. ```$ git remote remove origin``` 
      1. we want to remove any link from my homework repo so that you can point the repo to your own one :)
   3. `$ git remote add origin <the https address you copied from bitbucket>`
      
6. Push your local repository to your bitbucket repo
   1. `$ git push origin master`
7. Go to bitbucket-> your repo, Repository settings-> Pipelines -> 
   1. Settings -> enable the "Enable Pipelines"
   2. Go to Pipelines -> Reposiroty Variables   
      1. check the `ci_scripts/docker-build.sh` and see which are the environmental variables you need to in the "Repository Variables" - one must be marked as `Secured`, the other one doesn't need to be
8. Create a commit on your branch which:
   1.  fixes a bug in docker-build.sh - there's a missuse of quotes which will lead to an issue with string interpolation - fix it
   2.  push the commit
   3.  open the Pipelines and click on the pipeline execution caused by your commit - check the output to ensure your image was pushed to dockerhub and that the correct string interpolation occurs in the build logs 
9.  Create a `docker-compose.yml` file in your local repo which should:
    1.  define a container ( aka "service") called `web`  
        1.  the service should use the docker image that you pushed to dockerhub
        2.  configure an environmental variable `CUSTOM_GREETING` - e.g. "progress project" 
    2.  define a container ( aka "service") called `redis_host` which is created by the `redis` docker image
    3.  add a dependancy on the `web` service on the `redis_host`
    4.  start the services in the docker-compose.yml file using the docker-compose CLI tool
    5.  go to your browser and type `localhost:8090/test_redis_write` and refresh a couple of times
    6.  voila :)



При въпроси - пишете ми мейл :)
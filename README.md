# TMDB App Deployment

Thank you for the opportunity to work on this task. Below are the detailed steps that i did.

I chosed problems (1 and 2 and some of 4)

after i forked repo to GitHub, start to do ...

###### Taske 1 ######

    I created GitHub Actions workflow (.github/workflows/app_ci.yml) to run stages (install, build, lint, test, pakage).

    during last stages i face problem  with lint and test stages (in code) that i  couldn't solve ,so i make them always True.

    I Edited Dockerfile to redise image size by use multi-staging stratgy with nginx to serve app content.

    in package state i taged image with workflow build number and latest tages, i pushed image to my DockerHub registry. take alock https://hub.docker.com/repository/docker/mohassan844/tmdb_app/general

    and you can take a look at ci pipeline here 



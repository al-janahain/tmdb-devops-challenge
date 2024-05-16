# TMDB App Deployment task for Mohamed Hassan

Thank you for the opportunity to work on this task. Below are the detailed steps that i did.

I choose problems (1 and 2 and some of 4)

after I forked the repo to GitHub, I used Some GitHub account and AWS Cloud.

start to do ...

###### Task 1 ######

    I created GitHub Actions workflow (.github/workflows/app_ci.yml) to run stages (install, build, lint, test, package).

    during run stages I faced problem with lint and test stages (in code) that I  couldn't solve ,so i make them always True.

    I Edited Dockerfile to reduce image size by using a multi-staging strategy with nginx to serve app content and custom nginx configuration in folder (nginx/reactapp.conf).

    in package state i tagged image with the workflow build number and latest tags, I pushed the image to my Docker Hub registry. take a look https://hub.docker.com/repository/docker/mohassan844/tmdb_app/general

    and you can take a look at the ci pipeline here https://github.com/al-janahain/tmdb-devops-challenge/actions/workflows/app_ci.yml

###### Task 2 ######
Step 1:- create infrastructure

    First I needed to create infrastructure and configure it, so I used Terraform for that in folder "terraform".
    creates all infra requirements AWS(VPC,subnets,EC2,SG,KeyPair,...) and used variable file to path my own values.
    in EC2 creation I installed Docker and Docker-compose by start-up script in file (terraform/user_data.sh).
    Notes:-
        I used my own public_key in the variables file to create KeyPair.
        I uploaded a private key with repo to you can access EC2 but in the Deploy stage I used GitHub secrets.

    all above steps was done by GitHub workflow(.github/workflows/terraform.yml) link https://github.com/al-janahain/tmdb-devops-challenge/actions/workflows/Terraform.yml

Step 2:- Deploy app

    I created docker-compose.yml to run myapp and nginx (as a reverse proxy) that can server multiple containers and created custom configuration to it (if you want to add domain names or anything else) in folder (nginx/reverseproxy.conf).

    I used GitHub/workflows to can get all IP's of EC2 that will run the app and store them in an inventory file, then I created an ansible playbook to copy docker-compose.yml and reverseproxy.conf files to those IPs and then start containers.

    all that done by GitHub workflow(.github/workflows/deploy.yml) link https://github.com/al-janahain/tmdb-devops-challenge/actions/workflows/deploy.yml


    you can chech app websit at http://107.20.9.82/ 

###### Some of Taske 4 ######

    I created key pairs and uploaded them in the repo (private_key,public_key.pem) also I used them in auto-created EC2 KeyPair and attached it to all EC2s automatically.

    - regarding to monitor the app and triggering restart services, maybe we can use Prometheus and Grafana for monitoring app and machine.
        also, we can write a bash script to check the status of the app URL, if it is not responding, it will restart the app by 
        "docker-compose down" then "docker-compose up -d" 

###### Critical Thinking Questions ######
 
Question Number 2:- N VMs
    we can use something like I used in Task 2 to get all IPs of the VMs first and store IPs in file, then write an ansible playbook to copy your configuration file or your updated app to VMs and restart services.
    after the playbook run you can see all VMs that succeeded or failed.


-----------
please tell me once you checked app websit at http://107.20.9.82/ to delete all infr from the cloud

Thanks Very much, and I hope to see you in a technical interview soon.

Mohamed Hassan



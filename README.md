# TMDB App Deployment

Thank you for the opportunity to work on this task. Below are the detailed steps that i did.

I chosed problems (1 and 2 and some of 4)

after i forked repo to GitHub, i used Some GitHub account and AWS Cloud.

start to do ...

###### Taske 1 ######

    I created GitHub Actions workflow (.github/workflows/app_ci.yml) to run stages (install, build, lint, test, pakage).

    during last stages i face problem  with lint and test stages (in code) that i  couldn't solve ,so i make them always True.

    I Edited Dockerfile to redise image size by use multi-staging stratgy with nginx to serve app content and custom nginx configuration in folder (nginx/reactapp.conf).

    in package state i taged image with workflow build number and latest tages, i pushed image to my DockerHub registry. take alock https://hub.docker.com/repository/docker/mohassan844/tmdb_app/general

    and you can take a look at ci pipeline here https://github.com/al-janahain/tmdb-devops-challenge/actions/workflows/app_ci.yml

###### Taske 2 ######
Step 1:- create infrastructure

    First i need to create infrastructure and configure it, so i used terraform for that in folder "terraform".
    creates all infra requirmets AWS(VPC,subnets,EC2,SG,KeyPair,...) and used variable file to path my own values.
    in EC2 creation i installed docker and docker-compose by start-up script in file (terraform/user_data.sh).
    Notes:-
        i used my own public_key in variables file to create KeyPair.
        i uploaded private key with repo to you can acces EC2 but in Deploy stage i use github secrets.

    all above steps was done by github workflow(.github/workflows/terraform.yml) link https://github.com/al-janahain/tmdb-devops-challenge/actions/workflows/Terraform.yml

Step 2:- Deploy app

    i created docker compose to run myapp and nginx (as a reverse proxy) that can server multiple containers and created customconfiguration to it (if you want to add domain names or any thing else) in folder (nginx/reverseproxy.conf).

    i used github/workflows to can get all ip's of EC2 that will run app and store them in inventory file, then i created ansible playbook to copy docker-compose.yml and reverseproxy.conf files to those ip's and then start containers.

    all that done by github workflow(.github/workflows/deploy.yml) link https://github.com/al-janahain/tmdb-devops-challenge/actions/workflows/deploy.yml

###### Some of Taske 4 ######

    i created key pairs and uploded them in repo (private_key,public_key.pem) also i used then in auto create EC2 KeyPair and attach it to all EC2's automaticaly.

    - regarding to monitor app and trigger restart services, maybe we can use Prometheus and grafana for monitoring app and machine.
        also we can write bash script to check status for app url, if it is not respobding, it will restart app by 
        "docker-compose down" then "docker-compose up -d" 


###### Critical Thinking Questions ######
 
Question Number 2:- N VMs
    we can use somthing like i used in taske 2 to get all IP's of VMs first and store IP's in file,then write ansible playbook to copy your configration file or your updated app to VMs and restart services.
    after playbook run you can see all VM's that successed or failed.

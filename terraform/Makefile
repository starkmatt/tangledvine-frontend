RUN = docker-compose run --rm

#Tasks

init:
	terraform init
.PHONY: init

_awsinit:
	mkdir -p creds
	aws configure
.PHONY: _awsinitss

destroy:

.PHONY: destroy

build:
	terraform apply -target module.ecr -var-file="tangledv.tfvars" -auto-approve
	bash -x ../scripts/push.sh
.PHONY: build

luxvpc:
	terraform apply -target module.vpc -var-file="tangledv.tfvars" -auto-approve

plan:
	terraform plan -var-file="tangledv.tfvars" -out=.terraform-plan 
.PHONY: plan

apply:
	terraform apply .terraform-plan 
.PHONY: apply

destroy:
	terraform destroy -var-file="tangledv.tfvars" -auto-approve
.PHONY: destroy

all:
	make _awsinit
	make init
	make build
	make plan
	make apply
.PHONY: all
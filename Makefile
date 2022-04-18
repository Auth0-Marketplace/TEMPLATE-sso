lint: 
	docker run --rm -t -v `pwd`/integration/:/data/integration/ auth0josh/auth0-integration-testing npm run integration:lint

test: 
	docker run --rm -t -v `pwd`/integration/:/data/integration/ auth0josh/auth0-integration-testing npm run test:sso

zip: 
	zip -r integration-sso.zip integration

deploy_init:
	docker run --rm -it -v `pwd`/integration/:/data/integration/ -v `pwd`/deploy:/data/deploy auth0josh/auth0-integration-testing bash deploy-scripts/init.sh

deploy_get_token:
	docker run --rm -t -v `pwd`/integration/:/data/integration/ -v `pwd`/deploy:/data/deploy auth0josh/auth0-integration-testing bash deploy-scripts/get-token.sh

deploy_create:
	docker run --rm -t -v `pwd`/integration/:/data/integration/ -v `pwd`/deploy:/data/deploy auth0josh/auth0-integration-testing bash deploy-scripts/sso-create.sh

deploy_get:
	docker run --rm -t -v `pwd`/integration/:/data/integration/ -v `pwd`/deploy:/data/deploy auth0josh/auth0-integration-testing bash deploy-scripts/sso-get.sh

deploy_get_all:
	docker run --rm -t -v `pwd`/integration/:/data/integration/ -v `pwd`/deploy:/data/deploy auth0josh/auth0-integration-testing bash deploy-scripts/sso-get-all.sh

deploy_update:
	docker run --rm -t -v `pwd`/integration/:/data/integration/ -v `pwd`/deploy:/data/deploy auth0josh/auth0-integration-testing bash deploy-scripts/sso-update.sh

deploy_delete:
	docker run --rm -t -v `pwd`/integration/:/data/integration/ -v `pwd`/deploy:/data/deploy auth0josh/auth0-integration-testing bash deploy-scripts/sso-delete.sh
.PHONY: help run install

.DEFAULT_GOAL=help

help: ## Show help comments for the targets
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-10s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

install: ## Install the application
	sudo apt install python3-dev virtualenv
	virtualenv -p python3 --no-site-packages --distribute .env && source .env/bin/activate
	.env/bin/pip3 install -r requirements.txt

run: ## Run the application
	sudo .env/bin/python3 -m Sniffer.Application

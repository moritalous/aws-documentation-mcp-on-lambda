build-MCPStreamableFunction:
	mkdir -p $(ARTIFACTS_DIR)
	cp -r requirements.txt app.py run.sh $(ARTIFACTS_DIR)
	cd $(ARTIFACTS_DIR) && pip install -r requirements.txt --target .
	chmod +x $(ARTIFACTS_DIR)/run.sh

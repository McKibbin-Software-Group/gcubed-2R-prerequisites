# Target to add (stage) changes, commit them to the local repository and push them to the Github remote repository.
add_commit_and_push:
	@read -p "Enter commit message: " message; \
	echo "Adding changes..."; \
	git add .; \
	echo "Committing changes..."; \
	git commit -m "$$message"; \
	echo "Pushing to remote repository..."; \
	git push; \
	echo "Done"

commit:
	@read -p "Enter commit message: " message; \
	echo "Adding changes..."; \
	git add .; \
	echo "Committing changes..."; \
	git commit -m "$$message"; \
	echo "Done"

push:
	@echo "Pushing to remote repository..."; \
	git push; \
	echo "Done"

tag:
	@read -p "Enter tag to reassign: " tagname; \
	if git rev-parse "$$tagname" >/dev/null 2>&1; then \
		git tag -d "$$tagname"; \
		git push origin :refs/tags/$$tagname; \
	fi; \
	git tag "$$tagname"; \
	git push origin "$$tagname"; \
	echo "The $$tagname tag has been reassigned."

tags:
	@echo "The tags in this repository are ..."; \
	git tag

.PHONY: add_commit_and_push,commit,push,tag,tags

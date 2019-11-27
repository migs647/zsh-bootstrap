########################################
## Bootstrap
bootstrap: changeshell downloadohmyzsh copytheme installxcversion
	
	
changeshell:
	@echo "Changing default shell"
	sudo chsh -s /bin/zsh	

downloadohmyzsh:
	@echo "Downloading OhMyZsh"
	sh -c "$$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

copytheme:
	@echo "Copying White Themes"
	cp oh-my-zsh/themes/* ~/.oh-my-zsh/themes/
	cp .zshrc ~/
	@echo "Updating ~.zshrc"
	$(MAKE) updatehome

updatehome:
	sed -i "" "s|USERZ|${HOME}|g" ~/.zshrc

installxcversion:
	sudo gem install xcode-install
	@read -p "Enter FASTLANE / Apple Dev email: " devemail; \
	sed -i "" "s/<email>/$$devemail/g" ~/.zshrc

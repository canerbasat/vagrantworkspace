##
# add this to your provision.sh
#
# [!] run as 'vagrant' like this:
# su vagrant -c "source ${PROVISION_DIR}/provision-node.sh"
#
# [!] please keep the echo messages. those actions could take some more time without any output, so let the user know.
##

# install latest nvm
git clone https://github.com/creationix/nvm.git ~/.nvm && cd ~/.nvm && git checkout `git describe --abbrev=0 --tags`
source ~/.nvm/nvm.sh
echo "source ~/.nvm/nvm.sh" >> ~/.bashrc

# install latest stable node.js
echo "Installing node.js... (please be patient)"
nvm install stable &> /dev/null
nvm alias default stable

# install global node packages
echo "Installing global node.js packages... (please be patient)"
# change 'gulp' to 'grunt' depending on project setup
npm install -g gulp bower npm-check-updates

# install project dependencies and build
cd /vagrant/
echo "Installing local node.js packages... (please be patient)"
npm install
bower install
# see package.json for respective build task
npm run build-dev
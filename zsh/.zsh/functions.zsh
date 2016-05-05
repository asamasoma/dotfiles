# Helper functions to switch Java versions

function switchjava() {
    pushd /Library/Java > /dev/null
    sudo rm Home
    sudo ln -s "Home${1}" Home
    popd > /dev/null
}
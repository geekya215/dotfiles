# clone devicon repo
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons

echo "update ranger config file..."

# update ranger config 
echo "default_linemode devicons" >> $HOME/.config/ranger/rc.conf

echo "update done."

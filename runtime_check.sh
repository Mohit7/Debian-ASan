#Script for installing .debs in current folder, and executing it so that we can
#get run time address sanitizer errors


#Get list of packages in current directory 
ls -ld *|awk '{print $9}' &> packages.list

declare -i package_no=0
while IFS= read -r package_name;do
    echo "-------------------------------------------------------------------"
    package_no=$((package_no + 1))
    echo $package_no
    echo $package_name

    # Check if package is already installed
    if !(dpkg-query -l $package_name); then
	dpkg -i $package_name/*.deb
	apt-get -f --yes --force-yes install
	/usr/bin/$package_name
	apt-get remove $package_name
    fi
    /usr/bin/$package_name

    echo "-------------------------------------------------------------------"
done < packages.list


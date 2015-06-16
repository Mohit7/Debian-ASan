#Get list of packages and parse their names
wget -q -O - ftp://ftp.debian.org/debian/dists/sid/main/source/Sources.gz | zgrep '^Package: ' &> packages.list
sed -i -- 's/Package: //g' packages.list

# Add ASan in build options 
export DEB_BUILD_MAINT_OPTIONS=sanitize=+address

declare -i package_no=0
while IFS= read -r package_name;do
    echo "-------------------------------------------------------------------"
    package_no=$((package_no + 1))
    echo $package_no
    echo $package_name

    # Download source of package and go into its build directory
    apt-get source $package_name
    cd $package_name*

    # Build all the dependencies for this package
    apt-get build-dep --yes --force-yes $package_name

    # Start building the package
    dpkg-buildpackage -us -uc
    
    cd /home/mohit/soc15/buildspace1/

    # Upload binary to repository
    reprepro -b /var/www/repos/apt/debian/ includedeb sid $package_name*.deb
    echo "-------------------------------------------------------------------"
done < packages.list

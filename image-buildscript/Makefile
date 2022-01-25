.PHONY: package copy_packages build clean
all: package build

package: 
	cd package-to-build/hadoop && makepkg -s
	cd package-to-build/apache-spark && makepkg -s
	
copy_packages:
	cp package-to-build/hadoop/hadoop-3.3.1-1-x86_64.pkg.tar.gz packages/hadoop-3.3.1-1-x86_64.pkg.pacman
	cp package-to-build/apache-spark/apache-spark-3.2.0-0-any.pkg.tar.zst packages/apache-spark-3.2.0-0-any.pkg.pacman

build: copy_packages
	./build-host.sh
	
clean: 
	rm -rf output tmp
	rm -rf package-to-build/hadoop/src package-to-build/hadoop/pkg package-to-build/hadoop/*.gz
	rm -rf package-to-build/apache-spark/src package-to-build/apache-spark/pkg package-to-build/apache-spark/*.tgz package-to-build/apache-spark/*.zst
	rm -rf packages/*.pacman

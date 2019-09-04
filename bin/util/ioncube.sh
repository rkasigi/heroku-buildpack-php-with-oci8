#!/usr/bin/env bash

install_ioncube_ext() {

    status "Starting process install_ioncube_ext"

    curl_retry_on_18 --fail --silent --location -o $build_dir/.heroku/php/ioncube.tar.gz "https://github.com/rkasigi/heroku-buildpack-php-repository/blob/master/dist-heroku-18-stable/extensions/no-debug-non-zts-20180731/ioncube.tar.gz" || {
    	mcount "failures.bootstrap.download.ioncube"
    	error <<-EOF
    		Failed to download ioncube extension!
EOF
    }

    tar xzf $build_dir/.heroku/php/ioncube.tar.gz -C $build_dir/.heroku/php
    rm $build_dir/.heroku/php/ioncube.tar.gz

    status "Finished process install_ioncube_ext"

}
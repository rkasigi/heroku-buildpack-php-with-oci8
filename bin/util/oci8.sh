#!/usr/bin/env bash

install_oci8_ext() {
	# special treatment for oci8;
	# otherwise users would have to have it in their require section, which is annoying in development environments

    status "start process install_oci8_ext"
    status `whoami`

	if [[ "$engine" == "php" ]] && ! $engine -n $(which composer) show -d "$build_dir/.heroku/php" --installed --quiet heroku-sys/ext-oci8 2>/dev/null; then
	    status "installing instaclient"
		# sh -c "echo '/app/.heroku/php/lib/instantclient_11_2' > /etc/ld.so.conf.d/oracle-instantclient.conf"
		# ldconfig

        if [ -z ${LD_LIBRARY_PATH+x} ]; then export LD_LIBRARY_PATH=/app/.heroku/php/lib/instantclient_11_2; else export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/app/.heroku/php/lib/instantclient_11_2; fi

		# echo "if [ -z ${LD_LIBRARY_PATH+x} ]; then export LD_LIBRARY_PATH=/app/.heroku/php/lib/instantclient_11_2; else export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/app/.heroku/php/lib/instantclient_11_2; fi" >> /app/.profile.d/00-global-env.sh
	fi

	status $engine
	status "done process install_oci8_ext"

}

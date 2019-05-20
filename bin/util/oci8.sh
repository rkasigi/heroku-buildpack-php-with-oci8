#!/usr/bin/env bash

install_oci8_ext() {
	# special treatment for oci8;
	# otherwise users would have to have it in their require section, which is annoying in development environments

    status "start process install_oci8_ext"
    status whoami

	if [[ "$engine" == "php" ]] && ! $engine -n $(which composer) show -d "$build_dir/.heroku/php" --installed --quiet heroku-sys/ext-oci8 2>/dev/null; then
	    status "installing instaclient"
		sh -c "echo '/app/.heroku/php/lib/instantclient_11_2' > /etc/ld.so.conf.d/oracle-instantclient.conf"
		ldconfig
	fi

	status $engine
	status "done process install_oci8_ext"

}

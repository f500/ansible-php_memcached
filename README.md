php_memcached
========

Install memcached extension for PHP (from pear)
Also installs igbinary as a fast serializer.

Requirements
------------

Debian Wheezy with the package python-pycurl and python-software-properties installed.

Role Variables
--------------

    php_igbinary_compact_strings: "On"
    php_igbinary_session_serialize_handler: "igbinary"

    php_memcached_compression_factor: 1.3
    php_memcached_compression_threshold: 2000
    php_memcached_compression_type: "fastlz"
    php_memcached_serializer: "igbinary"
    php_memcached_sess_binary: 1
    php_memcached_sess_consistent_hash: 0
    php_memcached_sess_lock_wait: 150000
    php_memcached_sess_locking: 1
    php_memcached_sess_number_of_replicas: 0
    php_memcached_sess_prefix: "memc.sess.key."
    php_memcached_sess_randomize_replica_read: 0
    php_memcached_sess_remove_failed: 0
    php_memcached_use_sasl: 0

    # php services

    # available: apache2, apache2filter, cgi, cli, fpm
    php_memcached_versions: []

Dependencies
------------

Depends on f500.php, f500.php_dev, php5_pear for PHP extensions.
Also depends on f500.memcached.

Example Playbook
-------------------------

    - hosts: servers
      roles:
         - { role: f500.php_memcached }

License
-------

LGPL

Author Information
------------------

Jasper N. Brouwer, jasper@nerdsweide.nl

Ramon de la Fuente, ramon@delafuente.nl

class glexecwn::services {

    service {['fetch-crl-boot','fetch-crl-cron']:
        ensure => stopped,
        enable => false,
    }

}

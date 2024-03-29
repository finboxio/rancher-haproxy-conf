
0.11.0 / 2023-02-22
==================

  * Swap dns providers from route53 to cloudflare (#4)

0.10.7 / 2022-11-13
==================

  * Fix docker build

0.10.6 / 2022-11-13
==================

  * Fix nil host pointer

0.10.5 / 2022-06-26
==================

  * Conf fixes

0.10.4 / 2022-06-26
==================

  * Fix conf template bug

0.10.3 / 2022-06-26
==================

  * Support for cloudflare ip headers

0.10.2 / 2022-02-11
==================

  * Support proxy-protocol for monitor uri

0.10.1 / 2022-02-07
==================

  * Improve haproxy cert replacement logic

0.10.0 / 2022-02-04
==================

  * Tie healthcheck to host state, unhealthy if inactive

0.9.0 / 2022-02-04
==================

  * Support haproxy healthchecks on host reachability

0.8.0 / 2021-11-07
==================

  * Support custom backend balancer & retry configuration

0.7.0 / 2021-09-22
==================

  * Fix wildcard host support
  * ignore non-https domains wrt letsencrypt
  * security for x-forwarded-for header
  * rewrite host to x-forwarded-host

0.6.0 / 2021-09-22
==================

  * Support prometheus stats exporter

0.5.0 / 2021-09-16
==================

  * Add support for hostname port and explicit https enforcement

0.4.0 / 2021-09-05
==================

  * Support multiple frontends to same port (#3)

0.3.0 / 2021-09-01
===================

  * Support multiple frontends using different certs and letsencrypt opt-out (#2)

0.2.1 / 2021-07-19
==================

  * Update rancher-conf

0.2.0 / 2021-07-10
==================

  * Move proxy protocol to different port
  * Add connect retries and service healthchecks

0.1.3 / 2021-06-16
==================

  * Update rancher-conf

0.1.2 / 2021-06-12
==================

  * switch to version-cmd

0.1.1 / 2021-06-12
==================

  * Update rancher-conf

0.1.0 / 2021-03-31
==================

  * bind to additional ports without proxy protocol
  * ignore port in host matching

0.0.14 / 2020-11-02
==================

  * tcp stats socket support

0.0.13 / 2020-10-31
==================

  * Reload haproxy only if cert changed

0.0.12 / 2020-08-28
===================

  * Fix cert inconsistencies

0.0.11 / 2020-08-24
===================

  * Slack warnings for expiring certificates (#1)

0.0.10 / 2020-02-10
===================

  * Fix for stacks with no containers

0.0.9 / 2020-02-10
==================

  * Support for root domains (non-wildcard)

0.0.8 / 2020-02-03
==================

  * fix cert inconsistency

0.0.7 / 2020-02-01
==================

  * Fix domain sort

0.0.6 / 2020-02-01
==================

  * Replace deprecated reqirep directive

0.0.5 / 2020-01-31
==================

  * Move s3 logic out

0.0.4 / 2020-01-31
==================

  * Remove dry-run from cert renewal script

0.0.3 / 2020-01-31
==================

  * Fix dockerfile

0.0.2 / 2020-01-31
==================

  * Repo cleanup

0.0.1 / 2020-01-31
==================

  * Initial functional release

0.0.0 / 2020-01-30
==================

  * Initial commit

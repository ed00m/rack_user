rack_user CHANGELOG
==================

0.2.0
-----

Adding support for external password creation.
Updating existing remove tests.

0.1.1
-----

Allow ssh nopassword to not lock rack user. It allows to ssh as rack even when UsePAM no is set
http://arlimus.github.io/articles/usepam/

0.1.0
-----

Do not call the default recipes for sudo (not needed for for LWRP call with rack user) or user (no-op anyway).

0.0.2
-----
Allow for redirects on `location` parameter to resource.

0.0.1
-----
Initial release.
